<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Gestión de Bono</title>
    <link rel="stylesheet" type="text/css" href="../../css/styles.css">
</head>
<body>
    <h1>Gestión de Bono</h1>
    <form action="/p3/MVC/Controller/bonos/crearBonoController.jsp" method="post">
        <label for="tamanio">Tamaño de pista:</label>
        <select name="tamanio" id="tamanio" required>
            <option value="1">3VS3</option>
            <option value="2">Minibasket</option>
            <option value="3">Adultos</option>
        </select>
        <br><br>
        <button type="submit" class="btn">Crear Bono</button>
    </form>
    <br>
    <form action="/p3/MVC/View/jsp/reservas/AsociarReservas.jsp" method="get">
        <button type="submit" class="btn">¿Ya tienes un bono? Asocia reservas</button>
    </form>
    <div class="buttons">
        <a href="/p3/MVC/View/jsp/menuAdmin.jsp" class="btn">Volver al menú principal</a>
    </div>
</body>
</html>
