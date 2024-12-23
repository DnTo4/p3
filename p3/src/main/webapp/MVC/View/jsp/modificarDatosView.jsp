<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="customerBean" scope="session" class="es.uco.practica3.display.CustomerBean"></jsp:useBean>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modificar Datos de Usuario</title>
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>

<%
    // Verificar si el usuario está logueado, de lo contrario redirigir al login
    if (customerBean == null || customerBean.getEmailUser().equals("")) {
        response.sendRedirect("loginView.jsp"); // Redirige al login si no está logueado
    } else {
        // Obtener los datos actuales del customerBean
        String nombre = customerBean.getNombre();
        String apellidos = customerBean.getApellidos();
        String fechaNacimiento = customerBean.getFecha_nacimiento(); // Asegúrate de formatear la fecha si es necesario
        String contrasenia = customerBean.getContrasenia();
%>

<h1>Modificar Datos de Usuario</h1>

<form method="post" action="../../Controller/modificarDatosController.jsp">
    <label for="nombre">Nombre:</label>
    <input type="text" id="nombre" name="nombre" value="<%= nombre %>" required><br/><br/>

    <label for="apellidos">Apellidos:</label>
    <input type="text" id="apellidos" name="apellidos" value="<%= apellidos %>" required><br/><br/>

    <label for="fecha_nacimiento">Fecha de Nacimiento:</label>
    <input type="date" id="fecha_nacimiento" name="fecha_nacimiento" value="<%= fechaNacimiento %>" required><br/><br/>

    <label for="contrasenia">Contraseña:</label>
    <input type="password" id="contrasenia" name="contrasenia" value="<%= contrasenia %>" required><br/><br/>

    <input type="submit" value="Guardar cambios">
</form>

<% 
    } // Fin del bloque de verificación de sesión
%>
	<a href="/p3/MVC/View/jsp/menuAdmin.jsp" class="btn">Volver al menú principal</a>

</body>
</html>
