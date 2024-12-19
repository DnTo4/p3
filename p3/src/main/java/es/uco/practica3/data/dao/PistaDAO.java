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

    private Properties propiedades = new Properties();

    /**
     * Constructor de la clase PistaDAO.
     * 
     * Este constructor carga las propiedades de configuración necesarias para las consultas SQL
     * desde un archivo llamado "sql.properties". Si hay un error al cargar las propiedades,
     * se muestra un mensaje de error en la consola.
     */
    public PistaDAO() {
        try (InputStream input = new FileInputStream("sql.properties")) {
            this.propiedades.load(input);
        } catch (IOException ex) {
            System.out.println("Error al cargar las propiedades: " + ex.getMessage());
            return;
        }
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

            PreparedStatement stmt = con.prepareStatement(this.propiedades.getProperty("crearPistSelect"));
            stmt.setString(1, pista.getNombre());
            ResultSet rs = stmt.executeQuery();

            if (!rs.next()) {
                PreparedStatement ps = con.prepareStatement(this.propiedades.getProperty("crearPistInsert"));
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
            ResultSet rs = stmt.executeQuery(this.propiedades.getProperty("listPistSelect"));

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

            PreparedStatement ps = con.prepareStatement(this.propiedades.getProperty("borrarPistDelete"));
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
    try {
        DBConnection dbConnection = new DBConnection();
        Connection con = dbConnection.getConnection();

        // Consulta SQL para encontrar pistas disponibles según tipo y fecha
        String query = "SELECT p.id, p.nombre, p.estado, p.tipo, p.tamanio, p.jugadores_max " +
                       "FROM pistas p " +
                       "WHERE p.tipo = ? " +
                       "AND p.id NOT IN (" +
                       "    SELECT r.id_pista " +
                       "    FROM reservas r " +
                       "    WHERE r.fecha = ?)" +
                       "AND p.estado = 1";  // Solo se consideran pistas activas (estado = 1)

        PreparedStatement stmt = con.prepareStatement(query);
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
}
