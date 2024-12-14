<<<<<<<< HEAD:src/main/java/es/uco/practica3/data/dao/ReservaDAO.java
package es.uco.practica3.data.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Types;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import es.uco.practica3.business.*;
import es.uco.practica3.data.common.DBConnection;

/**
 * Clase ReservaDAO.
 * 
 * Esta clase gestiona las reservas en la base de datos. Proporciona métodos 
 * para crear, modificar, cancelar y listar reservas. La clase también maneja 
 * la conexión con la base de datos y las operaciones relacionadas a las reservas.
 */
public class ReservaDAO {
	
	private Properties propiedades = new Properties();
	
	/**
	 * Constructor de ReservaDAO.
	 * 
	 * Carga las propiedades necesarias para realizar las consultas SQL desde 
	 * un archivo de configuración.
	 */
	public ReservaDAO() {
		try (InputStream input = new FileInputStream("sql.properties")) {
			this.propiedades.load(input);
		} catch (IOException ex) {
			System.out.println("Error al cargar las propiedades: " + ex.getMessage());
			return;
		}
	}
	
	/**
	 * Crea una reserva individual.
	 * 
	 * @param reserva Objeto ReservasDTO que contiene la información de la reserva.
	 * @param correo Email del usuario que realiza la reserva.
	 */
	public void crearReservaIndividual(ReservasDTO reserva, String correo) {
		try {
			DBConnection dbConnection = new DBConnection();
			Connection con = dbConnection.getConnection();
			PreparedStatement ps = null;
			ps = con.prepareStatement(this.propiedades.getProperty("crearResISelect"));
			ps.setString(1, correo);
			ResultSet id_jugador = ps.executeQuery();
			if (!id_jugador.next()) {
				return;
			}
			switch (reserva.getTipo_reserva()) {
				case 0: // adultos
					ps = con.prepareStatement(this.propiedades.getProperty("crearResInsert"));
					ps.setInt(1, reserva.getId());	
					ps.setDate(2, new java.sql.Date(reserva.getFecha().getTime()));
					ps.setInt(3, reserva.getDuracion());
					ps.setInt(4, reserva.getId_pista());
					ps.setFloat(5, reserva.getPrecio());
					ps.setFloat(6, reserva.getDescuento());	
					ps.setInt(7, reserva.getTipo_reserva());
					ps.setInt(8, 0);
					ps.setInt(9, reserva.getNum_adultos());
					ps.setNull(10, Types.INTEGER);
					ps.setInt(11, id_jugador.getInt("id"));
					ps.executeUpdate();
					break;
				case 1: // infantil
					ps = con.prepareStatement(this.propiedades.getProperty("crearResInsert"));
					ps.setInt(1, reserva.getId());	
					ps.setDate(2, new java.sql.Date(reserva.getFecha().getTime()));
					ps.setInt(3, reserva.getDuracion());
					ps.setInt(4, reserva.getId_pista());
					ps.setFloat(5, reserva.getPrecio());
					ps.setFloat(6, reserva.getDescuento());	
					ps.setInt(7, reserva.getTipo_reserva());
					ps.setInt(8, reserva.getNum_ninios());
					ps.setInt(9, 0);
					ps.setNull(10, Types.INTEGER);
					ps.setInt(11, id_jugador.getInt("id"));
					ps.executeUpdate();
					break;
				case 2: // familiar
					ps = con.prepareStatement(this.propiedades.getProperty("crearResInsert"));
					ps.setInt(1, reserva.getId());	
					ps.setDate(2, new java.sql.Date(reserva.getFecha().getTime()));
					ps.setInt(3, reserva.getDuracion());
					ps.setInt(4, reserva.getId_pista());
					ps.setFloat(5, reserva.getPrecio());
					ps.setFloat(6, reserva.getDescuento());	
					ps.setInt(7, reserva.getTipo_reserva());
					ps.setInt(8, reserva.getNum_ninios());
					ps.setInt(9, reserva.getNum_adultos());
					ps.setNull(10, Types.INTEGER);
					ps.setInt(11, id_jugador.getInt("id"));
					ps.executeUpdate();
					break;
				default:
					System.out.println("Opción no válida.");
			}	
		} catch (Exception e) {
			System.err.println(e);
			e.printStackTrace();
		}
	}
	
	/**
	 * Crea una reserva utilizando un bono.
	 * 
	 * @param reserva Objeto ReservasDTO que contiene la información de la reserva.
	 * @param correo Email del usuario que realiza la reserva.
	 */
	public void crearReservaBono(ReservasDTO reserva, String correo) {
		try {
			DBConnection dbConnection = new DBConnection();
			Connection con = dbConnection.getConnection();
			PreparedStatement ps = null;
			ps = con.prepareStatement(this.propiedades.getProperty("crearResBSelect"));
			ps.setString(1, correo);
			ResultSet id_jugador = ps.executeQuery();
			if (!id_jugador.next()) {
				return;
			}
			switch (reserva.getTipo_reserva()) {
				case 0: // adultos
					ps = con.prepareStatement(this.propiedades.getProperty("crearResInsert"));
					ps.setInt(1, reserva.getId());	
					ps.setDate(2, new java.sql.Date(reserva.getFecha().getTime()));
					ps.setInt(3, reserva.getDuracion());
					ps.setInt(4, reserva.getId_pista());
					ps.setFloat(5, reserva.getPrecio());
					ps.setFloat(6, reserva.getDescuento());	
					ps.setInt(7, reserva.getTipo_reserva());
					ps.setInt(8, 0);
					ps.setInt(9, reserva.getNum_adultos());
					ps.setInt(10, reserva.getId_bono());
					ps.setInt(11, id_jugador.getInt("id"));
					ps.executeUpdate();
					break;
				case 1: // infantil
					ps = con.prepareStatement(this.propiedades.getProperty("crearResInsert"));
					ps.setInt(1, reserva.getId());	
					ps.setDate(2, new java.sql.Date(reserva.getFecha().getTime()));
					ps.setInt(3, reserva.getDuracion());
					ps.setInt(4, reserva.getId_pista());
					ps.setFloat(5, reserva.getPrecio());
					ps.setFloat(6, reserva.getDescuento());	
					ps.setInt(7, reserva.getTipo_reserva());
					ps.setInt(8, reserva.getNum_ninios());
					ps.setInt(9, 0);
					ps.setInt(10, reserva.getId_bono());
					ps.setInt(11, id_jugador.getInt("id"));
					ps.executeUpdate();
					break;
				case 2: // familiar
					ps = con.prepareStatement(this.propiedades.getProperty("crearResInsert"));
					ps.setInt(1, reserva.getId());	
					ps.setDate(2, new java.sql.Date(reserva.getFecha().getTime()));
					ps.setInt(3, reserva.getDuracion());
					ps.setInt(4, reserva.getId_pista());
					ps.setFloat(5, reserva.getPrecio());
					ps.setFloat(6, reserva.getDescuento());	
					ps.setInt(7, reserva.getTipo_reserva());
					ps.setInt(8, reserva.getNum_ninios());
					ps.setInt(9, reserva.getNum_adultos());
					ps.setInt(10, reserva.getId_bono());
					ps.setInt(11, id_jugador.getInt("id"));
					ps.executeUpdate();
					break;
				default:
					System.out.println("Opción no válida.");
			}	
		} catch (Exception e) {
			System.err.println(e);
			e.printStackTrace();
		}
	}
	
	/**
	 * Modifica una reserva existente.
	 * 
	 * @param reserva Objeto ReservasDTO que contiene la información actualizada de la reserva.
	 */
	public void modificarReserva(ReservasDTO reserva) {
		try {
			DBConnection dbConnection = new DBConnection();
			Connection con = dbConnection.getConnection();
			PreparedStatement ps = null;
			ps = con.prepareStatement(this.propiedades.getProperty("modResSelect"));
			ps.setInt(1, reserva.getId_pista());
			ps.setDate(2, new java.sql.Date(reserva.getFecha().getTime()));
			ResultSet id = ps.executeQuery();
			if (!id.next()) {
				return;
			}
			ps = con.prepareStatement(this.propiedades.getProperty("modResUpdate"));
			ps.setDate(1, new java.sql.Date(reserva.getFecha().getTime()));
			ps.setInt(2, reserva.getDuracion());
			ps.setInt(3, reserva.getId_pista());
			ps.setFloat(4, reserva.getPrecio());
			ps.setFloat(5, reserva.getDescuento());	
			ps.setInt(6, reserva.getTipo_reserva());
			ps.setInt(7, reserva.getNum_ninios());
			ps.setInt(8, reserva.getNum_adultos());
			ps.setInt(9, id.getInt("id"));
			ps.executeUpdate();
		} catch (Exception e) {
			System.err.println(e);
			e.printStackTrace();
		}
	}
	
	/**
	 * Cancela una reserva existente.
	 * 
	 * @param reserva Objeto ReservasDTO que contiene la información de la reserva a cancelar.
	 */
	public void cancelarReserva(ReservasDTO reserva) {
		try {
			DBConnection dbConnection = new DBConnection();
			Connection con = dbConnection.getConnection();
			PreparedStatement ps = null;
			ps = con.prepareStatement(this.propiedades.getProperty("canResDelete"));
			ps.setInt(1, reserva.getId_pista());
			ps.setDate(2, new java.sql.Date(reserva.getFecha().getTime()));
			ps.executeUpdate();
		} catch (Exception e) {
			System.err.println(e);
			e.printStackTrace();
		}
	}
	
	/**
	 * Lista todas las reservas futuras.
	 * 
	 * @return Lista de objetos ReservasDTO que representan las reservas futuras.
	 */
	public List<ReservasDTO> listarReservasFuturas() {
		List<ReservasDTO> reservas = new ArrayList<>();

		try {
			DBConnection dbConnection = new DBConnection();
			Connection con = dbConnection.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(this.propiedades.getProperty("lisResSelect") + LocalDate.now());
			
			while (rs.next()) {
				Date fecha = rs.getDate("fecha");
				int duracion = rs.getInt("duracion");
				int id_pista = rs.getInt("id_pista");
				float precio = rs.getFloat("precio");
				float descuento = rs.getFloat("descuento");
				int tipo_reserva = rs.getInt("tipo_reserva");
				int num_ninios = rs.getInt("num_ninios");
				int num_adultos = rs.getInt("num_adultos");
				int id_bono = rs.getInt("id_bono");
				int id_jugador = rs.getInt("id_jugador");
				ReservasDTO reserva = new ReservasDTO(fecha, duracion, id_pista, precio, descuento, tipo_reserva, num_ninios, num_adultos, id_bono, id_jugador);
				reservas.add(reserva);
			}
			if (stmt != null) { stmt.close(); }
		} catch (Exception e) {
			System.err.println(e);
			e.printStackTrace();
		}
		
		return reservas;
	}
	
	/**
	 * Consulta una reserva específica.
	 * 
	 * @param reserva Objeto ReservasDTO que contiene la información de la reserva a consultar.
	 * @return Objeto ReservasDTO actualizado con la información de la reserva consultada.
	 */
	public ReservasDTO consultarReserva(ReservasDTO reserva) {
		ResultSet select;
		try {
			DBConnection dbcon = new DBConnection();
			Connection con = dbcon.getConnection();
		
			String selectQuery = this.propiedades.getProperty("conResSelect");
			
			PreparedStatement ps = con.prepareStatement(selectQuery);
			ps.setInt(1, reserva.getId_pista());
			ps.setDate(2, new java.sql.Date(reserva.getFecha().getTime()));
			select = ps.executeQuery();
			
			if (select.next()) {
				reserva.setDuracion(select.getInt("duracion"));
				reserva.setPrecio(select.getFloat("precio"));
				reserva.setDescuento(select.getFloat("descuento"));
				reserva.setTipo_reserva(select.getInt("tipo_reserva"));
				reserva.setNum_ninios(select.getInt("num_ninios"));
				reserva.setNum_adultos(select.getInt("num_adultos"));
				reserva.setId_bono(select.getInt("id_bono"));
				reserva.setId_jugador(select.getInt("id_jugador"));
			}
		} catch (Exception e) {
			System.err.println(e);
			e.printStackTrace();
		}
		return reserva;
	}
}
========
package es.uco.practica3.data.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Types;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import es.uco.practica3.business.*;
import es.uco.practica3.data.common.DBConnection;

/**
 * Clase ReservaDAO.
 * 
 * Esta clase gestiona las reservas en la base de datos. Proporciona métodos 
 * para crear, modificar, cancelar y listar reservas. La clase también maneja 
 * la conexión con la base de datos y las operaciones relacionadas a las reservas.
 */
public class ReservaDAO {
	
	private Properties propiedades = new Properties();
	
	/**
	 * Constructor de ReservaDAO.
	 * 
	 * Carga las propiedades necesarias para realizar las consultas SQL desde 
	 * un archivo de configuración.
	 */
	public ReservaDAO() {
		try (InputStream input = new FileInputStream("sql.properties")) {
			this.propiedades.load(input);
		} catch (IOException ex) {
			System.out.println("Error al cargar las propiedades: " + ex.getMessage());
			return;
		}
	}
	
	/**
	 * Crea una reserva individual.
	 * 
	 * @param reserva Objeto ReservasDTO que contiene la información de la reserva.
	 * @param correo Email del usuario que realiza la reserva.
	 */
	public void crearReservaIndividual(ReservasDTO reserva, String correo) {
		try {
			DBConnection dbConnection = new DBConnection();
			Connection con = dbConnection.getConnection();
			PreparedStatement ps = null;
			ps = con.prepareStatement(this.propiedades.getProperty("crearResISelect"));
			ps.setString(1, correo);
			ResultSet id_jugador = ps.executeQuery();
			if (!id_jugador.next()) {
				return;
			}
			switch (reserva.getTipo_reserva()) {
				case 0: // adultos
					ps = con.prepareStatement(this.propiedades.getProperty("crearResInsert"));
					ps.setInt(1, reserva.getId());	
					ps.setDate(2, new java.sql.Date(reserva.getFecha().getTime()));
					ps.setInt(3, reserva.getDuracion());
					ps.setInt(4, reserva.getId_pista());
					ps.setFloat(5, reserva.getPrecio());
					ps.setFloat(6, reserva.getDescuento());	
					ps.setInt(7, reserva.getTipo_reserva());
					ps.setInt(8, 0);
					ps.setInt(9, reserva.getNum_adultos());
					ps.setNull(10, Types.INTEGER);
					ps.setInt(11, id_jugador.getInt("id"));
					ps.executeUpdate();
					break;
				case 1: // infantil
					ps = con.prepareStatement(this.propiedades.getProperty("crearResInsert"));
					ps.setInt(1, reserva.getId());	
					ps.setDate(2, new java.sql.Date(reserva.getFecha().getTime()));
					ps.setInt(3, reserva.getDuracion());
					ps.setInt(4, reserva.getId_pista());
					ps.setFloat(5, reserva.getPrecio());
					ps.setFloat(6, reserva.getDescuento());	
					ps.setInt(7, reserva.getTipo_reserva());
					ps.setInt(8, reserva.getNum_ninios());
					ps.setInt(9, 0);
					ps.setNull(10, Types.INTEGER);
					ps.setInt(11, id_jugador.getInt("id"));
					ps.executeUpdate();
					break;
				case 2: // familiar
					ps = con.prepareStatement(this.propiedades.getProperty("crearResInsert"));
					ps.setInt(1, reserva.getId());	
					ps.setDate(2, new java.sql.Date(reserva.getFecha().getTime()));
					ps.setInt(3, reserva.getDuracion());
					ps.setInt(4, reserva.getId_pista());
					ps.setFloat(5, reserva.getPrecio());
					ps.setFloat(6, reserva.getDescuento());	
					ps.setInt(7, reserva.getTipo_reserva());
					ps.setInt(8, reserva.getNum_ninios());
					ps.setInt(9, reserva.getNum_adultos());
					ps.setNull(10, Types.INTEGER);
					ps.setInt(11, id_jugador.getInt("id"));
					ps.executeUpdate();
					break;
				default:
					System.out.println("Opción no válida.");
			}	
		} catch (Exception e) {
			System.err.println(e);
			e.printStackTrace();
		}
	}
	
	/**
	 * Crea una reserva utilizando un bono.
	 * 
	 * @param reserva Objeto ReservasDTO que contiene la información de la reserva.
	 * @param correo Email del usuario que realiza la reserva.
	 */
	public void crearReservaBono(ReservasDTO reserva, String correo) {
		try {
			DBConnection dbConnection = new DBConnection();
			Connection con = dbConnection.getConnection();
			PreparedStatement ps = null;
			ps = con.prepareStatement(this.propiedades.getProperty("crearResBSelect"));
			ps.setString(1, correo);
			ResultSet id_jugador = ps.executeQuery();
			if (!id_jugador.next()) {
				return;
			}
			switch (reserva.getTipo_reserva()) {
				case 0: // adultos
					ps = con.prepareStatement(this.propiedades.getProperty("crearResInsert"));
					ps.setInt(1, reserva.getId());	
					ps.setDate(2, new java.sql.Date(reserva.getFecha().getTime()));
					ps.setInt(3, reserva.getDuracion());
					ps.setInt(4, reserva.getId_pista());
					ps.setFloat(5, reserva.getPrecio());
					ps.setFloat(6, reserva.getDescuento());	
					ps.setInt(7, reserva.getTipo_reserva());
					ps.setInt(8, 0);
					ps.setInt(9, reserva.getNum_adultos());
					ps.setInt(10, reserva.getId_bono());
					ps.setInt(11, id_jugador.getInt("id"));
					ps.executeUpdate();
					break;
				case 1: // infantil
					ps = con.prepareStatement(this.propiedades.getProperty("crearResInsert"));
					ps.setInt(1, reserva.getId());	
					ps.setDate(2, new java.sql.Date(reserva.getFecha().getTime()));
					ps.setInt(3, reserva.getDuracion());
					ps.setInt(4, reserva.getId_pista());
					ps.setFloat(5, reserva.getPrecio());
					ps.setFloat(6, reserva.getDescuento());	
					ps.setInt(7, reserva.getTipo_reserva());
					ps.setInt(8, reserva.getNum_ninios());
					ps.setInt(9, 0);
					ps.setInt(10, reserva.getId_bono());
					ps.setInt(11, id_jugador.getInt("id"));
					ps.executeUpdate();
					break;
				case 2: // familiar
					ps = con.prepareStatement(this.propiedades.getProperty("crearResInsert"));
					ps.setInt(1, reserva.getId());	
					ps.setDate(2, new java.sql.Date(reserva.getFecha().getTime()));
					ps.setInt(3, reserva.getDuracion());
					ps.setInt(4, reserva.getId_pista());
					ps.setFloat(5, reserva.getPrecio());
					ps.setFloat(6, reserva.getDescuento());	
					ps.setInt(7, reserva.getTipo_reserva());
					ps.setInt(8, reserva.getNum_ninios());
					ps.setInt(9, reserva.getNum_adultos());
					ps.setInt(10, reserva.getId_bono());
					ps.setInt(11, id_jugador.getInt("id"));
					ps.executeUpdate();
					break;
				default:
					System.out.println("Opción no válida.");
			}	
		} catch (Exception e) {
			System.err.println(e);
			e.printStackTrace();
		}
	}
	
	/**
	 * Modifica una reserva existente.
	 * 
	 * @param reserva Objeto ReservasDTO que contiene la información actualizada de la reserva.
	 */
	public void modificarReserva(ReservasDTO reserva) {
		try {
			DBConnection dbConnection = new DBConnection();
			Connection con = dbConnection.getConnection();
			PreparedStatement ps = null;
			ps = con.prepareStatement(this.propiedades.getProperty("modResSelect"));
			ps.setInt(1, reserva.getId_pista());
			ps.setDate(2, new java.sql.Date(reserva.getFecha().getTime()));
			ResultSet id = ps.executeQuery();
			if (!id.next()) {
				return;
			}
			ps = con.prepareStatement(this.propiedades.getProperty("modResUpdate"));
			ps.setDate(1, new java.sql.Date(reserva.getFecha().getTime()));
			ps.setInt(2, reserva.getDuracion());
			ps.setInt(3, reserva.getId_pista());
			ps.setFloat(4, reserva.getPrecio());
			ps.setFloat(5, reserva.getDescuento());	
			ps.setInt(6, reserva.getTipo_reserva());
			ps.setInt(7, reserva.getNum_ninios());
			ps.setInt(8, reserva.getNum_adultos());
			ps.setInt(9, id.getInt("id"));
			ps.executeUpdate();
		} catch (Exception e) {
			System.err.println(e);
			e.printStackTrace();
		}
	}
	
	/**
	 * Cancela una reserva existente.
	 * 
	 * @param reserva Objeto ReservasDTO que contiene la información de la reserva a cancelar.
	 */
	public void cancelarReserva(ReservasDTO reserva) {
		try {
			DBConnection dbConnection = new DBConnection();
			Connection con = dbConnection.getConnection();
			PreparedStatement ps = null;
			ps = con.prepareStatement(this.propiedades.getProperty("canResDelete"));
			ps.setInt(1, reserva.getId_pista());
			ps.setDate(2, new java.sql.Date(reserva.getFecha().getTime()));
			ps.executeUpdate();
		} catch (Exception e) {
			System.err.println(e);
			e.printStackTrace();
		}
	}
	
	/**
	 * Lista todas las reservas futuras.
	 * 
	 * @return Lista de objetos ReservasDTO que representan las reservas futuras.
	 */
	public List<ReservasDTO> listarReservasFuturas() {
		List<ReservasDTO> reservas = new ArrayList<>();

		try {
			DBConnection dbConnection = new DBConnection();
			Connection con = dbConnection.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(this.propiedades.getProperty("lisResSelect") + LocalDate.now());
			
			while (rs.next()) {
				Date fecha = rs.getDate("fecha");
				int duracion = rs.getInt("duracion");
				int id_pista = rs.getInt("id_pista");
				float precio = rs.getFloat("precio");
				float descuento = rs.getFloat("descuento");
				int tipo_reserva = rs.getInt("tipo_reserva");
				int num_ninios = rs.getInt("num_ninios");
				int num_adultos = rs.getInt("num_adultos");
				int id_bono = rs.getInt("id_bono");
				int id_jugador = rs.getInt("id_jugador");
				ReservasDTO reserva = new ReservasDTO(fecha, duracion, id_pista, precio, descuento, tipo_reserva, num_ninios, num_adultos, id_bono, id_jugador);
				reservas.add(reserva);
			}
			if (stmt != null) { stmt.close(); }
		} catch (Exception e) {
			System.err.println(e);
			e.printStackTrace();
		}
		
		return reservas;
	}
	
	/**
	 * Consulta una reserva específica.
	 * 
	 * @param reserva Objeto ReservasDTO que contiene la información de la reserva a consultar.
	 * @return Objeto ReservasDTO actualizado con la información de la reserva consultada.
	 */
	public ReservasDTO consultarReserva(ReservasDTO reserva) {
		ResultSet select;
		try {
			DBConnection dbcon = new DBConnection();
			Connection con = dbcon.getConnection();
		
			String selectQuery = this.propiedades.getProperty("conResSelect");
			
			PreparedStatement ps = con.prepareStatement(selectQuery);
			ps.setInt(1, reserva.getId_pista());
			ps.setDate(2, new java.sql.Date(reserva.getFecha().getTime()));
			select = ps.executeQuery();
			
			if (select.next()) {
				reserva.setDuracion(select.getInt("duracion"));
				reserva.setPrecio(select.getFloat("precio"));
				reserva.setDescuento(select.getFloat("descuento"));
				reserva.setTipo_reserva(select.getInt("tipo_reserva"));
				reserva.setNum_ninios(select.getInt("num_ninios"));
				reserva.setNum_adultos(select.getInt("num_adultos"));
				reserva.setId_bono(select.getInt("id_bono"));
				reserva.setId_jugador(select.getInt("id_jugador"));
			}
		} catch (Exception e) {
			System.err.println(e);
			e.printStackTrace();
		}
		return reserva;
	}
}
>>>>>>>> 75831080d0662793c9dc03265c6626d9d5021e77:practica3/src/main/java/es/uco/practica3/data/dao/ReservaDAO.java