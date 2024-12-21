<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Resultados de Búsqueda</title>
    <link rel="stylesheet" type="text/css" href="../../css/styles.css">
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
                List<Pista> pistasDisponibles = (List<Pista>) request.getAttribute("pistasDisponibles");
                for (Pista pista : pistasDisponibles) {
            %>
                <tr>
                    <td><%= pista.getNombre() %></td>
                    <td><%= pista.getTipo() == 1 ? "Interior" : "Exterior" %></td>
                    <td><%= pista.getEstado() == 1 ? "Disponible" : "No Disponible" %></td>
                    <td><%= pista.getTamanio() %></td>
                    <td><%= pista.getJugadoresMax() %></td>
                </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>
