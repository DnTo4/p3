<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean  id="customerBean" scope="session" class="es.uco.practica3.display.CustomerBean"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log in</title>
</head>
<body>
<% 
//Este código de reset es únicamente para poder probar múltiples veces el MVC
if (request.getParameter("reset") != null) {
%>
<jsp:setProperty property="emailUser" value="" name="customerBean"/>
<%
}
if (customerBean == null || customerBean.getEmailUser()=="") {
	// Usuario no logado -> Se invoca al controlador de la funcionalidad
%>
<a href="/p3/MVC/Controller/login/loginController.jsp">Acceder</a>
<% } else { %>
	¡¡Bienvenido <jsp:getProperty property="emailUser" name="customerBean"/>!! 
	<a href=/p3/MVC/View/jsp/logout.jsp>Desconectarse</a>
<% } %>

</body>
</html>