<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Consultar Reservas</title>
    <link rel="stylesheet" type="text/css" href="../../css/styles.css">
</head>
<body>
    <h1>Consultar Reservas</h1>
    <p>Introduce el rango de fechas para consultar tus reservas:</p>
    <form action="../../../Controller/reservas/consultarReservasController.jsp" method="post">
        <div>
            <label for="fecha_inicio">Fecha de inicio:</label>
            <input type="date" id="fecha_inicio" name="fecha_inicio" required>
        </div>
        <div>
            <label for="fecha_fin">Fecha de fin:</label>
            <input type="date" id="fecha_fin" name="fecha_fin" required>
        </div>
        <div>
            <input type="submit" value="Consultar Reservas" class="btn">
        </div>
    </form>
    <div class="buttons">
        <a href="../../View/menuCliente.html" class="btn">Volver al menú principal</a>
    </div>
</body>
</html>
