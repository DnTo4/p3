<%@ page import="java.util.List" %>
<%@ page import="es.uco.practica3.business.DTO.PistaDTO" %>
<html>
<head>
    <title>Pistas Disponibles</title>
</head>
<body>
    <h1>Pistas Disponibles</h1>
    
    <table border="1">
        <thead>
            <tr>
                <th>Nombre</th>
                <th>Estado</th>
                <th>Tipo</th>
                <th>Tamaño</th>
                <th>Jugadores Max</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<PistaDTO> pistasDisponibles = (List<PistaDTO>) request.getAttribute("pistasDisponibles");
                if (pistasDisponibles != null && !pistasDisponibles.isEmpty()) {
                    for (PistaDTO pista : pistasDisponibles) {
            %>
                <tr>
                    <td><%= pista.getNombre() %></td>
                    <td><%= pista.getEstado() %></td>
                    <td><%= pista.getTipo() == 1 ? "Interior" : "Exterior" %></td>
                    <td><%= pista.getTamanio() %></td>
                    <td><%= pista.getJugadores_max() %></td>
                </tr>
            <% 
                    }
                } else {
            %>
                <tr>
                    <td colspan="5">No se encontraron pistas disponibles para los criterios de búsqueda.</td>
                </tr>
            <% 
                }
            %>
        </tbody>
    </table>
</body>
</html>
