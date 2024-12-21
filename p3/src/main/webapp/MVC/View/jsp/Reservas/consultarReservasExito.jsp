<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Resultados de Consulta de Reservas</title>
    <link rel="stylesheet" type="text/css" href="../../css/styles.css">
</head>
<body>
    <h1>Resultados de Consulta de Reservas</h1>
    <p>${mensaje}</p>

    <h2>Reservas Futuras</h2>
    <%
        List<ReservasDTO> reservasFuturas = (List<ReservasDTO>) request.getAttribute("reservasFuturas");
        if (reservasFuturas != null && !reservasFuturas.isEmpty()) {
    %>
    <table>
        <thead>
            <tr>
                <th>Fecha</th>
                <th>Duración</th>
                <th>Pista</th>
                <th>Precio</th>
                <th>Estado</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (ReservasDTO reserva : reservasFuturas) {
            %>
            <tr>
                <td><%= reserva.getFecha() %></td>
                <td><%= reserva.getDuracion() %> horas</td>
                <td><%= reserva.getId_pista() %></td>
                <td><%= reserva.getPrecio() %> €</td>
                <td>Futura</td>
            </tr>
            <% } %>
        </tbody>
    </table>
    <% } else { %>
    <p>No tienes reservas futuras en este rango de fechas.</p>
    <% } %>

    <h2>Reservas Finalizadas</h2>
    <%
        List<ReservasDTO> reservasFinalizadas = (List<ReservasDTO>) request.getAttribute("reservasFinalizadas");
        if (reservasFinalizadas != null && !reservasFinalizadas.isEmpty()) {
    %>
    <table>
        <thead>
            <tr>
                <th>Fecha</th>
                <th>Duración</th>
                <th>Pista</th>
                <th>Precio</th>
                <th>Estado</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (ReservasDTO reserva : reservasFinalizadas) {
            %>
            <tr>
                <td><%= reserva.getFecha() %></td>
                <td><%= reserva.getDuracion() %> horas</td>
                <td><%= reserva.getId_pista() %></td>
                <td><%= reserva.getPrecio() %> €</td>
                <td>Finalizada</td>
            </tr>
            <% } %>
        </tbody>
    </table>
    <% } else { %>
    <p>No tienes reservas finalizadas en este rango de fechas.</p>
    <% } %>
</body>
</html>
