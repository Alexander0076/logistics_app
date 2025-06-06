<!DOCTYPE html>
  <html lang="es">
  <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Login</title>
      <link rel="stylesheet" href="<?php echo BASE_URL; ?>css/styles.css">
  </head>
  <body>
      <div class="form-container">
          <h2>Login</h2>
          <p>Sign in to continue</p>
          <?php if (isset($data['error'])): ?>
              <p style="color: red;"><?php echo $data['error']; ?></p>
          <?php endif; ?>
          <form method="POST" action="<?php echo BASE_URL; ?>AuthController/login">
              <label for="username">Username</label>
              <input type="text" id="username" name="username" required>
              <label for="password">Password</label>
              <input type="password" id="password" name="password" required>
              <button type="submit">Sign up</button>
          </form>
          <a href="<?php echo BASE_URL; ?>AuthController/register">Register</a>
      </div>
  </body>
  </html>