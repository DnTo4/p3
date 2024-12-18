package es.uco.practica3.business.servlets;

import es.uco.practica3.business.DTO.MaterialDTO;
import es.uco.practica3.business.DTO.PistaDTO;
import es.uco.practica3.business.gestores.GestorPistas;
import es.uco.practica3.business.GestorMateriales;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/MaterialAdminServlet")
public class MaterialAdminServlet extends HttpServlet {
    private GestorPistas gestorPistas = new GestorPistas();
    private GestorMateriales gestorMateriales = new GestorMateriales(); // Se presupone que existe

    // Método para manejar las peticiones GET
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "list":
                listarMaterial(request, response);
                break;
            case "associate":
                asociarMaterial(request, response);
                break;
            default:
                // Aquí podrías mostrar una vista por defecto, como un panel de administración
                response.sendRedirect("adminHome.jsp");
        }
    }

    // Método para manejar las peticiones POST
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("create".equals(action)) {
            crearMaterial(request, response);
        } else if ("delete".equals(action)) {
            borrarMaterial(request, response);
        } else {
            response.sendRedirect("adminHome.jsp");
        }
    }

    // Método que permite crear un nuevo material
    private void crearMaterial(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int tipo = Integer.parseInt(request.getParameter("tipo"));
        int uso = Integer.parseInt(request.getParameter("uso"));
        int estado = Integer.parseInt(request.getParameter("estado"));

        int result = gestorPistas.crearMat(tipo, uso, estado);

        if (result > 0) {
            response.sendRedirect("materialAdmin?action=list&success=true");
        } else {
            response.sendRedirect("materialAdmin?action=list&success=false");
        }
    }

    // Método que permite listar todos los materiales
    private void listarMaterial(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<MaterialDTO> materiales = gestorPistas.ListarMat();
        request.setAttribute("materiales", materiales);
        request.getRequestDispatcher("/listadoMateriales.jsp").forward(request, response);
    }

    // Método que permite asociar material a una pista
    private void asociarMaterial(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String nombrePista = request.getParameter("pista");
        int tipoMaterial = Integer.parseInt(request.getParameter("tipoMaterial"));
        int usoMaterial = Integer.parseInt(request.getParameter("usoMaterial"));

        int result = gestorPistas.asociar(nombrePista, tipoMaterial, usoMaterial);

        if (result > 0) {
            response.sendRedirect("materialAdmin?action=list&associateSuccess=true");
        } else {
            response.sendRedirect("materialAdmin?action=list&associateSuccess=false");
        }
    }

    // Método que permite borrar un material 
    private void borrarMaterial(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int tipoMaterial = Integer.parseInt(request.getParameter("tipo"));

        int result = gestorPistas.borrarMat(tipoMaterial);

        if (result > 0) {
            response.sendRedirect("materialAdmin?action=list&deleteSuccess=true");
        } else {
            response.sendRedirect("materialAdmin?action=list&deleteSuccess=false");
        }
    }
}
