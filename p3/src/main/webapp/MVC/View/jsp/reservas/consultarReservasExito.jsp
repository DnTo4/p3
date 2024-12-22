<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="es.uco.practica3.business.DTO.ReservasDTO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reservas Encontradas</title>
    <link rel="stylesheet" type="text/css" href="../../View/css/tablas.css">
</head>
<body>
    <h1>Reservas Encontradas</h1>
    <p><%= request.getAttribute("mensaje") %></p>
    <table>
        <thead>
            <tr>
                <th>Fecha</th>
                <th>Duración (mins)</th>
                <th>ID Pista</th>
                <th>Precio</th>
                <th>Descuento</th>
                <th>Tipo de reserva</th>
                <th>ID Bono</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<ReservasDTO> reservas = (List<ReservasDTO>) request.getAttribute("reservas");
                for (ReservasDTO reserva : reservas) {
                    // Traducción del tipo de reserva
                    String tipoReservaTraducido = "";
                    switch (reserva.getTipo_reserva()) {
                        case 0:
                            tipoReservaTraducido = "Adultos";
                            break;
                        case 1:
                            tipoReservaTraducido = "Infantil";
                            break;
                        case 2:
                            tipoReservaTraducido = "Familiar";
                            break;
                        default:
                            tipoReservaTraducido = "Desconocido";
                    }
            %>
                <tr>
                    <td><%= reserva.getFecha() %></td>
                    <td><%= reserva.getDuracion() %></td>
                    <td><%= reserva.getId_pista() %></td>
                    <td><%= reserva.getPrecio() %></td>
                    <td><%= reserva.getDescuento() %> %</td>
                    <td><%= tipoReservaTraducido %></td>
                    <td><%= reserva.getId_bono() %></td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>
    <div class="buttons">
        <a href="/p3/MVC/View/jsp/menuAdmin.jsp" class="btn">Volver al menú principal</a>
    </div>
</body>
</html>


