let baseUrl = "http://localhost:8080";
let productos = [];

function ObtenerProductos() {
  fetch(baseUrl + '/productos/all').then(res => {
    res.json().then(json => {
      productos = json;
      ImprimirProductos();
    });
  });
}

function ImprimirProductos() {
  let contenedor = document.getElementById("cuerpoTabla");
  contenedor.innerHTML = "";

  productos.forEach(producto => {
    contenedor.innerHTML += MapearProducto(producto);
  });
}

function MapearProducto(producto) {
  return `<tr>
  <td>
    <button class='btn btn-danger btn-sm' onclick="EliminarProducto(${producto.id})">Eliminar</button>
    <button class='btn btn-warning btn-sm' onclick="PopularDatosCampos(${producto.id})">Actualizar</button>
    </td>
  <td>${producto.id}</td>
  <td>${producto.nombre}</td>
  <td>${producto.precio}</td>
  <td>${producto.categoriaId}</td>
  <td><img src="${producto.foto}" width="100" height="100"></td>
  <td>${producto.fechaProduccion}</td>
  <td>${producto.fechaCaducidad}</td>
</tr>`;
}

function EliminarProducto(pid) {
  fetch(baseUrl + '/producto/' + pid, { method: "Delete" }).then(res => {
    console.log(pid)
    console.log(res);
    ObtenerProductos();
  });
}

function GuardarProducto() {
  let data = {
    nombre: document.getElementById("nombre").value,
    precio: document.getElementById("precio").value,
    categoriaId: document.getElementById("categoriaId").value,
    foto: document.getElementById("foto").value,
    fechaProduccion: document.getElementById("fechaProduccion").value,
    fechaCaducidad: document.getElementById("fechaCaducidad").value
  };

  fetch(baseUrl + "/producto", {
    method: 'POST',
    body: JSON.stringify(data),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8'
    }
  }).then(res => {
    console.log(res);
    ObtenerProductos();
  });
}

function PopularDatosCampos(pid) {
  let producto = productos.filter(p => { return p.id == pid })[0];

  document.getElementById('nombre').value = producto.nombre;
  document.getElementById('precio').value = producto.precio;
  document.getElementById('categoriaId').value = producto.categoriaId;
  document.getElementById('foto').value = producto.foto;
  document.getElementById('fechaProduccion').value = producto.fechaProduccion;
  document.getElementById('fechaCaducidad').value = producto.fechaCaducidad;
  document.getElementById('productoId').value = producto.id;

}

function ActualizarProducto() {
  let data = {
    nombre: document.getElementById("nombre").value,
    precio: document.getElementById("precio").value,
    categoriaId: document.getElementById("categoriaId").value,
    foto: document.getElementById("foto").value,
    fechaProduccion: document.getElementById("fechaProduccion").value,
    fechaCaducidad: document.getElementById("fechaCaducidad").value,
    id: document.getElementById('productoId').value
  };

  fetch(baseUrl + "/producto", {
    method: 'PUT',
    body: JSON.stringify(data),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8'
    }
  }).then(res => {
    console.log(res);
    ObtenerProductos();
  });
}