<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Pista Creada</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
    <h1>¡Pista creada con éxito!</h1>
    <p>La pista "<%= request.getAttribute("nombrePista") %>" ha sido creada correctamente.</p>
    <a href="crearPista.jsp">Volver al formulario</a>
</body>
</html>