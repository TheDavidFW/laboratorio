package com.example.ejemplo.Models;

public class Productos {
  private int Id;
  private String Nombre;
  private Float Precio;
  private int CategoriaId;
  private String Foto;
  private String FechaCaducidad;
  private String FechaProduccion;

  public Productos(int id, String nombre, Float precio, int categoriaId, String foto, String fechaCaducidad,
      String fechaProduccion) {
    Id = id;
    Nombre = nombre;
    Precio = precio;
    CategoriaId = categoriaId;
    Foto = foto;
    FechaCaducidad = fechaCaducidad;
    FechaProduccion = fechaProduccion;
  }

  public Productos() {
  }

  public int getId() {
    return Id;
  }

  public void setId(int id) {
    Id = id;
  }

  public String getNombre() {
    return Nombre;
  }

  public void setNombre(String nombre) {
    Nombre = nombre;
  }

  public Float getPrecio() {
    return Precio;
  }

  public void setPrecio(Float precio) {
    Precio = precio;
  }

  public int getCategoriaId() {
    return CategoriaId;
  }

  public void setCategoriaId(int categoriaId) {
    CategoriaId = categoriaId;
  }

  public String getFoto() {
    return Foto;
  }

  public void setFoto(String foto) {
    Foto = foto;
  }

  public String getFechaCaducidad() {
    return FechaCaducidad;
  }

  public void setFechaCaducidad(String fechaCaducidad) {
    FechaCaducidad = fechaCaducidad;
  }

  public String getFechaProduccion() {
    return FechaProduccion;
  }

  public void setFechaProduccion(String fechaProduccion) {
    FechaProduccion = fechaProduccion;
  }
}
