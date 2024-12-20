<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Error al Modificar Pista</title>
    <link rel="stylesheet" type="text/css" href="../../css/styles.css">
</head>
<body>
    <h1>Error al Modificar Pista</h1>
    <p><%= request.getParameter("mensaje") %></p>
    <button onclick="location.href='../../../Controller/pistas/ModificarPista.jsp'">Volver al Formulario</button>
    <button onclick="location.href='../dashboard.jsp'">Volver al Menú Principal</button>
</body>
</html>
