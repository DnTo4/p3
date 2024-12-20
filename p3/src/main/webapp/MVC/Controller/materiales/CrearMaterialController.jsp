<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="es.uco.practica3.business.gestores.GestorPistas" %>
<%
    // Valores predeterminados
    String nextPage = "../../View/jsp/materiales/CrearMaterialError.jsp";
    String mensaje = "";

    try {
        // Recuperar datos del formulario
        int tipo = Integer.parseInt(request.getParameter("tipo")); // 1 CANASTAS; 2 CONOS; 3 PELOTAS
        int uso_material = Integer.parseInt(request.getParameter("uso_material")); // 1 INTERIOR; 2 EXTERIOR
        int estado = Integer.parseInt(request.getParameter("estado")); // 1 DISPONIBLE; 2 RESERVADO; 3 MALESTADO

        // Llamar al GestorMateriales
        GestorPistas gestor = new GestorPistas();
        int resultado = gestor.crearMat(tipo, uso_material, estado);

        if (resultado != -1) {
            // Éxito
            nextPage = "../../View/jsp/materiales/CrearMaterialExito.jsp";
            mensaje = "El material ha sido creado exitosamente.";
        } else {
        	mensaje = "Hubo un error al crear el material.";
        }
    } catch (Exception e) {
        mensaje = "Ocurrió un error al procesar la solicitud: " + e.getMessage();
    }

    // Configurar mensaje y redirigir
    request.setAttribute("mensaje", mensaje);
    request.getRequestDispatcher(nextPage).forward(request, response);
%>
