USE master
CREATE DATABASE chichemes
GO
USE chichemes;

CREATE TABLE personas (
	id INT IDENTITY(1,1)
		CONSTRAINT personas_id_pk PRIMARY KEY (id),
	nombre VARCHAR(50),
	apellido VARCHAR(50),
	edad INT,
	correo VARCHAR(100)
		CONSTRAINT personas_correo_uk UNIQUE (correo),
	telefono varchar(50),
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE categorias (
	id INT IDENTITY(1,1)
		CONSTRAINT categorias_id_pk PRIMARY KEY (id),
	nombre VARCHAR(50),
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE productos (
	id INT IDENTITY(1,1),
	nombre VARCHAR(50),
	precio FLOAT,
	categoria_id INT,
	fotoUrl VARCHAR(150),
	fecha_preparacion VARCHAR(50),
	fecha_expiracion VARCHAR(50),
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	constraint productos_id_pk primary key (id),
	CONSTRAINT productos_categoria_id_fk FOREIGN KEY (categoria_id) REFERENCES categorias (id)
);

CREATE TABLE carrito (
	id INT IDENTITY(1,1),
	producto_id INT,
	persona_id INT,
	cantidad INT DEFAULT 1,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT carrito_id_pk PRIMARY KEY (id),
	CONSTRAINT carrito_producto_id_fk FOREIGN KEY (producto_id) REFERENCES productos(id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT carrito_persona_id_fk FOREIGN KEY (persona_id) REFERENCES personas(id) 
);

CREATE TABLE comentarios (
	id INT IDENTITY(1,1),
	comentario VARCHAR(1500),
	persona_id INT,
	producto_id INT,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT comentarios_id_pk PRIMARY KEY (id),
	CONSTRAINT comentarios_persona_id_fk FOREIGN KEY (persona_id) REFERENCES personas(id),
	CONSTRAINT comentarios_producto_id_fk FOREIGN KEY (producto_id) REFERENCES productos(id) on delete cascade on update cascade
);

CREATE TABLE compras (
	id INT IDENTITY(1,1),
	persona_id INT,
	fecha VARCHAR(50) DEFAULT CONVERT(VARCHAR(10), GETDATE(), 120),
	total FLOAT,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
	CONSTRAINT compras_id_pk PRIMARY KEY (id),
	CONSTRAINT compras_persona_id_fk FOREIGN KEY (persona_id) REFERENCES personas(id)
);

CREATE TABLE compra_detalles (
	id INT IDENTITY(1,1),
	compra_id INT,
	producto_id INT,
	cantidad INT,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT compra_producto_id_pk PRIMARY KEY (id),
	CONSTRAINT compra_producto_compra_id_fk FOREIGN KEY (compra_id) REFERENCES compras(id),
	CONSTRAINT compra_producto_producto_id_fk FOREIGN KEY (producto_id) REFERENCES productos(id) on delete cascade on update cascade
);

CREATE TABLE ingredientes (
	id INT IDENTITY(1,1),
	nombre VARCHAR(50),
	porcion INT,
	product_id INT,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT ingredientes_id_pk PRIMARY KEY (id),
	CONSTRAINT ingredientes_product_id_fk FOREIGN KEY (product_id) REFERENCES productos(id) on delete cascade on update cascade
);

CREATE TABLE productos_favoritos_persona (
	id INT IDENTITY(1,1),
	product_id INT,
	persona_id INT,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT productos_favoritos_persona_id_pk PRIMARY KEY (id),
	CONSTRAINT productos_favoritos_persona_product_id_fk FOREIGN KEY (product_id) REFERENCES productos(id),
	CONSTRAINT productos_favoritos_persona_persona_id_fk FOREIGN KEY (persona_id) REFERENCES personas(id) on delete cascade on update cascade
);

CREATE TABLE usuarios(
	id INT IDENTITY (1,1),
	usuario VARCHAR(50),
	contrasena VARCHAR(50),
	persona_id INT,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT usuarios_id_pk PRIMARY KEY (id),
	CONSTRAINT usuarios_persona_id_fk FOREIGN KEY (persona_id) REFERENCES personas(id)
);
--Insert
INSERT INTO personas (nombre, apellido, edad, correo, telefono, created_at, updated_at)
 	VALUES
		('Vegeta', 'Ramirez', 25, 'correo@correo.comass', '999-9999', '2021-06-16 14:32:20', '2022-07-04 21:17:39'),
		('Juan Antonio', 'Arosemena', 123, 'juan.zamora@utp.ac.pa', '3056004912', '2021-06-16 14:42:50', '2021-06-16 14:42:50'),
		('Hallaca', 'Vega', 25, 'correo@correo.comas', '999-9999', '2022-07-04 21:11:46', '2022-07-04 21:11:46');

INSERT INTO categorias (nombre, created_at, updated_at) 
	VALUES
		('Frituras', '2021-06-21 13:07:11', '2021-06-21 13:07:11'),
		('Bebidas', '2021-06-21 13:07:17', '2021-06-21 13:07:17'),
		('Asados', '2021-06-21 13:07:43', '2021-06-21 13:07:43'),
		('Postres', '2021-06-21 13:08:26', '2021-06-21 13:08:26'),
		('Frituras', '2022-06-27 09:11:39', '2022-06-27 09:11:39');

INSERT INTO productos (nombre, precio, categoria_id, fotoUrl, fecha_preparacion, fecha_expiracion, created_at, updated_at) 
	VALUES
		('Chicheme Chorrerano 16oz', 1.75, 2, 'https://www.recetaspanama.com/base/stock/Recipe/135-image/135-image_web.jpg', '2021-06-19', '2021-06-23', '2021-06-21 13:09:55', '2021-06-21 13:09:55'),
		('Chicheme Chorrerano 1 lt', 10.5, 2, 'http://4.bp.blogspot.com/-C3Y5ApTqcNI/U0sm3RLa0vI/AAAAAAAAANU/6gbwCgVW4_Y/s1600/P1010079.JPG', '2021-06-19', '2021-06-23', '2021-06-21 13:09:55', '2021-06-21 13:11:30'),
		('Empanada de Maiz', 0.75, 1, 'https://i.pinimg.com/originals/4e/cc/91/4ecc916128109d45806af4db739d337b.jpg', '2021-06-19', '2021-06-23', '2021-06-21 13:09:55', '2021-06-21 13:13:41'),
		('Empanada de Harina', 0.8, 3, 'https://www.johannyskitchen.com/wp-content/uploads/2020/04/fried-empanadas-scaled.jpg', '2021-06-19', '2021-06-23', '2021-06-21 13:09:55', '2021-06-21 13:14:25'),
		('Muslos de pavos', 1.5, 2, 'https://cdn0.recetasgratis.net/es/posts/1/2/8/muslo_de_pavo_al_horno_jugoso_70821_600.webp', '2022-12-12', '2030-12-12', '2021-06-21 13:09:55', '2022-11-15 20:59:44'),
		('Bollo de Coco Dulce', 1.25, 4, 'https://www.recetas-nicaragua.com/base/stock/Recipe/24-image/24-image_web.jpg', '2021-06-19', '2021-06-23', '2021-06-21 13:09:55', '2021-06-21 13:16:24'),
		('Manjar blanco 10oz', 2, 4, 'https://recetasdemicolombia.com/wp-content/uploads/2020/02/manjar-blanco-500x375.jpg', '2021-06-19', '2021-06-23', '2021-06-21 13:09:55', '2021-06-21 13:17:07'),
		('Chicha Melocoton 16oz', 1.75, 2, 'http://2.bp.blogspot.com/_lkNcUWsFm6k/TM6YfvS1I4I/AAAAAAAAAS0/RI0fgBRExfE/s1600/P1200710.jpg', '2021-06-19', '2021-06-23', '2021-06-21 13:09:55', '2021-06-21 13:17:50'),
		('Carimanola', 0.65, 1, 'https://media-cdn.tripadvisor.com/media/photo-s/10/7d/03/7f/fried-yuca-rolls-stuffed.jpg', null, '2021-06-23', '2021-06-21 13:09:55', '2021-07-05 14:02:38'),
		('Platanito', 0.75, 1, 'https://st3.depositphotos.com/7198202/14274/i/600/depositphotos_142743213-stock-photo-fried-plantain-slices.jpg', null, '2022-01-30', '2021-06-30 14:02:56', '2021-10-06 13:51:06'),
		('OTro producto', 1.5, 2, 'https://www.eatthis.com/wp-content/uploads/sites/4/2021/08/new-grocery-items.jpg?quality=82&strip=1&w=1250', '2022-12-12', '2030-12-12', '2022-11-15 20:48:35', '2022-11-15 20:48:35');

INSERT INTO carrito (producto_id, persona_id, cantidad, created_at, updated_at) VALUES
	(11, 1, 1, '2021-10-06 10:43:07', '2021-10-06 10:43:07'),
	(3, 1, 1, '2021-10-06 10:43:16', '2021-10-06 10:43:16'),
	(8, 1, 1, '2021-10-06 10:43:22', '2021-10-06 10:43:22'),
	(9, 1, 1, '2021-10-06 13:50:14', '2021-10-06 13:50:14');

INSERT INTO comentarios (comentario, persona_id, producto_id, created_at, updated_at) VALUES
	('estaba en bomba ese chicheme', 1, 1, '2021-06-23 14:31:40', '2021-06-23 14:31:40'),
	('el coco taba muy dulce', 1, 6, '2021-06-23 14:32:53', '2021-06-23 14:32:53'),
	('el aceite donde se frieron esas empanadas estaba viejo, como que habian freido pescado', 1, 3, '2021-06-23 14:47:32', '2021-06-23 14:47:32'),
	('que raro, xuzo, mis empanadas si estaban de alante', 3, 3, '2021-06-23 14:48:16', '2021-06-23 14:48:16');

INSERT INTO compras (persona_id, fecha, total, created_at, updated_at) VALUES
	(1, '2021-07-07', 22.25, '2021-07-07 15:17:51', '2021-07-07 15:17:51'),
	(1, '2021-07-07', 22.25, '2021-07-07 15:18:31', '2021-07-07 15:18:31'),
	(1, '2021-07-07', 22.25, '2021-07-07 15:19:01', '2021-07-07 15:19:01'),
	(1, '2021-07-07', 22.25, '2021-07-07 15:19:49', '2021-07-07 15:19:49'),
	(1, '2021-07-07', 22.25, '2021-07-07 15:20:13', '2021-07-07 15:20:13'),
	(1, '2021-07-07', 22.25, '2021-07-07 15:22:01', '2021-07-07 15:22:01');

INSERT INTO compra_detalles (compra_id, producto_id, cantidad, created_at, updated_at) VALUES
	(1, 3, 6, '2021-07-07 15:17:51', '2021-07-07 15:17:51'),
	(1, 1, 1, '2021-07-07 15:17:51', '2021-07-07 15:17:51'),
	(1, 6, 2, '2021-07-07 15:17:51', '2021-07-07 15:17:51'),
	(1, 6, 4, '2021-07-07 15:17:51', '2021-07-07 15:17:51'),
	(1, 8, 5, '2021-07-07 15:17:51', '2021-07-07 15:17:51'),
	(2, 3, 6, '2021-07-07 15:18:31', '2021-07-07 15:18:31'),
	(2, 1, 1, '2021-07-07 15:18:31', '2021-07-07 15:18:31'),
	(2, 6, 2, '2021-07-07 15:18:31', '2021-07-07 15:18:31'),
	(2, 6, 4, '2021-07-07 15:18:31', '2021-07-07 15:18:31'),
	(2, 8, 5, '2021-07-07 15:18:31', '2021-07-07 15:18:31'),
	(3, 3, 6, '2021-07-07 15:19:01', '2021-07-07 15:19:01'),
	(3, 1, 1, '2021-07-07 15:19:01', '2021-07-07 15:19:01'),
	(3, 6, 2, '2021-07-07 15:19:01', '2021-07-07 15:19:01'),
	(3, 6, 4, '2021-07-07 15:19:01', '2021-07-07 15:19:01'),
	(3, 8, 5, '2021-07-07 15:19:01', '2021-07-07 15:19:01'),
	(4, 3, 6, '2021-07-07 15:19:49', '2021-07-07 15:19:49'),
	(4, 1, 1, '2021-07-07 15:19:49', '2021-07-07 15:19:49'),
	(4, 6, 2, '2021-07-07 15:19:49', '2021-07-07 15:19:49'),
	(4, 6, 4, '2021-07-07 15:19:49', '2021-07-07 15:19:49'),
	(4, 8, 5, '2021-07-07 15:19:49', '2021-07-07 15:19:49'),
	(5, 3, 6, '2021-07-07 15:20:13', '2021-07-07 15:20:13'),
	(5, 1, 1, '2021-07-07 15:20:13', '2021-07-07 15:20:13'),
	(5, 6, 2, '2021-07-07 15:20:13', '2021-07-07 15:20:13'),
	(5, 6, 4, '2021-07-07 15:20:13', '2021-07-07 15:20:13'),
	(5, 8, 5, '2021-07-07 15:20:13', '2021-07-07 15:20:13'),
	(6, 3, 6, '2021-07-07 15:22:01', '2021-07-07 15:22:01'),
	(6, 1, 1, '2021-07-07 15:22:01', '2021-07-07 15:22:01'),
	(6, 6, 2, '2021-07-07 15:22:01', '2021-07-07 15:22:01'),
	(6, 6, 4, '2021-07-07 15:22:01', '2021-07-07 15:22:01'),
	(6, 8, 5, '2021-07-07 15:22:01', '2021-07-07 15:22:01');

INSERT INTO ingredientes (nombre, porcion, product_id, created_at, updated_at) VALUES
	('leche', 1, 1, '2021-06-23 13:28:15', '2021-06-23 13:28:16'),
	('maiz', 2, 1, '2021-06-23 13:28:30', '2021-06-23 13:28:30'),
	('maizena', 1, 1, '2021-06-23 13:28:46', '2021-06-23 13:28:52'),
	('leche', 2, 2, '2021-06-23 13:28:15', '2021-06-23 13:29:07'),
	('maiz', 3, 2, '2021-06-23 13:28:30', '2021-06-23 13:28:30'),
	('maizena', 2, 2, '2021-06-23 13:28:46', '2021-06-23 13:28:52'),
	('Hallaca', 200, 5, '2022-06-28 16:33:16', '2022-06-28 16:33:16');

INSERT INTO productos_favoritos_persona (product_id, persona_id, created_at, updated_at) VALUES
	(6, 1, '2021-06-21 14:16:56', '2021-06-21 14:16:56'),
	(9, 3, '2021-06-21 14:16:56', '2021-06-21 14:21:07'),
	(8, 3, '2021-06-23 14:51:20', '2021-06-23 14:51:20'),
	(8, 1, '2021-10-06 10:43:47', '2021-10-06 10:43:47'),
	(11, 1, '2021-10-06 10:43:54', '2021-10-06 10:43:54'),
	(5, 1, '2021-10-06 13:50:42', '2021-10-06 13:50:42');

INSERT INTO usuarios (usuario, contrasena, persona_id, created_at, updated_at) VALUES
	('kakaroto', '252525', 1, '2021-06-16 14:32:20', '2021-06-16 14:32:20'),
	('cristhian', '252525', 3, '2021-06-16 14:42:50', '2021-06-16 14:42:50');
USE chichemes
GO
CREATE PROCEDURE InsertarProducto
    @n VARCHAR(50),
    @p FLOAT,
    @c INT,
    @u VARCHAR(150),
    @fp VARCHAR(50),
    @fe VARCHAR(50)
AS
BEGIN
    INSERT INTO productos (nombre, precio, categoria_id, fotoUrl, fecha_preparacion, fecha_expiracion)
    VALUES (@n, @p, @c, @u, @fp, @fe);
END
GO

GO
CREATE PROCEDURE ActualizarProducto(
	@pid INT,
	@n VARCHAR(50),
	@p FLOAT,
	@c INT,
	@f VARCHAR(150),
	@fp VARCHAR(50),
	@fe VARCHAR(50)
)
AS
BEGIN
	UPDATE productos
	SET 
		nombre = @n,
		precio = @p,
		categoria_id = @c,
		fotoUrl = @f,
		fecha_preparacion = @fp,
		fecha_expiracion = @fe
	WHERE id = @pid;
END
GO

GO
CREATE PROCEDURE EliminarProducto(
	@pid INT
)
AS
BEGIN
	DELETE FROM productos
	WHERE id= @pid;
END
GO
