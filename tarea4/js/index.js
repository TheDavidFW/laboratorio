document.addEventListener('DOMContentLoaded', function () {
  const togglePassword = document.getElementById('togglePassword');
  const passwordInput = document.getElementById('password');
  const loginForm = document.getElementById('login-form');
  const loader = document.getElementById('loader');
  const message = document.getElementById('message');
  const usernameInput = document.getElementById('username');
  const eyeIcon = document.getElementById('eyeIcon');

  // Mostrar/Ocultar contraseña

  togglePassword.addEventListener('click', function () {
    if (passwordInput.type === 'password') {
      passwordInput.type = 'text';
      eyeIcon.classList.remove('fa-eye');
      eyeIcon.classList.add('fa-eye-slash');
    } else {
      passwordInput.type = 'password';
      eyeIcon.classList.remove('fa-eye-slash');
      eyeIcon.classList.add('fa-eye');
    }
  });

  // Al enviar el formulario
  loginForm.addEventListener('submit', function (event) {
    event.preventDefault();

    // Simulando verificación de credenciales 
    const username = usernameInput.value;
    const password = passwordInput.value;

    loader.style.display = 'block'; // Mostrar loader

    // Simulando una petición asíncrona 
    setTimeout(() => {
      loader.style.display = 'none'; // Ocultar loader

      if (username === 'usuario' && password === 'contraseña') {
        message.textContent = '¡Bienvenido!';
        message.style.color = 'green';
      } else {
        message.textContent = 'Credenciales incorrectas';
        message.style.color = 'red';
        usernameInput.classList.add('invalid-input');
        passwordInput.classList.add('invalid-input');

        // Eliminar la clase de invalidación después de un tiempo
        setTimeout(() => {
          usernameInput.classList.remove('invalid-input');
          passwordInput.classList.remove('invalid-input');
        }, 2000);
      }
    }, 1500);
  });
});
