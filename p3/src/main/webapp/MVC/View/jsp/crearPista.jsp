<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Crear Pista</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/styles.css">
</head>
<body>
    <h1>Crear Nueva Pista</h1>
    <form action="<%= request.getContextPath() %>/crearpista" method="post">
        <div class="form-group">
            <label for="nombre">Nombre de Pista:</label>
            <input type="text" id="nombre" name="nombre" required>
        </div>

        <div class="form-group">
            <label for="estado">Estado:</label>
            <select id="estado" name="estado" required>
                <option value="1">Disponible</option>
                <option value="0">No Disponible</option>
            </select>
        </div>

        <div class="form-group">
            <label for="tipo">Tipo:</label>
            <select id="tipo" name="tipo" required>
                <option value="1">Interior</option>
                <option value="2">Exterior</option>
            </select>
        </div>

        <div class="form-group">
            <label for="tamanio">Tamaño:</label>
            <select id="tamanio" name="tamanio" required>
                <option value="1">3VS3</option>
                <option value="2">Minibasket</option>
                <option value="3">Adultos</option>
            </select>
        </div>

        <div class="form-group">
            <label for="jugadores_max">Jugadores Máximos:</label>
            <input type="number" id="jugadores_max" name="jugadores_max" required min="1">
        </div>

        <div class="form-group">
            <input type="submit" value="Crear Pista">
        </div>
    </form>
</body>
</html>
