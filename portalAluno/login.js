function handleLogin(event) {
    event.preventDefault();
    
    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;

    // Here you would typically make an API call to validate credentials
    // For demonstration, we'll use the data from data.js
    const validUser = dados.alunos.find(aluno => 
        aluno.email === email && aluno.senha === password
    );

    if (validUser) {
        // Store user session
        sessionStorage.setItem('currentUser', JSON.stringify(validUser));
        // Redirect to main page
        window.location.href = 'index.html';
    } else {
        alert('Email ou senha inválidos');
    }
}

function forgotPassword() {
    const email = prompt('Digite seu email para recuperar a senha:');
    if (email) {
        // Here you would typically make an API call to send reset password email
        alert('Se este email estiver cadastrado, você receberá instruções para redefinir sua senha.');
    }
}

// Prevent accessing login page if already logged in
window.onload = function() {
    if (sessionStorage.getItem('currentUser')) {
        window.location.href = 'index.html';
    }
}