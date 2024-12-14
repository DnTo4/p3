package es.uco.practica3.web;

import es.uco.practica3.business.GestorJugadores;
import es.uco.practica3.business.JugadorDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/JugadorAdminServlet")
public class JugadorAdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private GestorJugadores gestorJugadores;

    public JugadorAdminServlet() {
        super();
        gestorJugadores = new GestorJugadores();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("getAllJugadores".equals(action)) {
            List<JugadorDTO> jugadores = gestorJugadores.getAllJugadores();
            request.setAttribute("jugadores", jugadores);
            request.getRequestDispatcher("listaJugadores.jsp").forward(request, response);
        } else if ("deleteJugador".equals(action)) {
            String correo = request.getParameter("correo");
            int result = gestorJugadores.deleteJugador(correo);
            if(result > 0) {
                request.setAttribute("message", "Jugador eliminado correctamente.");
            } else {
                request.setAttribute("error", "Error al eliminar el jugador.");
            }
            response.sendRedirect("JugadorAdminServlet?action=getAllJugadores");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("addJugador".equals(action)) {
            String nombre = request.getParameter("nombre");
            String apellidos = request.getParameter("apellidos");
            String fechaNac = request.getParameter("fecha_nacimiento");
            String fechaIns = request.getParameter("fecha_inscripcion");
            String correo = request.getParameter("correo_electronico");

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            try {
                Date fechaNacimiento = sdf.parse(fechaNac);
                LocalDate fechaInscripcion = LocalDate.parse(fechaIns);

                int result = gestorJugadores.addJugador(nombre, apellidos, fechaNacimiento, fechaInscripcion, correo);

                if(result > 0) {
                    request.setAttribute("message", "Jugador añadido correctamente.");
                } else {
                    request.setAttribute("error", "El jugador ya existe.");
                }

            } catch (ParseException e) {
                e.printStackTrace();
                request.setAttribute("error", "Formato de fecha incorrecto.");
            }
            response.sendRedirect("JugadorAdminServlet?action=getAllJugadores");
        } else if ("updateJugador".equals(action)) {
            String nombre = request.getParameter("nombre");
            String apellidos = request.getParameter("apellidos");
            String correo = request.getParameter("correo_electronico");
            String fechaN = request.getParameter("fecha_nacimiento");

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            try {
                Date fechaNacimiento = sdf.parse(fechaN);
                int result = gestorJugadores.updateJugador(nombre, apellidos, fechaNacimiento, correo);

                if(result > 0) {
                    request.setAttribute("message", "Jugador actualizado correctamente.");
                } else {
                    request.setAttribute("error", "Error al actualizar el jugador.");
                }

            } catch (ParseException e) {
                e.printStackTrace();
                request.setAttribute("error", "Formato de fecha incorrecto.");
            }
            response.sendRedirect("JugadorAdminServlet?action=getAllJugadores");
        }
    }
}
