<?php ob_start(); ?>
<h2>Entregas</h2>
<?php foreach ($data['deliveries'] as $delivery): ?>
    <div class="card <?php echo $delivery['status']; ?>">
        <?php echo $delivery['delivery_id']; ?> <span>Entrega ID</span>
        <span class="status <?php echo $delivery['status']; ?>"><?php echo ucfirst($delivery['status']); ?></span>
        <button>Detalles</button>
    </div>
<?php endforeach; ?>
<?php
$content = ob_get_clean();
require_once __DIR__ . '/../layouts/main.php';
?>