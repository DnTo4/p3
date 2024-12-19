<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Crear Nueva Pista</title>
    <link rel="stylesheet" type="text/css" href="../../View/css/styles.css">
</head>
<body>
    <div class="container">
        <h1>Crear Nueva Pista</h1>
	<form action="/p3/CrearPistaServlet" method="post">
	    <label for="nombre">Nombre:</label>
	    <input type="text" id="nombre" name="nombre" required /><br>
	
	    <label for="estado">Estado:</label>
	    <select id="estado" name="estado">
	        <option value="1">Disponible</option>
	        <option value="0">No Disponible</option>
	    </select><br>
	
	    <label for="tipo">Tipo:</label>
	    <select id="tipo" name="tipo">
	        <option value="1">Interior</option>
	        <option value="2">Exterior</option>
	    </select><br>
	
	    <label for="tamanio">Tamaño:</label>
	    <select id="tamanio" name="tamanio">
	        <option value="1">3VS3</option>
	        <option value="2">Minibasket</option>
	        <option value="3">Adultos</option>
	    </select><br>
	
	    <label for="jugadores_max">Jugadores Máximos:</label>
	    <input type="number" id="jugadores_max" name="jugadores_max" required /><br>
	
	    <input type="submit" value="Crear Pista" class="btn" />
	</form>
    </div>
</body>
</html>
