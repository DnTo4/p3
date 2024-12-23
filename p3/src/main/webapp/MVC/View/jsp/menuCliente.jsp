<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat, java.util.Date" %>
<jsp:useBean id="customerBean" scope="session" class="es.uco.practica3.display.CustomerBean"></jsp:useBean>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menú de Cliente</title>
    <link rel="stylesheet" href="../css/stylesMenuCliente.css">
</head>
<body>
    <%
    
    	if (customerBean == null || customerBean.getEmailUser() == "")
    	{
    		response.sendRedirect("/p3");
    	}
        // Obtener datos del CustomerBean
        String nombre = customerBean.getNombre();
        String fechaInscripcion = customerBean.getFechaInscripcion(); // Fecha de inscripción
        String proximaReserva = customerBean.getFechaProximaReserva();    // Fecha de próxima reserva
        Date fechaActual = new Date(); // Fecha actual

        // Formato de fecha para mostrar
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    %>

    <!-- Sección de bienvenida -->
    <div class="welcome-container">
        <h1>Bienvenido, <%= nombre %>!</h1>
        <p>Fecha actual: <%= sdf.format(fechaActual) %></p>
        <p>Tu fecha de inscripción: <%=fechaInscripcion%></p>
        <% if (proximaReserva != "") { %>
            <p>Tu próxima reserva: <%=proximaReserva %></p>
        <% } else { %>
            <p>No tienes reservas próximas.</p>
        <% } %>
    </div>

    <!-- Menú -->
    <div class="menu-container">
        <h2>Menú de Cliente</h2>
        <a href="/p3/MVC/View/jsp/reservas/consultarReservas.jsp" class="menu-button">Consultar reservas entre fechas</a>
        <a href="/p3/MVC/View/jsp/Pistas/buscarPista.jsp" class="menu-button">Buscar pista disponible según criterios</a>
        <a href="/p3/MVC/View/jsp/reservas/crearReserva.jsp" class="menu-button">Realizar una reserva</a>
        <a href="/p3/MVC/View/jsp/bonos/crearBono.jsp" class="menu-button">Adquirir un bono y asociar reservas</a>
        <a href="/p3/MVC/View/jsp/reservas/modificarReserva.jsp" class="menu-button">Modificar una reserva</a>
        <a href="/p3/MVC/View/jsp/reservas/borrarReserva.jsp" class="menu-button">Cancelar una reserva</a>
        <a href="/p3/MVC/View/jsp/modificarDatosView.jsp" class="menu-button">Modificar mis Datos</a>
        <a href="/p3/MVC/View/jsp/logout.jsp" class="menu-button">Desconectarse</a>
    </div>
</body>
</html>
