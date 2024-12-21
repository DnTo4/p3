<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Consultar Reservas</title>
    <link rel="stylesheet" type="text/css" href="../../css/styles.css">
    <script>
        function validarFormulario(event) {
            const fechaInicio = document.getElementById("fecha_inicio").value;
            const fechaFin = document.getElementById("fecha_fin").value;
            if (!fechaInicio || !fechaFin) {
                alert("Debe seleccionar una fecha de inicio y fin.");
                event.preventDefault();
            }
        }
    </script>
</head>
<body>
    <h1>Consultar Reservas</h1>
    <form action="../../../Controller/reservas/ConsultarReservasController.jsp" method="post" onsubmit="validarFormulario(event)">
        <label>Fecha de Inicio:</label>
        <input type="date" id="fecha_inicio" name="fecha_inicio" required /><br>

        <label>Fecha de Fin:</label>
        <input type="date" id="fecha_fin" name="fecha_fin" required /><br>

        <label>Tu ID de Jugador:</label>
        <input type="number" name="id_jugador" required /><br>

        <input type="submit" value="Consultar Reservas" />
    </form>
</body>
</html>
