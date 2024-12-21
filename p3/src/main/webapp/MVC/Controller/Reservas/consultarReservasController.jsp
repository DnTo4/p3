<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="es.uco.practica3.business.gestores.GestorReservas" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="es.uco.practica3.business.DTO.ReservasDTO" %>
<%
    // Valores predeterminados
    String nextPage = "../../View/jsp/Reservas/ConsultarReservasError.jsp";
    String mensaje = "Error desconocido";
    List<ReservasDTO> reservasFuturas = null;
    List<ReservasDTO> reservasFinalizadas = null;

    try {
        // Recuperar los parámetros de fecha de inicio y fin
        String fechaInicioStr = request.getParameter("fecha_inicio");
        String fechaFinStr = request.getParameter("fecha_fin");
        int idJugador = Integer.parseInt(request.getParameter("id_jugador"));

        // Convertir las fechas recibidas de String a Date
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date fechaInicio = sdf.parse(fechaInicioStr);
        Date fechaFin = sdf.parse(fechaFinStr);

        // Llamar al GestorReservas para obtener las reservas
        GestorReservas gestor = new GestorReservas();
        List<ReservasDTO> reservas = gestor.consultarReservasPorRangoFechas(fechaInicio, fechaFin);

        // Filtrar las reservas en futuras y finalizadas
        reservasFuturas = new ArrayList<>();
        reservasFinalizadas = new ArrayList<>();
        
        for (ReservasDTO reserva : reservas) {
            if (reserva.getFecha().after(new Date())) {
                reservasFuturas.add(reserva);
            } else {
                reservasFinalizadas.add(reserva);
            }
        }

        if (!reservasFuturas.isEmpty() || !reservasFinalizadas.isEmpty()) {
            nextPage = "../../View/jsp/Reservas/ConsultarReservasExito.jsp";
            mensaje = "Reservas encontradas.";
        } else {
            mensaje = "No se encontraron reservas en el rango de fechas especificado.";
        }
    } catch (Exception e) {
        mensaje = "Ocurrió un error al procesar la solicitud: " + e.getMessage();
    }

    // Configurar mensaje y redirigir
    request.setAttribute("mensaje", mensaje);
    request.setAttribute("reservasFuturas", reservasFuturas);
    request.setAttribute("reservasFinalizadas", reservasFinalizadas);
    request.getRequestDispatcher(nextPage).forward(request, response);
%>
