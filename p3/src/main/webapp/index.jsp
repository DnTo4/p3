<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean  id="customerBean" scope="session" class="es.uco.practica3.display.CustomerBean"></jsp:useBean>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservas de Pistas - Inicio</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<%
if (customerBean == null || customerBean.getEmailUser()=="") {
	// Usuario no logado -> Se invoca al controlador de la funcionalidad
%>
	<div class="container">
        <h1>Bienvenido a Reservas de Pistas</h1>
        <div class="button-container">
            <button onclick="location.href='MVC/View/jsp/loginView.jsp'">Login</button>
            <button onclick="location.href='MVC/View/jsp/registerView.jsp'">Register</button>
        </div>
    </div>
<% } else { %>
	¡¡Bienvenido <jsp:getProperty property="emailUser" name="customerBean"/>!! 
	<a href=/p3/MVC/View/jsp/logout.jsp>Desconectarse</a>
<% } %>

</body>
</html>
