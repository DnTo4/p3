package es.uco.practica3.bussines.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.uco.practica3.business.gestores.GestorPistas;

@WebServlet(name="crearpista", urlPatterns="/crearpista")
public class CrearPista extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CrearPista() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// TODO Auto-generated method stub
	response.getWriter().append("El servlet para crear pistas está en ejecución.");
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // Recuperar parámetros del formulario
	    String nombre = request.getParameter("nombre");
	    int estado = Integer.parseInt(request.getParameter("estado"));
	    int tipo = Integer.parseInt(request.getParameter("tipo"));
	    int tamanio = Integer.parseInt(request.getParameter("tamanio"));
	    int jugadores_max = Integer.parseInt(request.getParameter("jugadores_max"));
	    
	    GestorPistas gestorPistas = new GestorPistas();
	    
	    int resultado = gestorPistas.crearPista(nombre, estado, tipo, tamanio, jugadores_max);
	    
	    if (resultado > 0) {
	        request.setAttribute("nombrePista", nombre);
	        request.getRequestDispatcher("/MVC/View/jsp/pistaExito.jsp").forward(request, response);
	    } else {
	        String mensajeError = (resultado == 0) ? "La pista ya existe." : "Error al crear la pista.";
	        request.setAttribute("mensajeError", mensajeError);
	        request.getRequestDispatcher("/MVC/View/jsp/pistaError.jsp").forward(request, response);
	    }
	}
}