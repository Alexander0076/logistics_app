function showLogin() {
    document.querySelectorAll('.section').forEach(section => section.classList.remove('active'));
    document.getElementById('login-section').classList.add('active');
}

function showRegister() {
    document.querySelectorAll('.section').forEach(section => section.classList.remove('active'));
    document.getElementById('register-section').classList.add('active');
}

function showDashboard() {
    document.querySelectorAll('.section').forEach(section => section.classList.remove('active'));
    document.getElementById('dashboard-section').classList.add('active');
}

function showSection(sectionId) {
    document.querySelectorAll('.dashboard-section').forEach(section => section.classList.remove('active'));
    document.getElementById(sectionId).classList.add('active');
}

function addEntry() {
    alert('Hora de entrada añadida');
}

function addExit() {
    alert('Hora de salida añadida');
}