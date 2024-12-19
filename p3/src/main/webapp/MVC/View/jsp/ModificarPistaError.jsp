<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
    <link rel="stylesheet" type="text/css" href="../../View/css/styles.css">
</head>
<body>
    <div class="container">
        <h1>Error</h1>
        <p class="error"><%= request.getAttribute("mensajeError") %></p>
        <a href="/MVC/View/jsp/index.jsp" class="btn">Volver al inicio</a>
    </div>
</body>
</html>
