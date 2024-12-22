<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="es.uco.practica3.business.DTO.PistaDTO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Resultados de Búsqueda</title>
    <link rel="stylesheet" type="text/css" href="../../View/css/tablas.css">
</head>
<body>
    <h1>Resultados de Búsqueda</h1>
    <p>${mensaje}</p>

    <table>
        <thead>
            <tr>
                <th>Nombre de la Pista</th>
                <th>Tipo</th>
                <th>Estado</th>
                <th>Tamaño</th>
                <th>Jugadores Máximos</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<PistaDTO> pistasDisponibles = (List<PistaDTO>) request.getAttribute("pistasDisponibles");
                for (PistaDTO pista : pistasDisponibles) {
            %>
                <tr>
                    <td><%= pista.getNombre() %></td>
                    <td><%= pista.getTipo() == 1 ? "Interior" : "Exterior" %></td>
                    <td><%= pista.getEstado() == 1 ? "Disponible" : "No Disponible" %></td>
                    <td><%= pista.getTamanio() %></td>
                    <td><%= pista.getJugadores_max() %></td>
                </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>
