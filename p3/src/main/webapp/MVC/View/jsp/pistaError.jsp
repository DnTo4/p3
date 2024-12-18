<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Error al Crear Pista</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
    <h1>Error al Crear Pista</h1>
    <p><%= request.getAttribute("mensajeError") %></p>
    <a href="crearPista.jsp">Volver al formulario</a>
</body>
</html>