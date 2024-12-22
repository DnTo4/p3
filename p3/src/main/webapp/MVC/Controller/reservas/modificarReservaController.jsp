<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="es.uco.practica3.data.dao.ReservaDAO" %>
<%@ page import="es.uco.practica3.business.gestores.GestorReservas" %>
<%
    // Inicializar variables
    String nextPage = "../../View/jsp/reservas/modificarReservaError.jsp";
    String mensajeNextPage = "";

    // Recuperar parámetros del formulario
   	String fechaParam = request.getParameter("fecha");
	java.sql.Date fecha = java.sql.Date.valueOf(fechaParam);
    int duracion = Integer.parseInt(request.getParameter("duracion"));
    int id_pista = Integer.parseInt(request.getParameter("id_pista"));
    int precio;
    if(duracion == 60)
    {
    	precio=20;
    }
    else if(duracion == 90)
    {
    	precio=30;
    }
    else
    {
    	precio=40;
    }
    int num_ninios = Integer.parseInt(request.getParameter("num_ninios"));
    int num_adultos = Integer.parseInt(request.getParameter("num_adultos"));

    // Validar parámetros

        try {

            // Llamar al DAO para actualizar el estado de la reserva
            GestorReservas gestor = new GestorReservas();
        	boolean resultado;
            resultado = gestor.modificarReserva(fecha, duracion, id_pista, precio, num_ninios, num_adultos);
        
            if (resultado == true) {
                // Redirigir a la página de éxito si la actualización fue exitosa
                nextPage = "../../View/jsp/reservas/modificarReservaExito.jsp";
                mensajeNextPage = "El estado de la reserva se actualizó correctamente.";
            } else {
                // Redirigir a la página de error si no se encontró la reserva
                mensajeNextPage = "No se pudo actualizar el estado de la reserva. Verifique el nombre.";
            }
        } catch (NumberFormatException e) {
            mensajeNextPage = "El estado proporcionado no es válido.";
        } catch (Exception e) {
            mensajeNextPage = "Ocurrió un error al procesar la solicitud: " + e.getMessage();
        }

    // Redirigir a la página correspondiente
%>
<jsp:forward page="<%=nextPage%>">
    <jsp:param name="message" value="<%=mensajeNextPage%>" />
</jsp:forward>