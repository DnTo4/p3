<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="es.uco.practica3.business.DTO.JugadorDTO,es.uco.practica3.data.dao.JugadorDAO" %>
<jsp:useBean  id="customerBean" scope="session" class="es.uco.practica3.display.CustomerBean"></jsp:useBean>
<%
/* Posibles flujos:
1) customerBean está logado (!= null && != "") -> Se redirige al index.jsp
2) customerBean no está logado:
	a) Hay parámetros en el request  -> procede de la vista 
	b) No hay parámetros en el request -> procede de otra funcionalidad o index.jsp
*/
//Caso 1: Por defecto, vuelve al index
String nextPage = "../../View/jsp/registerView.jsp";
String mensajeNextPage = "";
//Caso 2
if (customerBean == null || customerBean.getEmailUser().equals("")) {
	String emailUser = request.getParameter("correo_electronico");
	String password = request.getParameter("contrasenia");
	String nombre = request.getParameter("nombre");
	String apellidos = request.getParameter("apellidos");
	String fechaNacimiento = request.getParameter("fecha_nacimiento");
	String fechaInscripcion = request.getParameter("fecha_inscripcion");

//Caso 2.a: Hay parámetros -> procede de la VISTA
if (emailUser != null) {
	//Se accede a bases de datos para obtener el usuario
	JugadorDTO jugador = new JugadorDTO(nombre, apellidos, fechaNacimiento, fechaInscripcion, emailUser, password);
	
	JugadorDAO jugadorDAO = new JugadorDAO();
	jugadorDAO.addJugador(jugador);

	//Se realizan todas las comprobaciones necesarias del dominio
	//Aquí sólo comprobamos que exista el usuario
	if (jugador != null) {
		// Usuario válido		
%>
<jsp:setProperty property="emailUser" value="<%=emailUser%>" name="customerBean"/>
<%
		nextPage = "../../View/jsp/register.jsp";
	}
//Caso 2.b -> se debe ir a la vista por primera vez
	} else {
		nextPage = "../../View/jsp/registerView.jsp";
	}
}
%>
<jsp:forward page="<%=nextPage%>">
<jsp:param value="<%=mensajeNextPage%>" name="message"/>
</jsp:forward>