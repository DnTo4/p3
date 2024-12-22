<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Error en la eliminación de la pista</title>
    <link rel="stylesheet" type="text/css" href="../../css/styles.css">
</head>
<body>
    <h1>Error en la eliminación de la pista</h1>
    <p><%= request.getAttribute("mensaje") %></p>
    <div class="buttons">
        <a href="BorrarPista.jsp" class="btn">Volver al formulario</a>
        <a href="../menuAdmin.jsp" class="btn">Volver al menú principal</a>
    </div>
</body>
</html>
