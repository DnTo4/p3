package es.uco.practica3.web.servlet;

import es.uco.practica3.business.gestores.GestorPistas;
import es.uco.practica3.business.DTO.PistaDTO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Date;

public class PistaBuscarServlet extends HttpServlet {

    private GestorPistas gestorPistas = new GestorPistas();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Recuperamos los parámetros de la solicitud
            int tipo = Integer.parseInt(request.getParameter("tipo"));
            String fechaStr = request.getParameter("fecha");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date fecha = sdf.parse(fechaStr);

            // Llamamos al método del gestor para buscar las pistas
            List<PistaDTO> pistasDisponibles = gestorPistas.buscarPistasDisponibles(tipo, fecha);

            // Pasamos los resultados a la vista (por ejemplo, un JSP)
            request.setAttribute("pistasDisponibles", pistasDisponibles);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/pistasDisponibles.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Error en la búsqueda de pistas.");
        }
    }
}
