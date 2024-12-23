<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="es.uco.practica3.business.DTO.JugadorDTO,es.uco.practica3.data.dao.JugadorDAO" %>
<%@ page import ="es.uco.practica3.display.CustomerBean" %>
<%@page errorPage="errorPage.jsp" %>
<jsp:useBean  id="customerBean" scope="session" class="es.uco.practica3.display.CustomerBean"></jsp:useBean>
<%
String nextPage = "../../View/jsp/menuCliente.jsp";
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
                    nextPage = "../../View/jsp/menuAdmin.jsp";
                } else {
                    nextPage = "../../View/jsp/menuCliente.jsp";
                }
                // Actualizar customerBean
                customerBean.setEmailUser(emailUser);
                customerBean.setRol(jugador.getRol());
                customerBean.setNombre(jugador.getNombre());
                customerBean.setFechaInscripcion(jugador.getFechaInscripcion());
                customerBean.setFecha_nacimiento(jugador.getFechaNacimiento());
                customerBean.setContrasenia(jugador.getPassword());
                customerBean.setApellidos(jugador.getApellidos());
                
                
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
    nextPage = "/p3/MVC/View/jsp/menuAdmin.jsp";
}

// Redirigir a la página correspondiente
response.sendRedirect(nextPage);
%>
