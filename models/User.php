<?php
class User extends Model {
    public function findByUsername($username) {
        $stmt = $this->db->prepare("SELECT * FROM users WHERE username = :username");
        $stmt->execute(['username' => $username]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function create($data) {
        $stmt = $this->db->prepare("INSERT INTO users (username, password, full_name, email, delivery_address, role, status) VALUES (:username, :password, :full_name, :email, :delivery_address, :role, :status)");
        return $stmt->execute([
            'username' => $data['username'],
            'password' => password_hash($data['password'], PASSWORD_DEFAULT),
            'full_name' => $data['full_name'],
            'email' => $data['email'],
            'delivery_address' => $data['delivery_address'],
            'role' => $data['role'],
            'status' => 1
        ]);
    }
}