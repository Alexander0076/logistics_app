<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="/logistics_app/public/css/styles.css">
</head>
<body>
    <div class="sidebar">
        <h3>Menu</h3>
        <ul>
            <li><a href="/logistics_app/public/DashboardController">Entregas</a></li>
            <li><a href="/logistics_app/public/DashboardController/reportes">Reportes y Análisis</a></li>
            <li><a href="/logistics_app/public/DashboardController/control">Control de acceso</a></li>
            <li><a href="/logistics_app/public/DashboardController/conductores">Conductores</a></li>
            <li><a href="/logistics_app/public/DashboardController/rutas">Rutas</a></li>
            <li><a href="/logistics_app/public/DashboardController/combustible">Análisis de combustible</a></li>
            <li><a href="/logistics_app/public/DashboardController/paquetes">Paquetes</a></li>
            <li><a href="/logistics_app/public/DashboardController/unidades">Unidades móviles</a></li>
            <li><a href="/logistics_app/public/AuthController/logout">Logout</a></li>
        </ul>
    </div>
    <div class="main-content">
        <?php echo $content; ?>
    </div>
</body>
</html>