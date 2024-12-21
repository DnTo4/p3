<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../../css/styles.css">
    <title>Cancelar Reserva</title>
</head>
<body>
    <h1>Cancelar Reserva</h1>
    <form action="../../../Controller/reservas/borrarReservaController.jsp" method="post">
        <label for="fecha">Fecha de la Reserva:</label>
        <input type="date" id="fecha" name="fecha" required><br>
        
        <label for="id_pista">Identificador de la pista asociada:</label>
        <input type="number" id="id_pista" name="id_pista" required><br>

        <input type="submit" value="Cancelar Reserva">
    </form>
</body>
</html>
