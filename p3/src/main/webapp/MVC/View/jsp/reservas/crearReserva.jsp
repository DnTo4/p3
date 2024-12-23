<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="es.uco.practica3.business.gestores.GestorPistas" %>
<%@ page import="es.uco.practica3.business.DTO.PistaDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html>
<head>
    <title>Crear Reserva</title>
    <link rel="stylesheet" type="text/css" href="../../css/stylesReserva.css">
    <script>
        function validarFormulario(event) {
            const fecha = document.getElementById("fecha").value;
            const tipo = document.getElementById("tipo").value;
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
    <h1>Crear Nueva Reserva</h1>
    <form action="../../../Controller/reservas/crearReservaController.jsp" method="post" onsubmit="validarFormulario(event)">
        <label>Fecha:</label>
        <input type="date" name="fecha" required /><br>

        <label>Duración:</label>
        <select name="duracion">
            <option value="60">60 minutos</option>
            <option value="90">90 minutos</option>
            <option value="120">120 minutos</option>
        </select><br>

		<!-- Checklist de pistas -->
        <label>Elige una pista:</label>
        <div class="checklist">
    <%
    	GestorPistas gestor = new GestorPistas();
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
    
        
        <label>Tipo:</label>
        <select name="tipo">
            <option value="0">Adultos</option>
            <option value="1">Infantil</option>
            <option value="2">Familiar</option>
        </select><br>

        <label>Número de niños:</label>
        <input type="number" name="num_ninios"  /><br>
        
        <label>Número de adultos:</label>
        <input type="number" name="num_adultos"  /><br>
        
        <label>Identificador de abono (Si procede):</label>
        <input type="number" name="id_bono"  /><br>

        <label>Correo electrónico:</label>
        <input type="text" name="correo" required /><br>

        <input type="submit" value="Crear Reserva" />
    </form>
</body>
</html>

