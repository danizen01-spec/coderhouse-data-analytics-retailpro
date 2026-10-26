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
(1, 'María López',  'maria@mail.com',  'Buenos Aires', 'Frecuente',   '2024-01-05'),
(2, 'Carlos Ruiz',  'carlos@mail.com', 'Córdoba',      'Corporativo', '2024-01-10'),
(3, 'Ana Gómez',    'ana@mail.com',    'Rosario',      'Minorista',   '2024-02-01'),
(4, 'Pedro Sanz',   'pedro@mail.com',  'Mendoza',      'Minorista',   '2024-02-15'),
(5, 'Laura Torres', 'laura@mail.com', 'Tucumán',      'Frecuente',   '2024-03-01');

  -- Tabla productos
INSERT INTO productos
(id_producto, nombre_producto, id_categoria, precio, costo, stock, activo)
VALUES
(1, 'Laptop Pro 15',      1, 1200.00, 900.00, 15, 1),
(2, 'Mouse Inalámbrico',  2,   28.00,  16.00, 80, 1),
(3, 'Monitor 4K 27',      1,  450.00, 320.00, 12, 1),
(4, 'Auriculares BT Pro', 3,  120.00,  75.00, 35, 1),
(5, 'SSD Externo 1TB',    4,  130.00,  85.00, 18, 1),
(6, 'Teclado Mecánico',   2,   95.00,  60.00, 40, 1);
 
 -- Tabla territorios
INSERT INTO territorios (id_territorio, region, pais, zona)
VALUES
(1, 'Buenos Aires', 'Argentina', 'Centro'),
(2, 'Córdoba', 'Argentina', 'Centro'),
(3, 'Santa Fe', 'Argentina', 'Centro'),
(4, 'Mendoza', 'Argentina', 'Cuyo'),
(5, 'Tucumán', 'Argentina', 'NOA');

-- Tabla ventas
INSERT INTO ventas
(id_venta, fecha_venta, id_cliente, id_producto,
 id_territorio, cantidad, total_venta)
VALUES
(1,  '2024-03-05', 1, 1, 1, 2, 2400.00),
(2,  '2024-03-06', 2, 2, 2, 5,  140.00),
(3,  '2024-03-07', 3, 3, 3, 1,  450.00),
(4,  '2024-03-08', 1, 4, 1, 2,  240.00),
(5,  '2024-03-10', 4, 5, 4, 3,  390.00),
(6,  '2024-03-11', 2, 6, 2, 4,  380.00),
(7,  '2024-03-12', 5, 1, 5, 1, 1200.00),
(8,  '2024-03-13', 3, 2, 3, 8,  224.00),
(9,  '2024-03-14', 4, 4, 4, 1,  120.00),
(10, '2024-03-15', 5, 3, 5, 2,  900.00);

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
