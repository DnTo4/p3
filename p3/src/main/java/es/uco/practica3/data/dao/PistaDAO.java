package es.uco.practica3.data.dao;

// Importaciones necesarias para la funcionalidad del DAO
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;

import es.uco.practica3.business.DTO.PistaDTO;
import es.uco.practica3.data.common.DBConnection;

import java.util.List;
import java.util.Properties;
import java.util.ArrayList;

/**
 * Clase PistaDAO.
 * 
 * Esta clase es una implementación del patrón Data Access Object (DAO) para manejar la persistencia de
 * objetos de tipo PistaDTO (representando una pista) en una base de datos. Sus métodos permiten crear,
 * listar y borrar registros de pistas.
 */
public class PistaDAO {

    public PistaDAO() {
    }

    /**
     * Crea una nueva pista en la base de datos.
     * 
     * @param pista Objeto PistaDTO que contiene la información de la pista a crear.
     * @return Un valor entero que representa el estado de la operación:
     *         -1 si ocurrió un error, o el número de filas afectadas si la operación fue exitosa.
     */
    public int crearPista(PistaDTO pista) {
        int status = -1;
        try {
            DBConnection dbConnection = new DBConnection();
            Connection con = dbConnection.getConnection();

            PreparedStatement stmt = con.prepareStatement("select * from pistas where nombre = ?");
            stmt.setString(1, pista.getNombre());
            ResultSet rs = stmt.executeQuery();

            if (!rs.next()) {
                PreparedStatement ps = con.prepareStatement("insert into pistas (nombre,estado,tipo,tamanio,jugadores_max) values(?,?,?,?,?)");
                ps.setString(1, pista.getNombre());
                ps.setInt(2, pista.getEstado());
                ps.setInt(3, pista.getTipo());
                ps.setInt(4, pista.getTamanio());
                ps.setInt(5, pista.getJugadores_max());

                status = ps.executeUpdate();
            }

            return status;

        } catch (Exception e) {
            System.err.println(e);
            e.printStackTrace();
            return -1; // CUIDADO
        }
    }

    /**
     * Lista todas las pistas presentes en la base de datos.
     * 
     * @return Una lista de objetos PistaDTO que representan las pistas. Devuelve null si ocurre un error.
     */
    public List<PistaDTO> ListarPistas() {
        List<PistaDTO> lista = new ArrayList<>();

        try {
            DBConnection dbConnection = new DBConnection();
            Connection con = dbConnection.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from pistas");

            while (rs.next()) {
                String nombre = rs.getString("nombre");
                int estado = rs.getInt("estado");
                int tipo = rs.getInt("tipo");
                int tamanio = rs.getInt("tamanio");
                int jugadores = rs.getInt("jugadores_max");
                PistaDTO pista = new PistaDTO(nombre, estado, tipo, tamanio, jugadores);
                lista.add(pista);
            }
            if (stmt != null) {stmt.close();}

            return lista;

        } catch (Exception e) {
            System.err.println(e);
            e.printStackTrace();
            return null; // CUIDADO
        }
    }

    /**
     * Borra una pista de la base de datos.
     * 
     * @param pista Objeto PistaDTO que representa la pista a borrar.
     * @return Un valor entero que representa el estado de la operación:
     *         -1 si ocurrió un error, o el número de filas afectadas si la operación fue exitosa.
     */
    public int borrarPista(PistaDTO pista) {
        try {
            int status = 0;

            DBConnection dbConnection = new DBConnection();
            Connection con = dbConnection.getConnection();

            PreparedStatement ps = con.prepareStatement("delete from pistas where nombre=?");
            ps.setString(1, pista.getNombre());

            status = ps.executeUpdate();

            return status;

        } catch (Exception e) {
            System.err.println(e);
            e.printStackTrace();
            return -1;
        }
    }

    public List<PistaDTO> buscarPistasDisponibles(int tipo, Date fecha) {
    List<PistaDTO> lista = new ArrayList<>();
    String sql = "SELECT * FROM pistas WHERE tipo = ? AND p.id NOT IN (SELECT id_pista FROM reservas WHERE fecha = ?) AND estado = 1";
    try {
        DBConnection dbConnection = new DBConnection();
        Connection con = dbConnection.getConnection();
        
        PreparedStatement stmt = con.prepareStatement(sql);

        stmt.setInt(1, tipo);  // Tipo de pista (interior o exterior)
        stmt.setDate(2, fecha); // Fecha de búsqueda

        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("id");
            String nombre = rs.getString("nombre");
            int estado = rs.getInt("estado");
            int tamanio = rs.getInt("tamanio");
            int jugadoresMax = rs.getInt("jugadores_max");
            PistaDTO pista = new PistaDTO(nombre, estado, tipo, tamanio, jugadoresMax);
            pista.setId(id);
            lista.add(pista);
        }

        if (stmt != null) {
            stmt.close();
        }

        } catch (SQLException e) {
            System.err.println("Error al realizar la búsqueda de pistas disponibles: " + e.getMessage());
        }
        return lista;
    }
    
    public int modificarEstadoPista(String nombre, int estado)
    {
    	int status = 0;
    	try {
    		DBConnection dbConnection = new DBConnection();
            Connection con = dbConnection.getConnection();
            
            PreparedStatement stmt = con.prepareStatement("UPDATE pistas SET estado = ? WHERE nombre = ?");
            stmt.setInt(1, estado);
            stmt.setString(2, nombre);
            
            status = stmt.executeUpdate();
    	}catch (SQLException e) {
            System.err.println("Error al modificar la pista: " + e.getMessage());
            return -1;
        }
    	
    	 return status;
    }
    
    public int existePista(String nombre)
    {
    	int status = 0;
    	try {
    		DBConnection dbConnection = new DBConnection();
            Connection con = dbConnection.getConnection();
            
            PreparedStatement stmt = con.prepareStatement("select * from pista where nombre = ?");
            stmt.setString(1, nombre);
            
            ResultSet rs = stmt.executeQuery();
            while(rs.next()) {status += 1;}
    	}catch (SQLException e) {
            System.err.println("Error al buscar la pista: " + e.getMessage());
            return -1;
        }
    	
    	 return status;
    }
    
    public int modificarEstadoMat(int tipo, int estado)
    {
    	int status = 0;
    	try {
    		
    		String sql = "UPDATE materiales SET estado = ? WHERE id = (SELECT id FROM materiales WHERE tipo = ? ORDER BY id ASC LIMIT 1)";
    		DBConnection dbConnection = new DBConnection();
            Connection con = dbConnection.getConnection();
            
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, estado);
            stmt.setInt(2, tipo);
            
            ResultSet rs = stmt.executeQuery();
            
            if(rs.next()) {status = rs.getInt("id");}
    	}catch(SQLException e)
    	{
    		System.err.println("Error al modificar el material: " + e.getMessage());
            return -1;
    	}
    	return status;
    }
}
