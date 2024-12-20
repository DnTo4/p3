<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Crear Material</title>
    <link rel="stylesheet" type="text/css" href="../../../View/css/styles.css">
</head>
<body>
    <h1>Crear Nuevo Material</h1>
    <form action="../../../Controller/materiales/CrearMaterialController.jsp" method="post" onsubmit="validarFormulario(event)">
        <label>Tipo de Material:</label>
        <select name="tipo" required>
            <option value="1">Canastas</option>
            <option value="2">Conos</option>
            <option value="3">Pelotas</option>
        </select><br>

        <label>Uso del Material:</label>
        <select name="uso_material" required>
            <option value="1">Interior</option>
            <option value="2">Exterior</option>
        </select><br>

        <label>Estado:</label>
        <select name="estado" required>
            <option value="1">Disponible</option>
            <option value="2">Reservado</option>
            <option value="3">Mal estado</option>
        </select><br>

        <input type="submit" value="Crear Material" />
    </form>
</body>
</html>

