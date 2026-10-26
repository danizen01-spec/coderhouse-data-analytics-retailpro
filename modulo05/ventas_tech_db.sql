-- === SECCIÓN 1: USO DE BASE DE DATOS===
USE Ventas_Tech_DB;
GO
-- === SECCIÓN 2:ELIMINACIÓN DE TABLAS (repetibilidad) ===
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;
DROP TABLE IF EXISTS territorios;

USE Ventas_Tech_DB;
GO

CREATE TABLE clientes (
    id_cliente INT NOT NULL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NULL,
    ciudad VARCHAR(50) NULL,
    segmento VARCHAR(50) NULL,
    fecha_registro DATE NULL
);

CREATE TABLE categorias (
    id_categoria INT NOT NULL PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200)
);

CREATE TABLE productos (
    id_producto INT NOT NULL PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    id_categoria INT NULL REFERENCES categorias(id_categoria),
    precio DECIMAL(12,2) NULL,
    costo DECIMAL(12,2) NULL,
    stock INT NOT NULL DEFAULT 0,
    activo BIT NOT NULL DEFAULT (1)
);

CREATE TABLE territorios (
    id_territorio INT NOT NULL PRIMARY KEY,
    region VARCHAR(100) NULL,
    pais VARCHAR(100) NULL,
    zona VARCHAR(100) NULL
);

CREATE TABLE ventas (
    id_venta INT NOT NULL PRIMARY KEY,
    fecha_venta DATE NOT NULL,
    id_cliente INT NULL REFERENCES clientes(id_cliente),
    id_producto INT NULL REFERENCES productos(id_producto),
    id_territorio INT NULL REFERENCES territorios(id_territorio),
    cantidad INT NOT NULL,
    total_venta DECIMAL(12,2) NOT NULL
);
-- === SECCIÓN 3:INSERCIÓN DE FILAS===
--Tabla categorias
INSERT INTO categorias (id_categoria, nombre_categoria, descripcion) VALUES
  (1, 'Computación',    'Laptops, PCs y monitores'),
  (2, 'Accesorios',     'Periféricos y complementos'),
  (3, 'Audio',          'Auriculares y parlantes'),
  (4, 'Almacenamiento', 'Discos y memorias');
  
  -- Tabla clientes
INSERT INTO clientes
(id_cliente, nombre, email, ciudad, segmento, fecha_registro)
VALUES
    (1, 'María López', 'cliente01@retailpro.test', 'Buenos Aires', 'Frecuente', '2023-08-14'),
    (2, 'Carlos Ruiz', 'cliente02@retailpro.test', 'Córdoba', 'Corporativo', '2023-08-27'),
    (3, 'Ana Gómez', 'cliente03@retailpro.test', 'Rosario', 'Minorista', '2023-09-09'),
    (4, 'Pedro Sanz', 'cliente04@retailpro.test', 'Mendoza', 'Minorista', '2023-09-22'),
    (5, 'Laura Torres', 'cliente05@retailpro.test', 'Tucumán', 'Frecuente', '2023-10-05'),
    (6, 'Lucía Fernández', 'cliente06@retailpro.test', 'La Plata', 'Minorista', '2023-10-18'),
    (7, 'Martín Pérez', 'cliente07@retailpro.test', 'Buenos Aires', 'Frecuente', '2023-10-31'),
    (8, 'Sofía Ramírez', 'cliente08@retailpro.test', 'Córdoba', 'Minorista', '2023-11-13'),
    (9, 'Julián Castro', 'cliente09@retailpro.test', 'Rosario', 'Corporativo', '2023-11-26'),
    (10, 'Valentina Díaz', 'cliente10@retailpro.test', 'Mendoza', 'Minorista', '2023-12-09'),
    (11, 'Nicolás Herrera', 'cliente11@retailpro.test', 'Tucumán', 'Frecuente', '2023-12-22'),
    (12, 'Camila Romero', 'cliente12@retailpro.test', 'La Plata', 'Minorista', '2024-01-04'),
    (13, 'Federico Molina', 'cliente13@retailpro.test', 'Mar del Plata', 'Corporativo', '2024-01-17'),
    (14, 'Agustina Silva', 'cliente14@retailpro.test', 'Salta', 'Frecuente', '2024-01-30'),
    (15, 'Tomás Acosta', 'cliente15@retailpro.test', 'Buenos Aires', 'Minorista', '2024-02-12'),
    (16, 'Florencia Medina', 'cliente16@retailpro.test', 'Córdoba', 'Minorista', '2024-02-25'),
    (17, 'Mateo Suárez', 'cliente17@retailpro.test', 'Rosario', 'Frecuente', '2024-03-09'),
    (18, 'Carolina Vega', 'cliente18@retailpro.test', 'Mendoza', 'Corporativo', '2024-03-22'),
    (19, 'Facundo Ortiz', 'cliente19@retailpro.test', 'Salta', 'Minorista', '2024-04-04'),
    (20, 'Paula Ríos', 'cliente20@retailpro.test', 'Mar del Plata', 'Frecuente', '2023-08-01'),
    (21, 'Bruno Navarro', 'cliente21@retailpro.test', 'Buenos Aires', 'Minorista', '2023-08-14'),
    (22, 'Milagros Luna', 'cliente22@retailpro.test', 'La Plata', 'Minorista', '2023-08-27'),
    (23, 'Santiago Cabrera', 'cliente23@retailpro.test', 'Tucumán', 'Corporativo', '2023-09-09'),
    (24, 'Rocío Benítez', 'cliente24@retailpro.test', 'Córdoba', 'Frecuente', '2023-09-22'),
    (25, 'Ignacio Ferreyra', 'cliente25@retailpro.test', 'Rosario', 'Minorista', '2023-10-05'),
    (26, 'Elena Campos', 'cliente26@retailpro.test', 'Salta', 'Minorista', '2023-10-18'),
    (27, 'Gabriel Ponce', 'cliente27@retailpro.test', 'Mendoza', 'Corporativo', '2023-10-31'),
    (28, 'Abril Núñez', 'cliente28@retailpro.test', 'Buenos Aires', 'Minorista', '2023-11-13'),
    (29, 'Emilia Rojas', 'cliente29@retailpro.test', 'Mar del Plata', 'Frecuente', '2023-11-26'),
    (30, 'Damián Arias', 'cliente30@retailpro.test', 'La Plata', 'Minorista', '2023-12-09');
  -- Tabla productos
INSERT INTO productos
(id_producto, nombre_producto, id_categoria, precio, costo, stock, activo)
VALUES
    (1, 'Laptop Pro 15', 1, 1200, 900, 15, 1),
    (2, 'Mouse Inalámbrico', 2, 28, 16, 80, 1),
    (3, 'Monitor 4K 27', 1, 450, 320, 12, 1),
    (4, 'Auriculares BT Pro', 3, 120, 75, 35, 1),
    (5, 'SSD Externo 1TB', 4, 130, 85, 18, 1),
    (6, 'Teclado Mecánico', 2, 95, 60, 40, 1),
    (7, 'Webcam HD', 2, 65, 40, 20, 1),
    (8, 'Notebook Air 14', 1, 850, 640, 17, 1),
    (9, 'Monitor Full HD 24', 1, 220, 150, 24, 1),
    (10, 'Mouse Gamer RGB', 2, 48, 28, 60, 1),
    (11, 'Teclado Compacto', 2, 55, 32, 45, 1),
    (12, 'Auriculares In Ear', 3, 35, 19, 75, 1),
    (13, 'Parlante Bluetooth', 3, 80, 48, 30, 1),
    (14, 'Micrófono USB', 3, 110, 70, 22, 1),
    (15, 'SSD Interno 500GB', 4, 75, 45, 50, 1),
    (16, 'SSD Interno 2TB', 4, 210, 145, 16, 1),
    (17, 'Pendrive 128GB', 4, 22, 12, 100, 1),
    (18, 'Disco Externo 2TB', 4, 160, 110, 28, 1),
    (19, 'Hub USB-C', 2, 42, 24, 55, 1),
    (20, 'Adaptador HDMI', 2, 18, 9, 90, 1);

 -- Tabla territorios
INSERT INTO territorios (id_territorio, region, pais, zona)
VALUES
    (1, 'Buenos Aires', 'Argentina', 'Centro'),
    (2, 'Córdoba', 'Argentina', 'Centro'),
    (3, 'Santa Fe', 'Argentina', 'Centro'),
    (4, 'Mendoza', 'Argentina', 'Cuyo'),
    (5, 'Tucumán', 'Argentina', 'NOA'),
    (6, 'La Plata', 'Argentina', 'Centro'),
    (7, 'Salta', 'Argentina', 'NOA'),
    (8, 'Mar del Plata', 'Argentina', 'Costa Atlántica');

-- Tabla ventas
INSERT INTO ventas
    (id_venta, fecha_venta, id_cliente, id_producto,
     id_territorio, cantidad, total_venta)
VALUES
    (1, '2024-01-03', 8, 8, 2, 2, 1700),
    (2, '2024-01-06', 18, 15, 4, 1, 75),
    (3, '2024-01-09', 2, 4, 2, 1, 120),
    (4, '2024-01-12', 12, 12, 6, 1, 35),
    (5, '2024-01-15', 22, 1, 6, 3, 3600),
    (6, '2024-01-18', 6, 9, 6, 2, 440),
    (7, '2024-01-21', 16, 16, 2, 4, 840),
    (8, '2024-01-24', 26, 5, 7, 1, 130),
    (9, '2024-01-27', 10, 13, 4, 2, 160),
    (10, '2024-02-05', 19, 2, 7, 1, 28),
    (11, '2024-02-08', 3, 10, 3, 1, 48),
    (12, '2024-02-11', 13, 17, 8, 2, 44),
    (13, '2024-02-14', 23, 6, 5, 1, 95),
    (14, '2024-02-17', 7, 14, 1, 1, 110),
    (15, '2024-02-20', 17, 3, 3, 2, 900),
    (16, '2024-02-23', 1, 11, 1, 2, 110),
    (17, '2024-02-26', 11, 18, 5, 1, 160),
    (18, '2024-02-02', 21, 8, 1, 2, 1700),
    (19, '2024-02-05', 5, 15, 5, 3, 225),
    (20, '2024-03-07', 11, 2, 5, 1, 28),
    (21, '2024-03-10', 21, 10, 1, 3, 144),
    (22, '2024-03-13', 5, 17, 5, 2, 44),
    (23, '2024-03-16', 15, 6, 1, 1, 95),
    (24, '2024-03-19', 25, 14, 3, 1, 110),
    (25, '2024-03-22', 9, 3, 3, 4, 1800),
    (26, '2024-03-25', 19, 11, 7, 1, 55),
    (27, '2024-03-01', 3, 18, 3, 1, 160),
    (28, '2024-03-04', 13, 8, 8, 1, 850),
    (29, '2024-03-07', 23, 15, 5, 3, 225),
    (30, '2024-03-10', 7, 4, 1, 2, 240),
    (31, '2024-03-13', 17, 12, 3, 3, 105),
    (32, '2024-03-16', 1, 1, 1, 3, 3600),
    (33, '2024-04-09', 24, 18, 2, 2, 320),
    (34, '2024-04-12', 8, 8, 2, 5, 4250),
    (35, '2024-04-15', 18, 15, 4, 1, 75),
    (36, '2024-04-18', 2, 4, 2, 2, 240),
    (37, '2024-04-21', 12, 12, 6, 3, 105),
    (38, '2024-04-24', 22, 1, 6, 2, 2400),
    (39, '2024-04-27', 6, 9, 6, 3, 660),
    (40, '2024-04-03', 16, 16, 2, 2, 420),
    (41, '2024-04-06', 26, 5, 7, 2, 260),
    (42, '2024-05-11', 9, 13, 3, 1, 80),
    (43, '2024-05-14', 19, 2, 7, 1, 28),
    (44, '2024-05-17', 3, 10, 3, 1, 48),
    (45, '2024-05-20', 13, 17, 8, 1, 22),
    (46, '2024-05-23', 23, 6, 5, 1, 95),
    (47, '2024-05-26', 7, 14, 1, 1, 110),
    (48, '2024-05-02', 17, 3, 3, 1, 450),
    (49, '2024-05-05', 1, 11, 1, 2, 110),
    (50, '2024-05-08', 11, 18, 5, 1, 160),
    (51, '2024-05-11', 21, 8, 1, 1, 850),
    (52, '2024-05-14', 5, 15, 5, 1, 75),
    (53, '2024-05-17', 15, 4, 1, 1, 120),
    (54, '2024-05-20', 25, 12, 3, 4, 140),
    (55, '2024-05-23', 9, 1, 3, 2, 2400),
    (56, '2024-06-13', 3, 16, 3, 2, 420),
    (57, '2024-06-16', 13, 5, 8, 1, 130),
    (58, '2024-06-19', 23, 13, 5, 3, 240),
    (59, '2024-06-22', 7, 2, 1, 1, 28),
    (60, '2024-06-25', 17, 10, 3, 1, 48),
    (61, '2024-06-01', 1, 17, 1, 5, 110),
    (62, '2024-06-04', 11, 6, 5, 2, 190),
    (63, '2024-06-07', 21, 14, 1, 2, 220),
    (64, '2024-07-15', 7, 5, 1, 2, 260),
    (65, '2024-07-18', 17, 13, 3, 3, 240),
    (66, '2024-07-21', 1, 2, 1, 3, 84),
    (67, '2024-07-24', 11, 10, 5, 1, 48),
    (68, '2024-07-27', 21, 17, 1, 1, 22),
    (69, '2024-07-03', 5, 6, 5, 1, 95),
    (70, '2024-07-06', 15, 14, 1, 1, 110),
    (71, '2024-07-09', 25, 3, 3, 1, 450),
    (72, '2024-07-12', 9, 11, 3, 4, 220),
    (73, '2024-07-15', 19, 18, 7, 3, 480),
    (74, '2024-07-18', 3, 8, 3, 1, 850),
    (75, '2024-08-17', 6, 11, 6, 2, 110),
    (76, '2024-08-20', 16, 18, 2, 1, 160),
    (77, '2024-08-23', 26, 8, 7, 4, 3400),
    (78, '2024-08-26', 10, 15, 4, 2, 150),
    (79, '2024-08-02', 20, 4, 8, 1, 120),
    (80, '2024-08-05', 4, 12, 4, 1, 35),
    (81, '2024-08-08', 14, 1, 7, 2, 2400),
    (82, '2024-08-11', 24, 9, 2, 1, 220),
    (83, '2024-08-14', 8, 16, 2, 2, 420),
    (84, '2024-08-17', 18, 5, 4, 4, 520),
    (85, '2024-08-20', 2, 13, 2, 1, 80),
    (86, '2024-08-23', 12, 2, 6, 1, 28),
    (87, '2024-09-19', 12, 3, 6, 5, 2250),
    (88, '2024-09-22', 22, 11, 6, 2, 110),
    (89, '2024-09-25', 6, 18, 6, 1, 160),
    (90, '2024-09-01', 16, 8, 2, 1, 850),
    (91, '2024-09-04', 26, 15, 7, 1, 75),
    (92, '2024-09-07', 10, 4, 4, 2, 240),
    (93, '2024-09-10', 20, 12, 8, 3, 105),
    (94, '2024-09-13', 4, 1, 4, 2, 2400),
    (95, '2024-09-16', 14, 9, 7, 1, 220),
    (96, '2024-09-19', 24, 16, 2, 1, 210),
    (97, '2024-09-22', 8, 5, 2, 5, 650),
    (98, '2024-09-25', 18, 13, 4, 2, 160),
    (99, '2024-09-01', 2, 2, 2, 5, 140),
    (100, '2024-09-04', 12, 10, 6, 3, 144);

-- === SECCIÓN 3:VALIDACIÓN===
SELECT * FROM categorias;   
SELECT * FROM clientes;     
SELECT * FROM productos;    
SELECT * FROM ventas

UPDATE clientes
SET segmento = CASE
    WHEN id_cliente = 1 THEN 'Frecuente'
    WHEN id_cliente = 2 THEN 'Corporativo'
    WHEN id_cliente = 3 THEN 'Minorista'
    WHEN id_cliente = 4 THEN 'Minorista'
    WHEN id_cliente = 5 THEN 'Frecuente'
END
WHERE id_cliente BETWEEN 1 AND 5;