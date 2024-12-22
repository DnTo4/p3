<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="es.uco.practica3.business.DTO.JugadorDTO, es.uco.practica3.business.gestores.GestorJugadores" %>
<%@ page import="java.util.List" %>
<%@page errorPage="errorPage.jsp" %>
<jsp:useBean id="customerBean" scope="session" class="es.uco.practica3.display.CustomerBean"></jsp:useBean>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menú de Administración</title>
    <link rel="stylesheet" href="../css/stylesMenuAdmin.css">
</head>
<body>
    <% 
        if (customerBean.getRol() == 0) {
            response.sendRedirect("/p3/MVC/View/jsp/menuCliente.jsp");
        } else {
            // Obtener la lista de jugadores
            GestorJugadores gestor = new GestorJugadores();
            List<JugadorDTO> listaJugadores = gestor.getAllJugadores();
    %>
    <div class="menu-container">
        <h1>Menú de Gestión</h1>
        <a href="/p3/MVC/View/jsp/materiales/CrearMaterial.jsp" class="menu-button">Dar de alta un material</a>
        <a href="/p3/MVC/View/jsp/Pistas/CrearPista.jsp" class="menu-button">Dar de alta una pista</a>
        <a href="/p3/MVC/View/jsp/materiales/asociarMaterialPista.jsp" class="menu-button">Asociar materiales a pistas</a>
        <a href="/p3/MVC/View/jsp/ModificarMaterialesYPistas.jsp" class="menu-button">Modificar el estado de materiales y pistas</a>
        <a href="/p3/MVC/View/jsp/reservas/borrarReserva.jsp" class="menu-button">Eliminar reservas que aún no se hayan realizado</a>
        <a href="/p3/MVC/View/jsp/logout.jsp" class="menu-button">Desconectarse</a>
        
        <h2>Listado de Jugadores</h2>
        <table border="1" cellpadding="10" cellspacing="0" style="width: 100%; margin-top: 20px; border-collapse: collapse;">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Fecha de Inscripción</th>
                    <th>Reservas Completadas</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    // Iterar sobre la lista de jugadores y mostrar la información
                    for (JugadorDTO jugador : listaJugadores) {
                        String nombre = jugador.getNombre() + " " + jugador.getApellidos();
                        String fechaInscripcion = jugador.getFechaInscripcion().toString();
                        int reservasCompletadas = -1;
                %>
                <tr>
                    <td><%= nombre %></td>
                    <td><%= fechaInscripcion %></td>
                    <td><%= reservasCompletadas %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
    <% } %>
</body>
</html>

