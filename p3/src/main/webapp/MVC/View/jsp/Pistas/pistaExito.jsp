<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Pista creada con éxito</title>
    <link rel="stylesheet" type="text/css" href="../../View/css/styles.css">
</head>
<body>
    <h1>¡Éxito!</h1>
    <p><%= request.getAttribute("mensaje") %></p>
    <div class="buttons">
        <a href="../../View/jsp/crearPistaView.jsp" class="btn">Volver al formulario</a>
        <a href="../../View/jsp/menuPrincipal.jsp" class="btn">Volver al menú principal</a>
    </div>
</body>
</html>
