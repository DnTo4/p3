<<<<<<<< HEAD:src/main/java/es/uco/practica3/business/GestorJugadores.java
package es.uco.practica3.business;

import java.util.List;

import es.uco.practica3.data.dao.JugadorDAO;

import java.util.Date;
import java.time.LocalDate;

public class GestorJugadores {
    private JugadorDAO jugadorDAO = new JugadorDAO();

    public int addJugador(String nombre, String apellidos, Date fechaNacimiento, LocalDate fechaIns, String correo, String contrasenia)
    {
    	JugadorDTO jugador = new JugadorDTO(nombre, apellidos, fechaNacimiento, fechaIns, correo, contrasenia);
        return jugadorDAO.addJugador(jugador); 
    }

    public int updateJugador(String nombre, String apellidos, Date fechaN, String correo, String contrasenia)
    {
    	JugadorDTO jugador = new JugadorDTO(nombre, apellidos, fechaN, LocalDate.now(), correo, contrasenia);
        return jugadorDAO.updateJugador(jugador);
    }
    
    public List<JugadorDTO> getAllJugadores() 
    {
        return jugadorDAO.getAllJugadores();
    }
    
    public int deleteJugador(String correo) 
    {
    	JugadorDTO jugador = new JugadorDTO("n", "a", new Date(), LocalDate.now(), correo, "a");
        return jugadorDAO.deleteJugador(jugador);
    }
}
========
package es.uco.practica3.business;

import java.util.List;

import es.uco.practica3.data.dao.JugadorDAO;

import java.util.Date;
import java.time.LocalDate;

public class GestorJugadores {
    private JugadorDAO jugadorDAO = new JugadorDAO();

    public int addJugador(String nombre, String apellidos, Date fechaNacimiento, LocalDate fechaIns, String correo, String contrasenia)
    {
    	JugadorDTO jugador = new JugadorDTO(nombre, apellidos, fechaNacimiento, fechaIns, correo, contrasenia);
        return jugadorDAO.addJugador(jugador); 
    }

    public int updateJugador(String nombre, String apellidos, Date fechaN, String correo, String contrasenia)
    {
    	JugadorDTO jugador = new JugadorDTO(nombre, apellidos, fechaN, LocalDate.now(), correo, contrasenia);
        return jugadorDAO.updateJugador(jugador);
    }
    
    public List<JugadorDTO> getAllJugadores() 
    {
        return jugadorDAO.getAllJugadores();
    }
    
    public int deleteJugador(String correo) 
    {
    	JugadorDTO jugador = new JugadorDTO("n", "a", new Date(), LocalDate.now(), correo, "a");
        return jugadorDAO.deleteJugador(jugador);
    }
}
>>>>>>>> 75831080d0662793c9dc03265c6626d9d5021e77:practica3/src/main/java/es/uco/practica3/business/GestorJugadores.java
