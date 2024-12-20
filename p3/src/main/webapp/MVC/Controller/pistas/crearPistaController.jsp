<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="es.uco.practica3.business.gestores.GestorPistas" %>
<%
    // Valores predeterminados
    String nextPage = "../../View/jsp/pistaError.jsp";
    String mensaje = "Error desconocido";

    try {
        // Recuperar datos del formulario
        String nombre = request.getParameter("nombre");
        int estado = Integer.parseInt(request.getParameter("estado"));
        int tipo = Integer.parseInt(request.getParameter("tipo"));
        int tamanio = Integer.parseInt(request.getParameter("tamanio"));
        int jugadoresMax = Integer.parseInt(request.getParameter("jugadores_max"));

        // Llamar al GestorPistas
        GestorPistas gestor = new GestorPistas();
        int resultado = gestor.crearPista(nombre, estado, tipo, tamanio, jugadoresMax);

        if (resultado > 0) {
            // Éxito
            nextPage = "../../View/jsp/pistaExito.jsp";
            mensaje = "La pista '" + nombre + "' ha sido creada exitosamente.";
        } else if (resultado == 0) {
            mensaje = "La pista ya existe.";
        } else {
            mensaje = "Hubo un error al crear la pista.";
        }
    } catch (Exception e) {
        mensaje = "Ocurrió un error al procesar la solicitud: " + e.getMessage();
    }

    // Configurar mensaje y redirigir
    request.setAttribute("mensaje", mensaje);
    request.getRequestDispatcher(nextPage).forward(request, response);
%>
