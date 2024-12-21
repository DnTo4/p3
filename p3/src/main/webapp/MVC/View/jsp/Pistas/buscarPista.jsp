<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Buscar Pista</title>
    <link rel="stylesheet" type="text/css" href="../../css/styles.css">
    <script>
        function validarFormulario(event) {
            const fecha = document.getElementById("fecha").value;
            if (!fecha) {
                alert("Debe seleccionar una fecha.");
                event.preventDefault();
            }
        }
    </script>
</head>
<body>
    <h1>Buscar Pista Disponible</h1>
    <form action="../../../Controller/pistas/BuscarPistaController.jsp" method="post" onsubmit="validarFormulario(event)">
        <label>Tipo de Pista:</label>
        <select name="tipo" required>
            <option value="1">Interior</option>
            <option value="2">Exterior</option>
        </select><br>

        <label>Fecha:</label>
        <input type="date" id="fecha" name="fecha" required /><br>

        <input type="submit" value="Buscar Pista" />
    </form>
</body>
</html>
