<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" href="<?php echo BASE_URL; ?>css/styles.css">
</head>
<body>
    <div class="form-container">
        <h2>Create new Account</h2>
        <p>Already Registered? <a href="<?php echo BASE_URL; ?>AuthController">Login</a></p>
        <?php if (isset($data['error'])): ?>
            <p style="color: red;"><?php echo $data['error']; ?></p>
        <?php endif; ?>
        <form method="POST" action="<?php echo BASE_URL; ?>AuthController/register">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" required>
            <label for="full_name">Name</label>
            <input type="text" id="full_name" name="full_name" required>
            <label for="email">Email</label>
            <input type="email" id="email" name="email" required>
            <label for="delivery_address">Delivery Address</label>
            <input type="text" id="delivery_address" name="delivery_address">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" required>
            <button type="submit">Sign up</button>
        </form>
    </div>
</body>
</html>