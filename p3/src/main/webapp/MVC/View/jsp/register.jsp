<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="customerBean" scope="session" class="es.uco.practica3.display.CustomerBean"></jsp:useBean>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Prueba de MVC</title>
    <link rel="stylesheet" href="/p3/MVC/View/css/stylesRegistro.css">
</head>
<body>
    <div class="container">
        <% 
        //Este código de reset es únicamente para poder probar múltiples veces el MVC
        if (request.getParameter("reset") != null) {
        %>
        <jsp:setProperty property="emailUser" value="" name="customerBean"/>
        <% } %>

        <% if (customerBean == null || customerBean.getEmailUser().equals("")) { %>
            <h1>Bienvenido</h1>
            <p>No has iniciado sesión. Haz clic en el botón para acceder.</p>
            <a href="/p3/MVC/Controller/register/registerController.jsp">Acceder</a>
        <% } else { %>
            <h1 class="success">¡Registro Exitoso!</h1>
            <p>¡¡Usuario <jsp:getProperty property="emailUser" name="customerBean"/> agregado correctamente!!</p>
            <a href="/p3/MVC/View/html/menuCliente.html">Acceder a la web</a>
        <% } %>
    </div>
</body>
</html>
