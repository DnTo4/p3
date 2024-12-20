<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="es.uco.practica3.business.DTO.PistaDTO, es.uco.practica3.data.dao.PistaDAO" %>
<%
    String nombre = request.getParameter("nombre");
    int estado = Integer.parseInt(request.getParameter("estado"));

    String nextPage = "../Pistas/ModificarPistaExito.jsp"; // Página de éxito por defecto
    String mensajeNextPage = "";

    PistaDAO pistaDAO = new PistaDAO();

    if (pistaDAO.existePista(nombre)) {
        int resultado = pistaDAO.modificarEstadoPista(nombre, estado);

        if (resultado != 1) {
            nextPage = "../Pistas/ModificarPistaError.jsp"; // Error al actualizar
            mensajeNextPage = "Hubo un problema al actualizar el estado de la pista.";
        }
    } else {
        nextPage = "../Pistas/ModificarPistaError.jsp"; // Error: pista no existe
        mensajeNextPage = "La pista indicada no existe.";
    }
%>
<jsp:forward page="<%=nextPage%>">
    <jsp:param name="mensaje" value="<%=mensajeNextPage%>" />
</jsp:forward>
