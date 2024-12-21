<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Modificación Exitosa</title>
    <link rel="stylesheet" type="text/css" href="../../../View/css/styles.css">
</head>
<body>
    <h1>Modificación Exitosa</h1>
    <p><%= request.getAttribute("mensaje") %></p>
    <div class="buttons">
        <a href="../../View/materiales/ModificarMaterial.jsp" class="btn">Volver al formulario</a>
        <a href="../../html/menuAdmin.html" class="btn">Volver al menú principal</a>
    </div>
</body>
</html>
