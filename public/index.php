<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

session_start();
require_once '../core/config.php';
require_once '../core/App.php';
require_once '../core/Controller.php';
require_once '../core/Database.php';
require_once '../core/Model.php';

// Debug: Print the raw URL
echo "Raw URL: " . (isset($_GET['url']) ? $_GET['url'] : 'Not set') . "<br>";

$app = new App();
?>