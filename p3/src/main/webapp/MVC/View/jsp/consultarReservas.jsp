<%@ page import="java.util.List" %>
<%@ page import="es.uco.practica3.business.DTO.ReservasDTO" %>

<!DOCTYPE html>
<html>
<head>
    <title>Consultar Reservas entre Fechas</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>Consultar Reservas entre Fechas</h1>

    <!-- Formulario de consulta de fechas -->
    <form action="reserva" method="post">
        <input type="hidden" name="action" value="consultarReservasRango">
        <label for="fechaInicio">Fecha de Inicio:</label>
        <input type="date" id="fechaInicio" name="fechaInicio" required>
        <br>
        <label for="fechaFin">Fecha de Fin:</label>
        <input type="date" id="fechaFin" name="fechaFin" required>
        <br>
        <button type="submit">Consultar Reservas</button>
    </form>

    <hr>

    <!-- Mostrar Reservas Futuras -->
    <h2>Reservas Futuras</h2>
    <table border="1">
        <tr>
            <th>Fecha</th>
            <th>Pista</th>
            <th>Duración</th>
            <th>Precio</th>
            <th>Descuento</th>
            <th>Tipo de Reserva</th>
            <th>Niños</th>
            <th>Adultos</th>
        </tr>
        <c:forEach var="reserva" items="${reservasFuturas}">
            <tr>
                <td>${reserva.fecha}</td>
                <td>${reserva.idPista}</td>
                <td>${reserva.duracion}</td>
                <td>${reserva.precio}</td>
                <td>${reserva.descuento}</td>
                <td>${reserva.tipoReserva}</td>
                <td>${reserva.numNinios}</td>
                <td>${reserva.numAdultos}</td>
            </tr>
        </c:forEach>
    </table>

    <!-- Mostrar Reservas Finalizadas -->
    <h2>Reservas Finalizadas</h2>
    <table border="1">
        <tr>
            <th>Fecha</th>
            <th>Pista</th>
            <th>Duración</th>
            <th>Precio</th>
            <th>Descuento</th>
            <th>Tipo de Reserva</th>
            <th>Niños</th>
            <th>Adultos</th>
        </tr>
        <c:forEach var="reserva" items="${reservasFinalizadas}">
            <tr>
                <td>${reserva.fecha}</td>
                <td>${reserva.idPista}</td>
                <td>${reserva.duracion}</td>
                <td>${reserva.precio}</td>
                <td>${reserva.descuento}</td>
                <td>${reserva.tipoReserva}</td>
                <td>${reserva.numNinios}</td>
                <td>${reserva.numAdultos}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
