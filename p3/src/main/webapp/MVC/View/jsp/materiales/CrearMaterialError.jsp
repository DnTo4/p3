<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Error en la creación del material</title>
    <link rel="stylesheet" type="text/css" href="/p3/MVC/View/css/styles.css">
</head>
<body>
    <h1>Error</h1>
    <p><%= request.getAttribute("mensaje") %></p>
    <div class="buttons">
        <a href="../../jsp/materiales/CrearMaterial.jsp" class="btn">Volver al formulario</a>
        <a href="../menuAdmin.jsp" class="btn">Volver al menú principal</a>
    </div>
</body>
</html>
