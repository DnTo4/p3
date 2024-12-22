<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Modificar Estado de Pista</title>
    <link rel="stylesheet" type="text/css" href="/p3/MVC/View/css/styles.css">
</head>
<body>
    <div class="container">
        <h1>Modificar Estado de la Pista</h1>
        <form action="../../../Controller/pistas/ModificarPistaController.jsp" method="post">
            <label for="nombre">Nombre de la pista:</label>
            <input type="text" id="nombre" name="nombre" required /><br>

            <label for="estado">Estado:</label>
            <select id="estado" name="estado">
                <option value="1">Disponible</option>
                <option value="0">No Disponible</option>
            </select><br>

            <input type="submit" value="Modificar" class="btn" />
        </form>
    </div>
</body>
</html>