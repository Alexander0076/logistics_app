<?php
class AuthController extends Controller {
    private $userModel;

    public function __construct() {
        $this->userModel = $this->loadModel('User');
    }

    public function index() {
        $this->view('auth/login');
    }

    public function login() {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $username = $_POST['username'];
            $password = $_POST['password'];
            $user = $this->userModel->findByUsername($username);

            if ($user && password_verify($password, $user['password'])) {
                $_SESSION['user_id'] = $user['user_id'];
                $_SESSION['role'] = $user['role'];
                header('Location: ' . BASE_URL . 'DashboardController');
            } else {
                $data['error'] = 'Invalid credentials';
                $this->view('auth/login', $data);
            }
        }
    }

    public function register() {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $data = [
                'username' => $_POST['username'],
                'password' => $_POST['password'],
                'full_name' => $_POST['full_name'],
                'email' => $_POST['email'],
                'delivery_address' => $_POST['delivery_address'],
                'role' => 'Usuario'
            ];
            if ($this->userModel->create($data)) {
                header('Location: ' . BASE_URL . 'AuthController');
            } else {
                $data['error'] = 'Registration failed';
                $this->view('auth/register', $data);
            }
        } else {
            $this->view('auth/register');
        }
    }

    public function logout() {
        session_destroy();
        header('Location: ' . BASE_URL . 'AuthController');
    }
}