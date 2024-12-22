<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Modificar Estado del Material</title>
    <link rel="stylesheet" type="text/css" href="../../css/styles.css">
</head>
<body>
    <h1>Modificar Estado del Material</h1>
    <form action="../../../Controller/materiales/ModificarMaterialController.jsp" method="post">
        <label>Tipo de Material:</label>
        <select name="tipo">
            <option value="1">Canastas</option>
            <option value="2">Conos</option>
            <option value="3">Pelotas</option>
        </select><br>
        
        <label>Nuevo Estado:</label>
        <select name="estado">
            <option value="1">Disponible</option>
            <option value="2">Reservado</option>
            <option value="3">Mal Estado</option>
        </select><br>

        <input type="submit" value="Modificar Estado" />
    </form>
</body>
</html>
