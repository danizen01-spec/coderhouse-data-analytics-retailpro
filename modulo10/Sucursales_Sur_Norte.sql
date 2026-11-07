--USO BASE DE DATOS
USE Ventas_Tech_DB

--REPETIBILIDAD
DROP TABLE IF EXISTS ventas_semana

--CREACION DE TABLA PROVISIONAL
CREATE TABLE ventas_semana (
sucursal VARCHAR (20),
venta DECIMAL (10,2)
);

INSERT INTO ventas_semana (sucursal, venta)
VALUES
('Norte', 500), 
('Norte', 510),
('Norte', 490),
('Norte', 505),
('Norte', 495),
('Sur', 100), 
('Sur', 900),
('Sur', 50),
('Sur', 1200),
('Sur', 250);

--CODIGO DE CONSULTA
SELECT * FROM ventas_semana;

--MEDIA Y RANGO
SELECT
  sucursal,
  AVG(venta)              AS media,
  MAX(venta) - MIN(venta) AS rango
FROM ventas_semana
GROUP BY sucursal;

--DESVÍO ESTÁNDAR
SELECT
  sucursal,
  STDEV(venta) AS desvio_muestral
FROM ventas_semana
GROUP BY sucursal;
