<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="es.uco.practica3.business.gestores.GestorReservas" %>
<%@ page import="es.uco.practica3.business.gestores.GestorPistas" %>
<%@ page import="es.uco.practica3.business.DTO.ReservasDTO" %>
<%@ page import="es.uco.practica3.business.DTO.PistaDTO" %>
<%@ page import="java.util.Date" %>
<%
    // Valores predeterminados
    String nextPage = "../../View/jsp/reservas/crearReservaError.jsp";
    String mensaje = "Error desconocido";

    try {
        // Recuperar datos del formulario
        String fechaParam = request.getParameter("fecha");
		java.sql.Date fecha = java.sql.Date.valueOf(fechaParam);
        int duracion = Integer.parseInt(request.getParameter("duracion"));
        String pista_nombre = request.getParameter("pista");
        GestorPistas gestorP= new GestorPistas();
        PistaDTO pista= gestorP.buscarPistaNombre(pista_nombre);
        int id_pista=pista.getId();
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
        int descuento;
        int tipo_reserva = Integer.parseInt(request.getParameter("tipo_reserva"));
        int num_ninios = Integer.parseInt(request.getParameter("num_ninios"));
        int num_adultos = Integer.parseInt(request.getParameter("num_adultos"));
        int id_bono = Integer.parseInt(request.getParameter("id_bono"));
        if(id_bono !=0)
        {
        	descuento=5;
        }
        String correo = request.getParameter("correo");

        // Llamar al GestorReservas
        GestorReservas gestor = new GestorReservas();
        int resultado;
        ReservasDTO reserva= new ReservasDTO();
        if(id_bono==0)
        {
            reserva = gestor.crearReservaIndividual(fecha, duracion, id_pista, precio, descuento, tipo_reserva, num_ninios, num_adultos, correo);
            if(reserva.getDuracion() < 60)
            {
            	resultado = 0;
            }
            else
            {
            	resultado =1;
            }
        }
        else
        {
            reserva = gestor.crearReservaBono(fecha, duracion, id_pista, precio, descuento, tipo_reserva, num_ninios, num_adultos, id_bono, correo);
            if(reserva.getDuracion() < 60)
            {
            	resultado = 0;
            }
            else
            {
            	resultado =1;
            }
        }

        if (resultado > 0) {
            // Éxito
            nextPage = "../../View/jsp/reservas/CrearReservaExito.jsp";
            mensaje = "La reserva ha sido creada exitosamente.";
        } else if (resultado == 0) {
            mensaje = "La reserva ya existe.";
        } else {
            mensaje = "Hubo un error al crear la reserva.";
        }
    } catch (Exception e) {
        mensaje = "Ocurrió un error al procesar la solicitud: " + e.getMessage();
    }

    // Configurar mensaje y redirigir
    request.setAttribute("mensaje", mensaje);
    request.getRequestDispatcher(nextPage).forward(request, response);
%>