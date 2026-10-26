-- === CONSULTA 1: VISTA BASE ===
--Propósito: consolidar la información de ventas, clientes, productos y categorías en una sola consulta.
SELECT v.id_cliente,
       t.region,
       v.fecha_venta,       
       p.id_producto,     
       p.nombre_producto,
       v.cantidad,
       c.segmento AS tipo,
       ca.nombre_categoria,
       p.precio AS precio_unitario,       
       v.total_venta    
FROM ventas AS v
JOIN clientes AS c ON v.id_cliente = c.id_cliente
JOIN productos AS p ON v.id_producto = p.id_producto
JOIN categorias AS ca ON p.id_categoria = ca.id_categoria
JOIN territorios AS t ON v.id_territorio = t.id_territorio;

-- Hallazgo: Se registraron 100 operaciones comerciales entre enero y septiembre
-- de 2024, que permiten analizar las compras por cliente, producto y categoría.


-- === CONSULTA 2 = CLIENTES SIN VENTAS===
-- Propósito: identificar clientes registrados que todavía no realizaron ninguna compra.

SELECT c.nombre,
       c.email,
       c.fecha_registro
FROM clientes AS c
LEFT JOIN ventas AS v ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL;

-- Hallazgo: 4 de los 30 clientes registrados nunca realizaron una compra.
-- El área de CRM podría implementar campañas para incentivar su primera compra.


-- === CONSULTA 3 = PRODUCTOS SIN VENTAS===
-- Propósito: identificar productos del catálogo que todavía no registraron ventas

SELECT p.nombre_producto,
       ca.nombre_categoria,
       p.precio AS precio_unitario
FROM productos AS p
LEFT JOIN ventas AS v ON p.id_producto = v.id_producto
JOIN categorias AS ca ON p.id_categoria = ca.id_categoria
WHERE v.id_venta IS NULL;

-- Hallazgo: 3 de los 20 productos del catálogo no registran ventas, los 3 son de la misma categoría.
-- El área de Producto podría revisar su demanda y evaluar acciones comerciales.

-- === CONSULTA 4 = CONSOLIDADO MENSUAL===

-- Propósito: consolidar las ventas del último trimestre (Julio, Agosto, Septiembre) para comparar la facturación mensual.
SELECT canal, SUM(total) AS total_mensual
FROM (
    SELECT v.fecha_venta, v.cantidad * p.precio AS total, 'Julio' AS canal
    FROM ventas AS v
    JOIN productos AS p ON p.id_producto = v.id_producto
    WHERE fecha_venta >= '2024-07-01'
  AND fecha_venta < '2024-08-01'
    UNION ALL
    SELECT v.fecha_venta, v.cantidad * p.precio AS total, 'Agosto' AS canal
    FROM ventas AS v
    JOIN productos AS p ON p.id_producto = v.id_producto
    WHERE fecha_venta >= '2024-08-01'
  AND fecha_venta < '2024-09-01'
  UNION ALL
  SELECT v.fecha_venta, v.cantidad * p.precio AS total, 'Septiembre' AS canal
    FROM ventas AS v
    JOIN productos AS p ON p.id_producto = v.id_producto
    WHERE fecha_venta >= '2024-09-01'
  AND fecha_venta < '2024-10-01'
) AS consolidado
GROUP BY canal;

-- Hallazgo: Septiembre registró la mayor facturación del trimestre (7714), seguido de agosto (7643) y julio (2859),
-- evidenciando una recuperación de las ventas después de julio.








