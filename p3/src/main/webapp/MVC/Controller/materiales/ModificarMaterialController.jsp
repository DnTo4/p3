<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="es.uco.practica3.business.gestores.GestorPistas" %>
<%
    // Valores predeterminados
    String nextPage = "../../View/jsp/materiales/ModificarMaterialError.jsp";
    String mensaje = "Error desconocido";

    try {
        // Recuperar datos del formulario
        int tipo = Integer.parseInt(request.getParameter("tipo"));
        int estado = Integer.parseInt(request.getParameter("estado"));

        // Llamar al GestorMateriales
        GestorPistas gestor = new GestorPistas();
        int resultado = gestor.modificarEstadoMat(tipo, estado);

        if (resultado != 0 && resultado != -1) {
            // Éxito
            nextPage = "../../View/jsp/materiales/ModificarMaterialExito.jsp";
            mensaje = "El estado del material ha sido modificado exitosamente.";
        } else {
            mensaje = "No se pudo modificar el estado del material. Verifica los datos ingresados.";
        }
    } catch (Exception e) {
        mensaje = "Ocurrió un error al procesar la solicitud: " + e.getMessage();
    }

    // Configurar mensaje y redirigir
    request.setAttribute("mensaje", mensaje);
    request.getRequestDispatcher(nextPage).forward(request, response);
%>
