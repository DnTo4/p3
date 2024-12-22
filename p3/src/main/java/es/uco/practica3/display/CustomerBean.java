package es.uco.practica3.display;

public class CustomerBean implements java.io.Serializable {

	private static final long serialVersionUID = 1L;

	private String emailUser = "";
	private int rol = 0;
	private String nombre = "";
	private String fechaInscripcion = "";
	private String fechaProximaReserva = "";
    private String apellidos="";
    private String fecha_nacimiento="";
    private String contrasenia="";
	
	
	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public String getFecha_nacimiento() {
		return fecha_nacimiento;
	}

	public void setFecha_nacimiento(String fecha_nacimiento) {
		this.fecha_nacimiento = fecha_nacimiento;
	}

	public String getContrasenia() {
		return contrasenia;
	}

	public void setContrasenia(String contrasenia) {
		this.contrasenia = contrasenia;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	

	public String getFechaInscripcion() {
		return fechaInscripcion;
	}

	public void setFechaInscripcion(String fechaInscripcion) {
		this.fechaInscripcion = fechaInscripcion;
	}

	public String getFechaProximaReserva() {
		return fechaProximaReserva;
	}

	public void setFechaProximaReserva(String fechaProximaReserva) {
		this.fechaProximaReserva = fechaProximaReserva;
	}

	public String getEmailUser() {
		return emailUser;
	}

	public void setEmailUser(String emailUser) {
		this.emailUser = emailUser;
	}
	
	public int getRol()
	{
		return this.rol;
	}
	
	public void setRol(int rol)
	{
		this.rol = rol;
	}
	

}