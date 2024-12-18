package es.uco.practica3.business.servlets;

import es.uco.practica3.business.DTO.ReservasDTO;
import es.uco.practica3.business.gestores.GestorReservas;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet("/reserva")
public class ReservaServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    private GestorReservas gestorReservas = new GestorReservas();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "crearReservaIndividual":
                crearReservaIndividual(request, response);
                break;
            case "crearReservaBono":
                crearReservaBono(request, response);
                break;
            case "modificarReserva":
                modificarReserva(request, response);
                break;
            case "cancelarReserva":
                cancelarReserva(request, response);
                break;
            case "consultarReservasRango":
                consultarReservasRangoFechas(request, response);  // NUEVO
                break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Acción no válida.");
                break;
        }
    }


    private void crearReservaIndividual(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Date fecha = Date.valueOf(request.getParameter("fecha"));
        int duracion = Integer.parseInt(request.getParameter("duracion"));
        int idPista = Integer.parseInt(request.getParameter("id_pista"));
        float precio = Float.parseFloat(request.getParameter("precio"));
        float descuento = Float.parseFloat(request.getParameter("descuento"));
        int tipoReserva = Integer.parseInt(request.getParameter("tipo_reserva"));
        int numNinos = Integer.parseInt(request.getParameter("num_ninos"));
        int numAdultos = Integer.parseInt(request.getParameter("num_adultos"));
        String correo = request.getParameter("correo");

        gestorReservas.crearReservaIndividual(fecha, duracion, idPista, precio, descuento, tipoReserva, numNinos, numAdultos, correo);
        response.sendRedirect("reservas?status=success");
    }

    private void crearReservaBono(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Date fecha = Date.valueOf(request.getParameter("fecha"));
        int duracion = Integer.parseInt(request.getParameter("duracion"));
        int idPista = Integer.parseInt(request.getParameter("id_pista"));
        float precio = Float.parseFloat(request.getParameter("precio"));
        float descuento = Float.parseFloat(request.getParameter("descuento"));
        int tipoReserva = Integer.parseInt(request.getParameter("tipo_reserva"));
        int numNinos = Integer.parseInt(request.getParameter("num_ninos"));
        int numAdultos = Integer.parseInt(request.getParameter("num_adultos"));
        int idBono = Integer.parseInt(request.getParameter("id_bono"));
        String correo = request.getParameter("correo");

        gestorReservas.crearReservaBono(fecha, duracion, idPista, precio, descuento, tipoReserva, numNinos, numAdultos, idBono, correo);
        response.sendRedirect("reservas?status=success");
    }

    private void modificarReserva(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Date fecha = Date.valueOf(request.getParameter("fecha"));
        int duracion = Integer.parseInt(request.getParameter("duracion"));
        int idPista = Integer.parseInt(request.getParameter("id_pista"));
        float precio = Float.parseFloat(request.getParameter("precio"));
        float descuento = Float.parseFloat(request.getParameter("descuento"));
        int tipoReserva = Integer.parseInt(request.getParameter("tipo_reserva"));
        int numNinos = Integer.parseInt(request.getParameter("num_ninos"));
        int numAdultos = Integer.parseInt(request.getParameter("num_adultos"));

        boolean result = gestorReservas.modificarReserva(fecha, duracion, idPista, precio, descuento, tipoReserva, numNinos, numAdultos);
        
        if (result) {
            response.sendRedirect("reservas?status=success");
        } else {
            response.sendRedirect("reservas?status=failure");
        }
    }

    private void cancelarReserva(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int idPista = Integer.parseInt(request.getParameter("id_pista"));
        Date fecha = Date.valueOf(request.getParameter("fecha"));

        boolean result = gestorReservas.cancelarReserva(idPista, fecha);
        
        if (result) {
            response.sendRedirect("reservas?status=success");
        } else {
            response.sendRedirect("reservas?status=failure");
        }
    }

    private void consultarReservasFuturas(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<ReservasDTO> reservasFuturas = gestorReservas.consultarReservasFuturas();
        
        request.setAttribute("reservasFuturas", reservasFuturas);
        
        // Aquí se debería redirigir a una página JSP para mostrar las reservas futuras
        request.getRequestDispatcher("/reservas_futuras.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    private void consultarReservasRangoFechas(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Obtenemos las fechas de inicio y fin de la solicitud
            String fechaInicioStr = request.getParameter("fechaInicio");
            String fechaFinStr = request.getParameter("fechaFin");

            // Convertir las fechas a tipo Date
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date fechaInicio = sdf.parse(fechaInicioStr);
            Date fechaFin = sdf.parse(fechaFinStr);

            // Consultar las reservas entre las fechas
            List<ReservasDTO> reservas = gestorReservas.consultarReservasPorRangoFechas(fechaInicio, fechaFin);

            // Separar las reservas en futuras y finalizadas
            List<ReservasDTO> reservasFuturas = new ArrayList<>();
            List<ReservasDTO> reservasFinalizadas = new ArrayList<>();
            Date currentDate = new Date(); // Fecha actual

            for (ReservasDTO reserva : reservas) {
                if (reserva.getFecha().after(currentDate)) {
                    reservasFuturas.add(reserva);  // Si la fecha de la reserva es posterior a la actual
                } else {
                    reservasFinalizadas.add(reserva);  // Si la fecha de la reserva es anterior a la actual
                }
            }

            // Pasamos las reservas a la vista JSP
            request.setAttribute("reservasFuturas", reservasFuturas);
            request.setAttribute("reservasFinalizadas", reservasFinalizadas);

            // Redirigimos a la vista JSP para mostrar las reservas
            request.getRequestDispatcher("/consultarReservas.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error en la consulta de reservas.");
        }
}
