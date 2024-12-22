<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="es.uco.practica3.business.gestores.GestorPistas" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="es.uco.practica3.business.DTO.PistaDTO" %>
<%
    // Valores predeterminados
    String nextPage = "../../View/jsp/Pistas/buscarPistaError.jsp";
    String mensaje = "Error desconocido";
    List<PistaDTO> pistasDisponibles = null;

    try {
        // Recuperar los parámetros de búsqueda
        int tipo = Integer.parseInt(request.getParameter("tipo"));
        String fecha = request.getParameter("fecha");
        
        SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date fechaUtil = formatoFecha.parse(fecha);
        java.sql.Date fechaSql = new java.sql.Date(fechaUtil.getTime());

        // Llamar al GestorPistas para obtener las pistas disponibles
        GestorPistas gestor = new GestorPistas();
        pistasDisponibles = gestor.buscarPistasDisponibles(tipo, fechaSql);

        if (pistasDisponibles != null && !pistasDisponibles.isEmpty()) {
            // Si se encontraron pistas disponibles
            nextPage = "../../View/jsp/Pistas/buscarPistaExito.jsp";
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
