<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Material Creado</title>
    <link rel="stylesheet" type="text/css" href="../../css/styles.css">
</head>
<body>
    <h1>Material Creado con Éxito</h1>
    <p><%= request.getAttribute("mensaje") %></p>
    <div class="buttons">
        <a href="../../jsp/materiales/CrearMaterial.jsp" class="btn">Volver al formulario</a>
        <a href="../menuAdmin.jsp" class="btn">Volver al menú principal</a>
    </div>
</body>
</html>
