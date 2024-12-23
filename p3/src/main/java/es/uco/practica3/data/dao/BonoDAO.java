package es.uco.practica3.data.dao;

import es.uco.practica3.business.DTO.BonoDTO;
import es.uco.practica3.data.common.DBConnection;

// Importaciones necesarias:
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

/**
 * La clase BonoDAO es responsable de gestionar las operaciones de acceso a datos relacionadas
 * con los bonos en la base de datos. Proporciona métodos para crear, obtener, actualizar y eliminar bonos.
 */
public class BonoDAO {

    public BonoDAO() {
    }
    
    /**
     * Crea un nuevo bono en la base de datos.
     *
     * @param bono El objeto BonoDTO que contiene la información del bono a crear.
     * @return true si el bono se creó con éxito, false en caso contrario.
     */
    public boolean createBono(BonoDTO bono) {
    	DBConnection dbConnection = new DBConnection();
        Connection connection = dbConnection.getConnection();
        PreparedStatement preparedStatement = null;
        boolean created = false;

        try {
            connection = dbConnection.getConnection();
            String sql = "INSERT INTO bonos (tamanio_pista, id_jugador, sesiones, fecha_cad) VALUES (?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, bono.getTamanio_pista());
            preparedStatement.setInt(2, bono.getId_jugador());
            preparedStatement.setInt(3, bono.getSesiones());
            preparedStatement.setDate(4, new java.sql.Date(bono.getFecha_cad().getTime()));

            created = preparedStatement.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return created;
    }

    /**
     * Obtiene un bono de la base de datos basado en su ID.
     *
     * @param id El identificador del bono a recuperar.
     * @return Un objeto BonoDTO que representa el bono, o null si no se encuentra.
     */
    public BonoDTO getBonoById(int id) {
    	DBConnection dbConnection = new DBConnection();
        Connection connection = dbConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        BonoDTO bono = null;

        try {
            String sql = "SELECT * FROM bonos WHERE id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                bono = new BonoDTO();
                bono.setId(resultSet.getInt("id"));
                bono.setTamanio_pista(resultSet.getInt("tamanio_pista"));
                bono.setId_jugador(resultSet.getInt("id_jugador"));
                bono.setSesiones(resultSet.getInt("sesiones"));
                bono.setFecha_cad(resultSet.getDate("fecha_cad"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bono;
    }

    /**
     * Obtiene una lista de todos los bonos asociados a un jugador específico.
     *
     * @param id_jugador El identificador del jugador cuyo bonos se desean recuperar.
     * @return Una lista de objetos BonoDTO que representan los bonos asociados al jugador.
     */
    public List<BonoDTO> getBonosByJugadorId(int id_jugador) {
    	DBConnection dbConnection = new DBConnection();
        Connection connection = dbConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<BonoDTO> bonos = new ArrayList<>();

        try {
            String sql = "SELECT * FROM bonos WHERE id_jugador = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id_jugador);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                BonoDTO bono = new BonoDTO();
                bono.setId(resultSet.getInt("id"));
                bono.setTamanio_pista(resultSet.getInt("tamanio_pista"));
                bono.setId_jugador(resultSet.getInt("id_jugador"));
                bono.setSesiones(resultSet.getInt("sesiones"));
                bono.setFecha_cad(resultSet.getDate("fecha_cad"));
                bonos.add(bono);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bonos;
    }

    /**
     * Actualiza la información de un bono existente en la base de datos.
     *
     * @param bono El objeto BonoDTO que contiene la nueva información del bono.
     * @return true si el bono se actualizó con éxito, false en caso contrario.
     */
    public boolean updateBono(BonoDTO bono) {
    	DBConnection dbConnection = new DBConnection();
        Connection connection = dbConnection.getConnection();
        PreparedStatement preparedStatement = null;
        boolean updated = false;

        try {
            String sql = "UPDATE bonos SET tamanio_pista = ?, id_jugador = ?, sesiones = ?, fecha_cad = ? WHERE id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, bono.getTamanio_pista());
            preparedStatement.setInt(2, bono.getId_jugador());
            preparedStatement.setInt(3, bono.getSesiones());
            preparedStatement.setDate(4, new java.sql.Date(bono.getFecha_cad().getTime()));
            preparedStatement.setInt(5, bono.getId());

            updated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return updated;
    }

    /**
     * Elimina un bono de la base de datos basado en su ID.
     *
     * @param id El identificador del bono a eliminar.
     * @return true si el bono se eliminó con éxito, false en caso contrario.
     */
    public boolean deleteBono(int id) {
    	DBConnection dbConnection = new DBConnection();
        Connection connection = dbConnection.getConnection();
        PreparedStatement preparedStatement = null;
        boolean deleted = false;

        try {
            String sql = "DELETE FROM bonos WHERE id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);

            deleted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return deleted;
    }
