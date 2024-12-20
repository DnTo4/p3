<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean  id="customerBean" scope="session" class="es.uco.practica3.display.CustomerBean"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/styles.css">
<title>Log in</title>
</head>
<body>
<%
/* Posibles flujos:
	1) customerBean está logado (!= null && != "") -> Se redirige al index.jsp (no debería estar aquí pero hay que comprobarlo)
	2) customerBean no está logado:
		a) Hay parámetros en el request  -> procede del controlador /con mensaje 
		b) No hay parámetros en el request -> procede del controlador /sin mensaje
	*/
String nextPage = "../../Controller/login/loginController.jsp";
String messageNextPage = request.getParameter("message");
if (messageNextPage == null) messageNextPage = "";

if (customerBean != null && !customerBean.getEmailUser().equals("")) {
	//No debería estar aquí -> flujo salta a index.jsp
	nextPage = "../../../index.html";
} else {
%>
<%= messageNextPage %><br/><br/>
<form method="post" action="../../Controller/login/loginController.jsp">
	<label for="correo_electronico">Email: </label>
	<input type ="text" name="correo_electronico" value=""><br/>
	<label for="contrasenia">Password: </label>
	<input type ="password" name="contrasenia" value="">
	<br/>
	<input type="submit" value="Acceder">
</form>
<%
}
%>

</body>
</html>