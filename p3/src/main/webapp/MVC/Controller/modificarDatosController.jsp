<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="es.uco.practica3.business.DTO.JugadorDTO, es.uco.practica3.business.gestores.GestorJugadores" %>
<%@ page import="java.text.SimpleDateFormat, java.util.Date, java.text.ParseException" %>
<jsp:useBean id="customerBean" scope="session" class="es.uco.practica3.display.CustomerBean"></jsp:useBean>


<%
	boolean updateSuccess = false;
    // Variables para los flujos
    String nextPage = "../../View/jsp/modificarDatosView.jsp"; // Página por defecto en caso de error o validación
    String mensajeNextPage = ""; // Mensaje para redirigir

    // Verificamos si el usuario está logueado
    if (customerBean != null && !customerBean.getEmailUser().equals("")) {
        
        // Obtener los datos del formulario (pasados como parámetros)
        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellidos");
        String fechaNacimiento = request.getParameter("fecha_nacimiento");
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        
        Date fecha = sdf.parse(fechaNacimiento); // Convertir el string a Date
        String contrasenia = request.getParameter("contrasenia");

        // Comprobamos que los parámetros no estén vacíos
        if (nombre != null && apellidos != null && fechaNacimiento != null && contrasenia != null) {
            
            // Crear un objeto CustomerDTO con los nuevos datos
            GestorJugadores gestor = new GestorJugadores();
            gestor.updateJugador(nombre, apellidos, fecha, customerBean.getEmailUser(), contrasenia);
            updateSuccess = true;

            // Crear un objeto CustomerDAO para realizar la actualización en la base de datos
            

            if (updateSuccess) {
                // Si la actualización es exitosa, actualizamos los datos en el customerBean
                customerBean.setNombre(nombre);
                customerBean.setApellidos(apellidos);
                customerBean.setFecha_nacimiento(fechaNacimiento);
                customerBean.setContrasenia(contrasenia);
                
                // Redirigir al perfil o página de éxito
                nextPage = "../../View/jsp/modificarDatosSuccess.jsp"; // Página de éxito o perfil
                mensajeNextPage = "Datos modificados correctamente";
            } else {
                // Si ocurre un error al actualizar, mostramos un mensaje de error
                mensajeNextPage = "Error al modificar los datos. Por favor, intente de nuevo.";
            }
        } else {
            // Si algún campo está vacío, redirigimos a la vista con un mensaje de error
            mensajeNextPage = "Todos los campos son requeridos. Por favor, complete todos los campos.";
        }

    } else {
        // Si el usuario no está logueado, lo redirigimos al login
        nextPage = "../../View/jsp/login.jsp";
        mensajeNextPage = "Debes iniciar sesión para modificar tus datos.";
    }

%>

<jsp:forward page="<%=nextPage%>">
    <jsp:param value="<%=mensajeNextPage%>" name="message"/>
</jsp:forward>
