<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="es.uco.practica3.business.gestores.GestorReservas" %>
<%@ page import="es.uco.practica3.business.DTO.BonoDTO" %>
<%@ page import="es.uco.practica3.display.CustomerBean" %>
<jsp:useBean  id="customerBean" scope="session" class="es.uco.practica3.display.CustomerBean"></jsp:useBean>
<%
    // Valores predeterminados
    String nextPage = "/p3/MVC/View/jsp/bonos/CrearBonoError.jsp";
    String mensaje = "No se ha iniciado sesion";

    if (customerBean == null || customerBean.getEmailUser().equals(""))
    {
    	response.sendRedirect(nextPage+"?mensaje="+mensaje);
    }
    
    try {
        // Recuperar datos del formulario
        int tamanioPista = Integer.parseInt(request.getParameter("tamanio_pista"));

        // Calcular fecha de expiración: un año desde la fecha actual
        LocalDate fechaActual = LocalDate.now();
        LocalDate fechaExpiracion = fechaActual.plusYears(1);

        // Convertir LocalDate a java.util.Date
        Date fechaExpiracionDate;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        fechaExpiracionDate = sdf.parse(fechaExpiracion.toString());

        // Llamar al gestor para crear el bono
        GestorReservas gestor = new GestorReservas();
        BonoDTO bono = new BonoDTO(tamanioPista, customerBean.getId(), 5, fechaExpiracionDate);
        boolean resultado = gestor.createBono(bono);

        if (resultado) {
            // Éxito
            nextPage = "/p3/MVC/View/jsp/bonos/CrearBonoSuccess.jsp";
            mensaje = "El bono ha sido creado exitosamente.";
        } else {
            mensaje = "Hubo un error al crear el bono.";
        }
    } catch (Exception e) {
        mensaje = "Ocurrió un error al procesar la solicitud: " + e.getMessage();
    }

    // Configurar mensaje y redirigir
    response.sendRedirect(nextPage+"?mensaje="+mensaje);
%>

