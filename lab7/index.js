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

let i=0;
function obtenerDatos(){
    fetch('https://api-blue-archive.vercel.app/api/characters').
    then(resultado => {
        resultado.json().then(json => {
            personajes = json;
            console.log(personajes);
        })
    });
}


function mapearPersonajes(){
    let tabla = document.getElementById('tabla');
    if (i<personajes.data.length){
        tabla.innerHTML += mapearPlantilla(personajes.data[i]);
        i++;
    }else{
        console.log("Ya no hay mas Personajes")
    }
}

function mapearPlantilla(personaje){
    return `<tr>
        <td id="nombre">${personaje.name}</td>
        <td id="colegio">${personaje.school}</td>
        <td><img src=${personaje.imageSchool}></img></td>
    </tr>`;
}
