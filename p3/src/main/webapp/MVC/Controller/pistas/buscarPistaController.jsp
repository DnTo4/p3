<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="es.uco.practica3.business.gestores.GestorPistas" %>
<%@ page import="java.util.List" %>
<%@ page import="es.uco.practica3.business.models.Pista" %>
<%
    // Valores predeterminados
    String nextPage = "../../View/jsp/Pistas/BuscarPistaError.jsp";
    String mensaje = "Error desconocido";
    List<Pista> pistasDisponibles = null;

    try {
        // Recuperar los parámetros de búsqueda
        int tipo = Integer.parseInt(request.getParameter("tipo"));
        String fecha = request.getParameter("fecha");

        // Llamar al GestorPistas para obtener las pistas disponibles
        GestorPistas gestor = new GestorPistas();
        pistasDisponibles = gestor.buscarPistasDisponibles(tipo, fecha);

        if (pistasDisponibles != null && !pistasDisponibles.isEmpty()) {
            // Si se encontraron pistas disponibles
            nextPage = "../../View/jsp/Pistas/BuscarPistaExito.jsp";
            mensaje = "Pistas disponibles encontradas.";
        } else {
            mensaje = "No se encontraron pistas disponibles para el tipo seleccionado y la fecha.";
        }
    } catch (Exception e) {
        mensaje = "Ocurrió un error al procesar la solicitud: " + e.getMessage();
    }

    // Configurar mensaje y redirigir
    request.setAttribute("mensaje", mensaje);
    request.setAttribute("pistasDisponibles", pistasDisponibles);
    request.getRequestDispatcher(nextPage).forward(request, response);
%>
