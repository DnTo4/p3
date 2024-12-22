<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ page import="es.uco.practica3.business.DTO.ReservasDTO" %>
<%@ page import="es.uco.practica3.data.dao.ReservaDAO" %>
<%@ page import="es.uco.practica3.display.CustomerBean" %>

<%
    // Valores predeterminados
    String nextPage = "../../View/jsp/reservas/consultarReservasError.jsp";
    String mensaje = "Error desconocido";
    List<ReservasDTO> reservas = new ArrayList<>();

    try {
        // Recuperar el usuario que ha iniciado sesión
        CustomerBean customerBean = (CustomerBean) session.getAttribute("customerBean");

        if (customerBean != null && customerBean.getEmailUser() != null) {
            String emailUser = customerBean.getEmailUser();

            // Recuperar las fechas desde el formulario
            String fechaInicioStr = request.getParameter("fecha_inicio");
            String fechaFinStr = request.getParameter("fecha_fin");

            if (fechaInicioStr != null && fechaFinStr != null) {
                java.sql.Date fechaInicio = java.sql.Date.valueOf(fechaInicioStr);
                java.sql.Date fechaFin = java.sql.Date.valueOf(fechaFinStr);

                // Consultar reservas del usuario en el rango de fechas
                ReservaDAO reservaDAO = new ReservaDAO();
                reservas = reservaDAO.listarReservasPorRangoFechas(fechaInicio, fechaFin, emailUser);

                if (reservas.isEmpty()) {
                    mensaje = "No se encontraron reservas en el rango de fechas seleccionado.";
                } else {
                    nextPage = "../../View/jsp/reservas/consultarReservasExito.jsp";
                    mensaje = "Se encontraron las siguientes reservas.";
                }
            } else {
                mensaje = "Por favor, selecciona ambas fechas.";
            }
        } else {
            mensaje = "El usuario no ha iniciado sesión.";
        }
    } catch (Exception e) {
        mensaje = "Ocurrió un error al procesar la solicitud: " + e.getMessage();
    }

    // Configurar los datos y redirigir a la página correspondiente
    request.setAttribute("mensaje", mensaje);
    request.setAttribute("reservas", reservas);
    request.getRequestDispatcher(nextPage).forward(request, response);
%>

