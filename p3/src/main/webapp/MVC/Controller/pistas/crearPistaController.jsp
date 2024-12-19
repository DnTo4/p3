<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="es.uco.practica3.business.gestores.GestorPistas" %>
<%@page errorPage="errorPage.jsp" %>
<%
/* 
Control de flujo para la creación de pistas:

1) Si el usuario no envió parámetros (viene de crearPista.jsp), se redirige al formulario.
2) Si hay parámetros enviados:
    a) Se validan los datos y se intenta crear la pista.
    b) Dependiendo del resultado, se redirige a la página de éxito o de error.
*/

// Por defecto, redirigir al formulario de creación
String nextPage = "/MVC/View/jsp/crearPista.jsp";
String mensajeNextPage = "";

// Recuperar parámetros del formulario
String nombre = request.getParameter("nombre");
String estadoParam = request.getParameter("estado");
String tipoParam = request.getParameter("tipo");
String tamanioParam = request.getParameter("tamanio");
String jugadoresMaxParam = request.getParameter("jugadores_max");

// Verificar si hay parámetros (el formulario ha sido enviado)
if (nombre != null && estadoParam != null && tipoParam != null && tamanioParam != null && jugadoresMaxParam != null) {
    try {
        // Convertir parámetros
        int estado = Integer.parseInt(estadoParam);
        int tipo = Integer.parseInt(tipoParam);
        int tamanio = Integer.parseInt(tamanioParam);
        int jugadoresMax = Integer.parseInt(jugadoresMaxParam);

        // Lógica de negocio
        GestorPistas gestorPistas = new GestorPistas();
        int resultado = gestorPistas.crearPista(nombre, estado, tipo, tamanio, jugadoresMax);

        // Redirigir según el resultado
        if (resultado > 0) {
            nextPage = "/MVC/View/jsp/pistaExito.jsp";
            mensajeNextPage = "La pista '" + nombre + "' ha sido creada con éxito.";
        } else if (resultado == 0) {
            nextPage = "/MVC/View/jsp/pistaError.jsp";
            mensajeNextPage = "La pista ya existe en el sistema.";
        } else {
            nextPage = "/MVC/View/jsp/pistaError.jsp";
            mensajeNextPage = "Error desconocido al crear la pista.";
        }
    } catch (NumberFormatException e) {
        nextPage = "/MVC/View/jsp/pistaError.jsp";
        mensajeNextPage = "Los datos proporcionados no son válidos.";
    } catch (Exception e) {
        nextPage = "/MVC/View/jsp/pistaError.jsp";
        mensajeNextPage = "Ocurrió un error inesperado: " + e.getMessage();
    }
}
%>
<jsp:forward page="<%=nextPage%>">
    <jsp:param name="mensaje" value="<%=mensajeNextPage%>" />
</jsp:forward>
