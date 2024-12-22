<%@ page import="es.uco.practica3.business.gestores.GestorPistas" %>
<%@ page import="es.uco.practica3.business.DTO.PistaDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../../css/stylesReserva.css">
    <title>Cancelar Reserva</title>
</head>
<body>
    <h1>Cancelar Reserva</h1>
    <form action="../../../Controller/reservas/borrarReservaController.jsp" method="post">
        <label for="fecha">Fecha de la Reserva:</label>
        <input type="date" id="fecha" name="fecha" required><br>
        
        <!-- Checklist de pistas -->
        <label>Pista Reservada:</label>
        <div class="checklist">
    <%
    	GestorPistas gestor = new GestorPistas();
        List<PistaDTO> pistas = gestor.listarPistas(); 
        for (PistaDTO pista : pistas) {
    	%>
    		<div class="radio-item" style="display: flex; align-items: center;">
        		<input type="radio" name="pista" value="<%=pista.getNombre()%>" id="pista-<%=pista.getNombre()%>" style="margin-right: 8px;">
        		<label for="pista-<%=pista.getNombre()%>"><%=pista.getNombre()%></label>
    		</div>
    <% } %>
    </div>

        <input type="submit" value="Cancelar Reserva">
    </form>
</body>
</html>
