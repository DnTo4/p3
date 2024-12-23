<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="es.uco.practica3.business.DTO.MaterialDTO, es.uco.practica3.business.gestores.GestorPistas" %>
<%@ page import="es.uco.practica3.business.DTO.PistaDTO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seleccionar Materiales y Pistas</title>
<link rel="stylesheet" type="text/css" href="../../css/styleAsociarMatPista.css">
</head>
<body>
    <form action="../../../Controller/materiales/asociarMatPistaController.jsp" method="post">
        <h1>Seleccionar Materiales y Pistas</h1>
        
        <!-- Checklist de materiales -->
        <label>Elige materiales:</label>
        <div class="checklist">
            <%
                GestorPistas gestor = new GestorPistas();
                List<MaterialDTO> materiales = gestor.listarMat();
                for (MaterialDTO material : materiales) {
                    String tipo = "";
                    if (material.getEstado() == 1)
                    {
                    	switch (material.getTipo()) {
                        	case 1: tipo = "Canastas"; break;
                        	case 2: tipo = "Conos"; break;
                        	case 3: tipo = "Pelotas"; break;
                    	}
                    	switch (material.getUso_material())
                    	{
                    		case 1: tipo = tipo + " interior"; break;
                    		case 2: tipo = tipo + " exterior"; break;
                    	}
            %>
            <div class="checkbox-item">
                <input type="checkbox" name="materiales" value="<%=tipo%>" id="material-<%=tipo%>">
                <label for="material-<%=tipo%>"><%=tipo%></label>
            </div>
            	<%} %>
            <% } %>
        </div>
        
        <!-- Checklist de pistas -->
        <label>Elige una pista:</label>
        <div class="checklist">
    <%
        List<PistaDTO> pistas = gestor.listarPistas(); 
        for (PistaDTO pista : pistas) {
        	if (pista.getEstado() == 1)
    		{
    	%>
    		
    			<div class="radio-item" style="display: flex; align-items: center;">
        			<input type="radio" name="pista" value="<%=pista.getNombre()%>" id="pista-<%=pista.getNombre()%>" style="margin-right: 8px;">
        			<label for="pista-<%=pista.getNombre()%>"><%=pista.getNombre()%></label>
    			</div>
    <% 		}
        }%>
</div>

        <button type="submit">Enviar selección</button>
    </form>

    <!-- Mostrar el mensaje de la URL -->
    <div class="message">
        <% if (request.getParameter("message") != null) { %>
            <p><%= request.getParameter("message") %></p>
        <% } %>
    </div>
</body>
</html>

