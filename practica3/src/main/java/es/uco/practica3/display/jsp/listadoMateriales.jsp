<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Materiales</title>
    <link rel="stylesheet" href="styles.css"> <!-- Agrega tu archivo de estilos aquí -->
</head>
<body>
    <h1>Gestión de Materiales</h1>

    <c:if test="${param.success != null}">
        <p style="color: green;">Operación realizada con éxito.</p>
    </c:if>
    <c:if test="${param.success == 'false'}">
        <p style="color: red;">Hubo un error en la operación.</p>
    </c:if>
    
    <h2>Lista de Materiales</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Tipo</th>
                <th>Uso</th>
                <th>Estado</th>
                <th>ID Pista</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="material" items="${materiales}">
                <tr>
                    <td>${material.tipo}</td>
                    <td>${material.uso_material}</td>
                    <td>${material.estado}</td>
                    <td>${material.id_pista}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <h2>Crear Material</h2>
    <form action="materialAdmin" method="post">
        <input type="hidden" name="action" value="create">
        <label for="tipo">Tipo:</label>
        <input type="number" name="tipo" required><br>
        <label for="uso">Uso:</label>
        <input type="number" name="uso" required><br>
        <label for="estado">Estado:</label>
        <input type="number" name="estado" required><br>
        <input type="submit" value="Crear Material">
    </form>

    <h2>Asociar Material a Pista</h2>
    <form action="materialAdmin" method="post">
        <input type="hidden" name="action" value="associate">
        <label for="pista">Nombre Pista:</label>
        <input type="text" name="pista" required><br>
        <label for="tipoMaterial">Tipo de Material:</label>
        <input type="number" name="tipoMaterial" required><br>
        <label for="usoMaterial">Uso de Material:</label>
        <input type="number" name="usoMaterial" required><br>
        <input type="submit" value="Asociar Material">
    </form>

    <h2>Borrar Material</h2>
    <form action="materialAdmin" method="post">
        <input type="hidden" name="action" value="delete">
        <label for="tipo">Tipo de Material:</label>
        <input type="number" name="tipo" required><br>
        <input type="submit" value="Borrar Material">
    </form>
</body>
</html>
