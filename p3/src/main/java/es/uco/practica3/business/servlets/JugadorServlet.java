package es.uco.practica3.business.servlets;

import es.uco.practica3.business.DTO.JugadorDTO;
import es.uco.practica3.business.gestores.GestorJugadores;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/JugadorServlet")
public class JugadorServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private GestorJugadores gestorJugadores;

    public JugadorServlet() {
        super();
        this.gestorJugadores = new GestorJugadores();
    }

    /**
     * Método para manejar solicitudes GET para obtener datos de un jugador específico.
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String correo = request.getParameter("correo_electronico");
        
        if (correo != null && !correo.isEmpty()) {
            JugadorDTO jugador = gestorJugadores.getAllJugadores().stream()
                .filter(j -> j.getCorreo_electronico().equalsIgnoreCase(correo))
                .findFirst()
                .orElse(null);

            if (jugador != null) {
                // Establecemos el objeto jugador como atributo del request
                request.setAttribute("jugador", jugador);
                // Redirigimos a la JSP correspondiente para mostrar los datos del jugador
                request.getRequestDispatcher("/verJugador.jsp").forward(request, response);
            } else {
                request.setAttribute("mensaje", "Jugador no encontrado.");
                request.getRequestDispatcher("/error.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("mensaje", "Por favor, proporciona un correo electrónico.");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
}
