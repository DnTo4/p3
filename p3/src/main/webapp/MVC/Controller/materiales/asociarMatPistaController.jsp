<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@page import="es.uco.practica3.business.gestores.GestorPistas" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Resultados de Asociación</title>
</head>
<body>
    <%
    	String nextPage = "/p3/MVC/View/jsp/materiales/asociarMatPistaExito.jsp";
    	String mensaje = "";
        // Recoger los materiales seleccionados
        String[] materialesSeleccionados = request.getParameterValues("materiales");
        String pistaSeleccionada = request.getParameter("pista");

        GestorPistas gestor = new GestorPistas();
        
        // Mostrar los materiales seleccionados
        if (materialesSeleccionados != null && pistaSeleccionada != null) {
        	int tipo = 0; int uso = 0;
            for (String material : materialesSeleccionados) {
            	switch (material.toLowerCase()) {
                	case "canastas interior": tipo = 1; uso = 1; break;
                	case "canastas exterior": tipo = 1; uso = 2; break;
                	case "conos interior": tipo = 2; uso = 1; break;
                	case "conos exterior": tipo = 2; uso = 2; break;
                	case "pelotas interior": tipo = 3; uso = 1; break;
                	case "pelotas exterior": tipo = 3; uso = 2; break;
            	}
            	if (gestor.asociar(pistaSeleccionada, tipo, uso) == -1)
            	{
            		nextPage = "../../View/jsp/materiales/asociarMaterialPista.jsp?message=Algún material no puede ser usado en esa pista.";
            	}
            	
            }

        } else {
            nextPage = "../../View/jsp/materiales/asociarMaterialPista.jsp?message=No se seleccionaron materiales o pista.";
        }
        response.sendRedirect(nextPage);
        %>
</body>

</html>