<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Aplicación de Gestión de Reservas</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <h1>Gestión de Reservas</h1>
    <div>
        <form action="login" method="post">
            <h2>Acceder</h2>
            <input type="email" name="correo" placeholder="Correo electrónico" required>
            <input type="password" name="password" placeholder="Contraseña" required>
            <input type="submit" value="Acceder">
        </form>
        <form action="register" method="post">
            <h2>Registro</h2>
            <input type="text" name="nombre" placeholder="Nombre" required>
            <input type="text" name="apellidos" placeholder="Apellidos" required>
            <input type="date" name="fecha_nacimiento" placeholder="Fecha de nacimiento" required>
            <input type="text" name="correo" placeholder="Correo electrónico" required>
            <input type="password" name="password" placeholder="Contraseña" required>
            <select name="tipo_usuario">
                <option value="cliente">Cliente</option>
                <option value="administrador">Administrador</option>
            </select>
            <input type="submit" value="Registrar">
        </form>
    </div>
    <script src="js/script.js"></script>
</body>
</html>