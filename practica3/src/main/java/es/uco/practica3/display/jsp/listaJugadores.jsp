<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="es.uco.practica2.business.JugadorDTO" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Administración de Jugadores</title>
    <link rel="stylesheet" href="styles.css"> <!-- Estilos personalizados -->
</head>
<body>
    <h1>Lista de Jugadores</h1>
    
    <c:if test="${not empty message}">
        <div class="message">${message}</div>
    </c:if>
    
    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>
    
    <table border="1">
        <tr>
            <th>Nombre</th>
            <th>Apellidos</th>
            <th>Fecha de Nacimiento</th>
            <th>Fecha de Inscripción</th>
            <th>Correo Electrónico</th>
            <th>Acciones</th>
        </tr>
        <c:forEach var="jugador" items="${jugadores}">
            <tr>
                <td>${jugador.nombre}</td>
                <td>${jugador.apellidos}</td>
                <td>${jugador.fecha_nacimiento}</td>
                <td>${jugador.fecha_inscripcion}</td>
                <td>${jugador.correo_electronico}</td>
                <td>
                    <form action="JugadorAdminServlet" method="post">
                        <input type="hidden" name="action" value="updateJugador">
                        <input type="hidden" name="correo_electronico" value="${jugador.correo_electronico}">
                        <button type="submit">Actualizar</button>
                    </form>
                    <form action="JugadorAdminServlet" method="get">
                        <input type="hidden" name="action" value="deleteJugador">
                        <input type="hidden" name="correo" value="${jugador.correo_electronico}">
                        <button type="submit">Eliminar</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>

    <h2>Agregar Jugador</h2>
    <form action="JugadorAdminServlet" method="post">
        <input type="hidden" name="action" value="addJugador">
        Nombre: <input type="text" name="nombre" required><br>
        Apellidos: <input type="text" name="apellidos" required><br>
        Fecha de Nacimiento: <input type="date" name="fecha_nacimiento" required><br>
        Fecha de Inscripción: <input type="date" name="fecha_inscripcion" required><br>
        Correo Electrónico: <input type="email" name="correo_electronico" required><br>
        <button type="submit">Agregar Jugador</button>
    </form>
</body>
</html>
