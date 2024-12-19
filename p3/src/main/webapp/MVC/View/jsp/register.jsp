<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean  id="customerBean" scope="session" class="es.uco.practica3.display.CustomerBean"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Prueba de MVC</title>
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
<a href="/p3/MVC/Controller/register/registerController.jsp">Acceder</a>
<% } else { %>
	¡¡Usuario <jsp:getProperty property="emailUser" name="customerBean"/> agregado correctamente!! 
	<a href=/p3/MVC/View/jsp/login.jsp>Acceder a la web</a>
<% } %>

</body>
</html>