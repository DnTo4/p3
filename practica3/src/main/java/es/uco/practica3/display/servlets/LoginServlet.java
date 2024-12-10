package es.uco.practica3.display.servlets;

import es.uco.practica3.data.dao.JugadorDAO;
import es.uco.practica3.business.JugadorDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private JugadorDAO jugadorDAO = new JugadorDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");

        JugadorDTO jugador = jugadorDAO.getJugadorByEmail(correo);

        if (jugador != null && jugador.getPassword().equals(password)) {
            request.getSession().setAttribute("usuario", jugador);
            response.sendRedirect("jsp/dashboard.jsp"); // Redirigir a la página principal
        } else {
            response.sendRedirect("jsp/login.jsp"); // Redirigir a la página de login con error
        }
    }
}