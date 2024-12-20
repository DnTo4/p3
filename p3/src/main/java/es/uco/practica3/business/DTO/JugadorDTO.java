package es.uco.practica3.business.DTO;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Date;

public class JugadorDTO 
{
    private int id;
    private String nombre;
    private String apellidos;
    private Date fecha_nacimiento;
    private LocalDate fecha_inscripcion;
    private String correo_electronico;
    private String contrasenia;
    private int rol;

    public JugadorDTO(String nombre, String apellidos, Date fecha_nacimiento, LocalDate fecha_inscripcion,
                      String correo_electronico, String contrasenia) {
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.fecha_nacimiento = fecha_nacimiento;
        this.fecha_inscripcion = fecha_inscripcion;
        this.correo_electronico = correo_electronico;
        this.contrasenia = contrasenia;
        this.rol = 0;
    }
    
    public JugadorDTO(String nombre, String apellidos, Date fecha_nacimiento, LocalDate fecha_inscripcion,
            String correo_electronico, String contrasenia, int rol) {
    	this.nombre = nombre;
    	this.apellidos = apellidos;
    	this.fecha_nacimiento = fecha_nacimiento;
    	this.fecha_inscripcion = fecha_inscripcion;
    	this.correo_electronico = correo_electronico;
    	this.contrasenia = contrasenia;
    	this.rol = rol;
}
    
    public JugadorDTO(String nombre, String apellidos, String fechaNacimientoStr, String fechaInscripcionStr,
            String correoElectronico, String contrasenia) {
    	this.nombre = nombre;
    	this.apellidos = apellidos;
    	this.correo_electronico = correoElectronico;
    	this.contrasenia = contrasenia;
    	this.rol = 0;

    	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy"); // Define el formato esperado
    	try {
    		this.fecha_nacimiento = sdf.parse(fechaNacimientoStr); // Convierte String a Date
    	} catch (ParseException e) {
    		e.printStackTrace();
    		throw new IllegalArgumentException("Formato de fecha incorrecto");
    	}
    	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        try {
            this.fecha_inscripcion = LocalDate.parse(fechaInscripcionStr, formatter);
        } catch (DateTimeParseException e) {
            e.printStackTrace();
            throw new IllegalArgumentException("Formato de fecha_inscripcion incorrecto: " + fechaInscripcionStr);
        }
    }
	
	public JugadorDTO() {}
	
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @return the nombre
	 */
	public String getNombre() {
		return nombre;
	}
	/**
	 * @param nombre the nombre to set
	 */
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	/**
	 * @return the apellidos
	 */
	public String getApellidos() {
		return apellidos;
	}
	/**
	 * @param apellidos the apellidos to set
	 */
	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}
	/**
	 * @return the fecha_nacimiento
	 */
	public Date getFecha_nacimiento() {
		return fecha_nacimiento;
	}
	/**
	 * @param fecha_nacimiento the fecha_nacimiento to set
	 */
	public void setFecha_nacimiento(Date fecha_nacimiento) {
		this.fecha_nacimiento = fecha_nacimiento;
	}
	/**
	 * @return the fecha_inscripcion
	 */
	public LocalDate getFecha_inscripcion() {
		return fecha_inscripcion;
	}
	/**
	 * @param fecha_inscripcion the fecha_inscripcion to set
	 */
	public void setFecha_inscripcion(LocalDate fecha_inscripcion) {
		this.fecha_inscripcion = fecha_inscripcion;
	}
	/**
	 * @return the correo_electronico
	 */
	public String getCorreo_electronico() {
		return correo_electronico;
	}
	/**
	 * @param correo_electronico the correo_electronico to set
	 */
	public void setCorreo_electronico(String correo_electronico) {
		this.correo_electronico = correo_electronico;
	}
	
	public void setPassword(String password) {this.contrasenia = password;}
	
	public String getPassword() {return this.contrasenia;}
	
	public int getRol() {return this.rol;}
	
	public void setRol(int rol) {this.rol = rol;}
	
	@Override
	public String toString() {
		
		String rolStr = "Jugador";
		if(rol == 1) {rolStr = "Administrador";}
		
        return "JugadorDTO [nombre=" + nombre + ", apellidos=" + apellidos + ", fecha_nacimiento="
                + fecha_nacimiento + ", fecha_inscripcion=" + fecha_inscripcion + ", correo_electronico="
                + correo_electronico + "rol=" + rolStr + "]";
	}

}
