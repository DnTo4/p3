<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="es.uco.practica3.data.dao.PistaDAO" %>
<%
    // Inicializar variables
    String nextPage = "../../View/jsp/Pistas/ModificarPistaError.jsp";
    String mensajeNextPage = "";

    // Recuperar parámetros del formulario
    String nombre = request.getParameter("nombre");
    String estadoStr = request.getParameter("estado");

    // Validar parámetros
    if (nombre != null && !nombre.trim().isEmpty() && estadoStr != null) {
        try {
            int estado = Integer.parseInt(estadoStr);

            // Llamar al DAO para actualizar el estado de la pista
            PistaDAO pistaDAO = new PistaDAO();
            int resultado = pistaDAO.modificarEstadoPista(nombre, estado);

            if (resultado > 0) {
                // Redirigir a la página de éxito si la actualización fue exitosa
                nextPage = "../../View/jsp/Pistas/ModificarPistaExito.jsp";
                mensajeNextPage = "El estado de la pista '" + nombre + "' se actualizó correctamente.";
            } else {
                // Redirigir a la página de error si no se encontró la pista
                mensajeNextPage = "No se pudo actualizar el estado de la pista. Verifique el nombre.";
            }
        } catch (NumberFormatException e) {
            mensajeNextPage = "El estado proporcionado no es válido.";
        } catch (Exception e) {
            mensajeNextPage = "Ocurrió un error al procesar la solicitud: " + e.getMessage();
        }
    } else {
        mensajeNextPage = "Debe proporcionar un nombre y un estado válidos.";
    }

    // Redirigir a la página correspondiente
%>
<jsp:forward page="<%=nextPage%>">
    <jsp:param name="message" value="<%=mensajeNextPage%>" />
</jsp:forward>
