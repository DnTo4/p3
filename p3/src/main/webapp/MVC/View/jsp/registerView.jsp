<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean  id="customerBean" scope="session" class="es.uco.practica3.display.CustomerBean"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/styles.css">
<title>Register</title>
</head>
<body>
<%
/* Posibles flujos:
	1) customerBean está logado (!= null && != "") -> Se redirige al index.jsp (no debería estar aquí pero hay que comprobarlo)
	2) customerBean no está logado:
		a) Hay parámetros en el request  -> procede del controlador /con mensaje 
		b) No hay parámetros en el request -> procede del controlador /sin mensaje
	*/
String nextPage = "../../Controller/register/registerController.jsp";
String messageNextPage = request.getParameter("message");
if (messageNextPage == null) messageNextPage = "";

if (customerBean != null && !customerBean.getEmailUser().equals("")) {
	//No debería estar aquí -> flujo salta a index.jsp
	nextPage = "../../../index.html";
} else {
%>
<%= messageNextPage %><br/><br/>
<form method="post" action="../../Controller/register/registerController.jsp">
	<label for="correo_electronico">Email: </label>
    <input type="text" name="correo_electronico" value="" required><br/>

    <label for="contrasenia">Password: </label>
    <input type="password" name="contrasenia" value="" required><br/>

    <label for="nombre">Nombre: </label>
    <input type="text" name="nombre" value="" required><br/>

    <label for="apellidos">Apellidos: </label>
    <input type="text" name="apellidos" value="" required><br/>

    <label for="fecha_nacimiento">Fecha de Nacimiento (dd/mm/yyyy): </label>
    <input 
        type="text" 
        id="fecha_nacimiento" 
        name="fecha_nacimiento" 
        placeholder="dd/mm/yyyy" 
        pattern="^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/\d{4}$" 
        title="Introduce la fecha en formato dd/mm/yyyy"
        required>
    <br/>

    <label for="fecha_inscripcion">Fecha de Inscripción (dd/mm/yyyy): </label>
    <input 
        type="text" 
        id="fecha_inscripcion" 
        name="fecha_inscripcion" 
        placeholder="dd/mm/yyyy" 
        pattern="^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/\d{4}$" 
        title="Introduce la fecha en formato dd/mm/yyyy"
        required>
    <br/>

    <input type="submit" value="Registrarse">
</form>

<%
}
%>

</body>
</html>