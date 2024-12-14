package es.uco.practica3.controller;

import es.uco.practica3.business.GestorPistas;
import es.uco.practica3.business.PistaDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/PistaAdminServlet")
public class PistaAdminServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    private GestorPistas gestorPistas;

    public PistaAdminServlet() {
        this.gestorPistas = new GestorPistas();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("listar".equals(action)) {
            listarPistas(request, response);
        } else if ("borrar".equals(action)) {
            borrarPista(request, response);
        } else {
            // Manejar acción por defecto o errores
            response.sendRedirect("error.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("crear".equals(action)) {
            crearPista(request, response);
        } else {
            // Manejar otras acciones si es necesario
            response.sendRedirect("error.jsp");
        }
    }

    private void crearPista(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        int estado = Integer.parseInt(request.getParameter("estado"));
        int tipo = Integer.parseInt(request.getParameter("tipo"));
        int tamanio = Integer.parseInt(request.getParameter("tamanio"));
        int jugadores_max = Integer.parseInt(request.getParameter("jugadores_max"));

        int result = gestorPistas.crearPista(nombre, estado, tipo, tamanio, jugadores_max);
        
        if (result > 0) {
            request.setAttribute("mensaje", "Pista creada con éxito!");
        } else {
            request.setAttribute("mensaje", "Error al crear la pista. Puede que ya exista.");
        }

        request.getRequestDispatcher("resultado.jsp").forward(request, response);
    }

    private void listarPistas(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<PistaDTO> listaPistas = gestorPistas.ListarPistas();
        request.setAttribute("listaPistas", listaPistas);

        request.getRequestDispatcher("listarPistas.jsp").forward(request, response);
    }

    private void borrarPista(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre = request.getParameter("nombre");

        int result = gestorPistas.borrarPista(nombre);
        
        if (result > 0) {
            request.setAttribute("mensaje", "Pista borrada con éxito!");
        } else {
            request.setAttribute("mensaje", "Error al borrar la pista. Puede que no exista.");
        }

        request.getRequestDispatcher("resultado.jsp").forward(request, response);
    }
}
