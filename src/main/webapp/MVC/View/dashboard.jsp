<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="es.uco.practica3.business.JugadorDTO" %>
<%
    JugadorDTO jugador = (JugadorDTO) request.getSession().getAttribute("usuario");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Bienvenido</title>
</head>
<body>
    <h1>Bienvenido, <%= jugador.getNombre() %></h1>
    <p>Fecha de inscripción: <%= jugador.getFecha_inscripcion() %></p>
    <!-- Agregar lógica para mostrar reservas futuras -->
    <a href="logout">Desconectar</a>
    <a href="modificar">Modificar Datos</a>
</body>
</html>