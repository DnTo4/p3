package es.uco.practica3.display.servlets;

import es.uco.practica3.business.DTO.JugadorDTO;
import es.uco.practica3.data.dao.JugadorDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.Date;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private JugadorDAO jugadorDAO = new JugadorDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");
        JugadorDTO jugadorTemp = new JugadorDTO("n", "a", new Date(), LocalDate.now(), correo, password);
        JugadorDTO jugador = jugadorDAO.getJugadorByEmail(jugadorTemp);

        if (jugador != null && jugador.getPassword().equals(password)) {
            request.getSession().setAttribute("usuario", jugador);
            response.sendRedirect("jsp/dashboard.jsp"); // Redirigir a la página principal
        } else {
            response.sendRedirect("jsp/login.jsp"); // Redirigir a la página de login con error
        }
    }
}