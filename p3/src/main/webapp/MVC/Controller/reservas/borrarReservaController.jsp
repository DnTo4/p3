<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="es.uco.practica3.data.dao.ReservaDAO" %>
<%@ page import="es.uco.practica3.business.DTO.ReservasDTO" %>
<%@ page import="es.uco.practica3.business.gestores.GestorReservas" %>
<%@ page import="java.util.Date" %>
<%
    // Inicializar variables
    String nextPage = "../../View/jsp/reservas/borrarReservaError.jsp";
    String mensajeNextPage = "";

    // Recuperar parámetros del formulario
	String fechaParam = request.getParameter("fecha");
	java.sql.Date fecha = java.sql.Date.valueOf(fechaParam);
    int id_pista = Integer.parseInt(request.getParameter("id_pista"));
    // Validar parámetros
    if (id_pista <= 0 && fechaParam != null && !fechaParam.isEmpty()) {
        try {
            // Llamar al DAO para borrar la reserva

            GestorReservas gestor = new GestorReservas();
            boolean resultado = gestor.cancelarReserva(id_pista, fecha);

            if (resultado == true) {
                // Redirigir a la página de éxito si la reserva fue borrada
                nextPage = "../../View/jsp/reservas/borrarReservaExito.jsp";
                mensajeNextPage = "La reserva se borró correctamente.";
            } else {
                // Redirigir a la página de error si no se encontró la reserva
                mensajeNextPage = "No se encontró ninguna reserva con los datos proporcionados.";
            }
        } catch (Exception e) {
            mensajeNextPage = "Ocurrió un error al procesar la solicitud: " + e.getMessage();
        }
    } else {
        mensajeNextPage = "Debe proporcionar datos válidos.";
    }

    // Redirigir a la página correspondiente
%>
<jsp:forward page="<%=nextPage%>">
    <jsp:param name="message" value="<%=mensajeNextPage%>" />
</jsp:forward>
