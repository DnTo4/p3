<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Error en la Creación</title>
    <link rel="stylesheet" type="text/css" href="../../View/css/styles.css">
</head>
<body>
    <div class="container error">
        <h1>Error</h1>
        <p><%= request.getParameter("mensaje") %></p>
        <a href="crearPistaView.jsp" class="btn">Volver al Formulario</a>
    </div>
</body>
</html>
