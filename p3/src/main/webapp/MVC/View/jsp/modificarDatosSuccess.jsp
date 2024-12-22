<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Éxito en la modificación de los datos</title>
    <link rel="stylesheet" type="text/css" href="../../View/css/styles.css">
</head>
<body>
    <h1>Datos modificados con éxito</h1>
    <!-- Mostrar el mensaje de la URL -->
    <div class="message">
        <% if (request.getParameter("message") != null) { %>
            <p><%= request.getParameter("message") %></p>
        <% } %>
    </div>
    <div class="buttons">
        <a href="../../View/jsp/modificarDatosView.jsp" class="btn">Volver al formulario</a>
        <a href="../../View/jsp/menuAdmin.jsp" class="btn">Volver al menú principal</a>
    </div>
</body>
</html>