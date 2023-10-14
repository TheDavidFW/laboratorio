const url = 'https://api-blue-archive.vercel.app/api/characters'

fetch(url)
.then(response => response.json())
.then(data => {
    var nombre = document.getElementById('nombre');
    var colegio = document.getElementById('colegio');
    var imagen = document.getElementById('imagen');
    nombre.innerHTML = `${data.data[3].name}`;
    colegio.innerHTML = `${data.data[3].school}`;
    imagen.innerHTML = `<img src=${data.data[3].imageSchool}></img>`;
})
.catch(err=>console.log(err))

function cambiarColor() {
    var x = document.createElement("STYLE");
    var t = document.createTextNode(".parrafo1 {color: green}");
    x.appendChild(t);
    document.head.appendChild(x);
}
function agregarTexto() {
    var texto = document.getElementById("texto");
    var entrada = document.getElementById("entrada").value;
    texto.innerHTML = entrada;
}
function concatenarTexto() {
    var concatenado = document.getElementById("concatenado");
    var texto1 = document.getElementById("entrada1").value;
    var texto2 = document.getElementById("entrada2").value;
    concatenado.innerHTML = texto1 + " " + texto2;
}

function eliminarListaD() {
    var lista = document.getElementById('lista');
    lista.remove(lista.selectedIndex);
}

function accederPagina() {
    location.href = "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
}

function activarAlerta() {
    var concatenado = document.getElementById('concatenado').textContent;
    alert(concatenado);
}

function mostrarConsola() {
    var consola = document.getElementById('revisarconsola');
    var concatenado = document.getElementById('concatenado').textContent;
    console.log(concatenado);
    consola.innerHTML = "Revisa la Consola";
}

function mostartEstadoCheck() {
    var estadocheck = document.getElementById('estadocheck');
    var checkbox = document.getElementById("checkbox");
    var estado = checkbox.checked ? "Marcado" : "No marcado";
    estadocheck.innerHTML = "Estado: " + estado;
}

function mostrarEstadoRadio() {
    var estadoradio = document.getElementById('estadoradio');
    var radioboton1 = document.getElementById("radioboton1");
    var radioboton2 = document.getElementById("radioboton2");
    var estado;
    if (radioboton1.checked) {
        estado = radioboton1.value;
    } else if (radioboton2.checked) {
        estado = radioboton2.value;
    } else {
        estado = "No hay ninguna opcion seleccionada"
    }
    estadoradio.innerHTML = "Estado: " + estado;
}

function validarTexto() {
    var campo = document.getElementById('campo').value;
    var patron = /^[A-Za-z\s]+$/;
    if (campo != "") {
        if (patron.test(campo)) {
            alert("Es Valido");
        } else {
            alert("No es valido, solo se aceptan letras y espacios");
        }
    } else {
        alert("No has ingresado nada");
    }
}