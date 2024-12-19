package es.uco.practica3.business.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.uco.practica3.business.gestores.GestorPistas;

@WebServlet("/CrearPistaServlet")
public class CrearPistaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        int estado = Integer.parseInt(request.getParameter("estado"));
        int tipo = Integer.parseInt(request.getParameter("tipo"));
        int tamanio = Integer.parseInt(request.getParameter("tamanio"));
        int jugadoresMax = Integer.parseInt(request.getParameter("jugadores_max"));

        GestorPistas gestor = new GestorPistas();
        int resultado = gestor.crearPista(nombre, estado, tipo, tamanio, jugadoresMax);

        if (resultado > 0) {
            request.setAttribute("mensaje", "La pista '" + nombre + "' ha sido creada exitosamente.");
            request.getRequestDispatcher("pistaExito.jsp").forward(request, response);
        } else {
            String mensajeError = (resultado == 0) ? "La pista ya existe." : "Error al crear la pista.";
            request.setAttribute("mensaje", mensajeError);
            request.getRequestDispatcher("pistaError.jsp").forward(request, response);
        }
    }
}




