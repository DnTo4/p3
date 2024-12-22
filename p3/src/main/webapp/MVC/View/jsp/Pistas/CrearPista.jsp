<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Crear Pista</title>
    <link rel="stylesheet" type="text/css" href="/p3/MVC/View/css/styles.css">
    <script>
        function validarFormulario(event) {
            const jugadoresMax = document.getElementById("jugadores_max").value;
            if (jugadoresMax <= 0) {
                alert("El número de jugadores debe ser mayor que 0.");
                event.preventDefault();
            }
        }
    </script>
</head>
<body>
    <h1>Crear Nueva Pista</h1>
    <form action="../../../Controller/pistas/CrearPistaController.jsp" method="post" onsubmit="validarFormulario(event)">
        <label>Nombre:</label>
        <input type="text" name="nombre" required /><br>

        <label>Estado:</label>
        <select name="estado">
            <option value="1">Disponible</option>
            <option value="0">No Disponible</option>
        </select><br>

        <label>Tipo:</label>
        <select name="tipo">
            <option value="1">Interior</option>
            <option value="2">Exterior</option>
        </select><br>

        <label>Tamaño:</label>
        <select name="tamanio">
            <option value="1">3VS3</option>
            <option value="2">Minibasket</option>
            <option value="3">Adultos</option>
        </select><br>

        <label>Jugadores Máximos:</label>
        <input type="number" id="jugadores_max" name="jugadores_max" required /><br>

        <input type="submit" value="Crear Pista" />
    </form>
</body>
</html>

