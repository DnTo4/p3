package es.uco.practica3.business.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Importa el gestor
import es.uco.practica3.business.gestores.GestorPistas;

@WebServlet("/ModificarPistaServlet")
public class ModificarPistaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombrePista = request.getParameter("nombre");
        String estadoParam = request.getParameter("estado");

        try {
            // Validación de entrada
            if (nombrePista == null || estadoParam == null) {
                throw new IllegalArgumentException("Parámetros inválidos");
            }

            int estado = Integer.parseInt(estadoParam);
            if (estado != 0 && estado != 1) {
                throw new IllegalArgumentException("El estado debe ser 0 o 1");
            }

            // Llamada al gestor para modificar el estado
            GestorPistas gestorPistas = new GestorPistas();
            int exito = gestorPistas.modificarEstadoPista(nombrePista, estado);

            if (exito == 1) {
                // Redirigir a la página de confirmación
            	request.getRequestDispatcher("/MVC/View/jsp/ModificarPistaExito.jsp").forward(request, response);
            } else {
                throw new Exception("No se pudo modificar el estado de la pista.");
            }
        } catch (Exception e) {
            // Redirigir a la página de error
            request.setAttribute("mensajeError", e.getMessage());
            request.getRequestDispatcher("/MVC/View/jsp/ModificarPistaError.jsp").forward(request, response);
        }
    }
}
