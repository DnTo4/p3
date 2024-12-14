<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Crear Pista</title>
</head>
<body>
    <h1>Crear Pista</h1>
    <form action="PistaAdmin" method="post">
        <input type="hidden" name="action" value="crear">
        
        Nombre: <input type="text" name="nombre" required><br>
        Estado: <input type="number" name="estado" required><br>
        Tipo: <input type="number" name="tipo" required><br>
        Tamaño: <input type="number" name="tamanio" required><br>
        Jugadores Máx: <input type="number" name="jugadores_max" required><br>
        
        <input type="submit" value="Crear Pista">
    </form>
</body>
</html>
