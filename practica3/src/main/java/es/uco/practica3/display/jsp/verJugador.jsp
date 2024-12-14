<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="es.uco.practica2.business.JugadorDTO" %>
<%! // Otras importaciones necesarias %>

<html>
<head>
    <title>Datos del Jugador</title>
</head>
<body>
<h1>Información del Jugador</h1>

<% 
    JugadorDTO jugador = (JugadorDTO) request.getAttribute("jugador"); 
    if (jugador != null) { 
%>
    <p><strong>Nombre:</strong> <%= jugador.getNombre() %></p>
    <p><strong>Apellidos:</strong> <%= jugador.getApellidos() %></p>
    <p><strong>Fecha de Nacimiento:</strong> <%= jugador.getFecha_nacimiento() %></p>
    <p><strong>Fecha de Inscripción:</strong> <%= jugador.getFecha_inscripcion() %></p>
    <p><strong>Correo Electrónico:</strong> <%= jugador.getCorreo_electronico() %></p>
<% 
    } else {
%>
    <p>No se encontraron datos del jugador.</p>
<% 
    } 
%>

<a href="home.jsp">Volver a la página principal</a>
</body>
</html>
