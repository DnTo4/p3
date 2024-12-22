<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="es.uco.practica3.business.gestores.GestorPistas" %>
<%@ page import="es.uco.practica3.business.DTO.PistaDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
    <title>Modificar Estado de Reserva</title>
    <link rel="stylesheet" type="text/css" href="../../../View/css/stylesReserva.css">
    <script>
        function validarFormulario(event) {
            const fecha = document.getElementById("fecha").value;
            const num_ninios = document.getElementById("num_ninios").value;
            if (num_ninios <= 0 && tipo==1) {
                alert("El número de niños debe ser mayor que 0.");
                event.preventDefault();
            }
            const num_adultos = document.getElementById("num_adultos").value;
            if (num_adultos <= 0 && tipo=0) {
                alert("La duración debe ser mayor que 0.");
                event.preventDefault();
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Modificar Estado de la Reserva</h1>
        <form action="../../../Controller/reservas/modificarReservaController.jsp" method="post">
        <label>Fecha:</label>
        <input type="date" name="fecha" required /><br>

        <label>Duración:</label>
        <select name="duracion">
            <option value="60">60 minutos</option>
            <option value="90">90 minutos</option>
            <option value="120">120 minutos</option>
        </select><br>

		<!-- Checklist de pistas -->
        <label>Elige una Pista:</label>
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
        <label>Número de niños:</label>
        <input type="number" name="num_ninios"  /><br>
        
        <label>Número de adultos:</label>
        <input type="number" name="num_adultos"  /><br>

            <input type="submit" value="Modificar" class="btn" />
        </form>
    </div>
</body>
</html>