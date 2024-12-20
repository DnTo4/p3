<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="es.uco.practica3.business.DTO.JugadorDTO,es.uco.practica3.data.dao.JugadorDAO" %>
<%@page errorPage="errorPage.jsp" %>
<jsp:useBean  id="customerBean" scope="session" class="es.uco.practica3.display.CustomerBean"></jsp:useBean>
<%
String nextPage = "../../View/html/menuCliente.html";
String mensajeNextPage = "";

if (customerBean == null || customerBean.getEmailUser().equals("")) {
    String emailUser = request.getParameter("correo_electronico");
    String password = request.getParameter("contrasenia");

    if (emailUser != null) {
        JugadorDAO jugadorDAO = new JugadorDAO();
        JugadorDTO jugador = jugadorDAO.getJugadorByEmail(emailUser);

        if (jugador != null) {
            if (jugador.getPassword().equals(password)) {
                if (jugador.getRol() == 1) {
                    nextPage = "../../View/html/menuAdmin.html";
                } else {
                    nextPage = "../../View/html/menuCliente.html";
                }
                // Actualizar customerBean
                customerBean.setEmailUser(emailUser);
            } else {
                nextPage = "../../View/jsp/loginView.jsp?message=Contrasenia incorrecta.";
            }
        } else {
            nextPage = "../../View/jsp/loginView.jsp?message=El usuario no existe.";
        }
    } else {
        nextPage = "../../View/jsp/loginView.jsp";
    }
} else {
    // Usuario ya logueado
    nextPage = "../../View/html/menuCliente.html";
}

// Redirigir a la página correspondiente
response.sendRedirect(nextPage);
%>
