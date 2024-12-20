<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../../css/styles.css">
    <title>Borrar Pista</title>
</head>
<body>
    <h1>Borrar Pista</h1>
    <form action="../../../Controller/pistas/BorrarPistaController.jsp" method="post">
        <label for="nombre">Nombre de la Pista:</label>
        <input type="text" id="nombre" name="nombre" required><br>

        <input type="submit" value="Borrar Pista">
    </form>
</body>
</html>
