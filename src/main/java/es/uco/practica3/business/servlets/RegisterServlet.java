package es.uco.practica3.business.servlets;

import es.uco.practica3.data.dao.JugadorDAO;
import es.uco.practica3.business.JugadorDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.time.LocalDate;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private JugadorDAO jugadorDAO = new JugadorDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellidos");
        Date fechaNacimiento = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("fecha_nacimiento"));
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");
        String tipo_usuario = request.getParameter("tipo_usuario");

        JugadorDTO nuevoJugador = new JugadorDTO(nombre, apellidos, fechaNacimiento, LocalDate.now(), correo, password);

        int status = jugadorDAO.addJugador(nuevoJugador);

        if (status > 0) {
            response.sendRedirect("jsp/dashboard.jsp"); // Redirigir a la página de bienvenida
        } else {
            response.sendRedirect("jsp/register.jsp"); // Redirigir a la página de registro con error
        }
    }
}

//Meter dentro de jsp