<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="es.uco.practica3.data.dao.PistaDAO" %>
<%@ page import="es.uco.practica3.business.DTO.PistaDTO" %>
<%
    // Inicializar variables
    String nextPage = "../../View/jsp/Pistas/BorrarPistaError.jsp";
    String mensajeNextPage = "";

    // Recuperar parámetros del formulario
    String nombre = request.getParameter("nombre");

    // Validar parámetros
    if (nombre != null && !nombre.trim().isEmpty()) {
        try {
            // Llamar al DAO para borrar la pista
            PistaDAO pistaDAO = new PistaDAO();
            PistaDTO pista = new PistaDTO(nombre, 1, 1, 1, 0);
            int resultado = pistaDAO.borrarPista(pista);

            if (resultado == 1) {
                // Redirigir a la página de éxito si la pista fue borrada
                nextPage = "../../View/jsp/Pistas/BorrarPistaExito.jsp";
                mensajeNextPage = "La pista '" + nombre + "' se borró correctamente.";
            } else {
                // Redirigir a la página de error si no se encontró la pista
                mensajeNextPage = "No se encontró ninguna pista con el nombre proporcionado.";
            }
        } catch (Exception e) {
            mensajeNextPage = "Ocurrió un error al procesar la solicitud: " + e.getMessage();
        }
    } else {
        mensajeNextPage = "Debe proporcionar un nombre válido.";
    }

    // Redirigir a la página correspondiente
%>
<jsp:forward page="<%=nextPage%>">
    <jsp:param name="message" value="<%=mensajeNextPage%>" />
</jsp:forward>
