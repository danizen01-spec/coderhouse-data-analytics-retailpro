-- ══════════════════════════════════════════
-- Autor: Daniel Zenteno Novosel
-- Fecha: 24/10/2026
-- ══════════════════════════════════════════USE Ventas_Tech_DB
-- === Consulta 1:RESUMEN EJECUTIVO MENSUAL===

SELECT SUM (quantity * unit_price) AS total_facturado, 
MONTH(order_date) AS Mes,
COUNT(*) AS Cantidad_pedidos,
AVG(quantity * unit_price) AS ticket_promedio
FROM sales
GROUP BY MONTH(order_date);

-- === Consulta 2: RANKING DE PRODUCTOS===
SELECT TOP 5 product_id, SUM(total_amount) AS total_producto 
FROM sales
GROUP BY product_id
ORDER BY total_producto DESC;

-- === Consulta 3: CLIENTES RECURRENTES===
SELECT customer_id, SUM(total_amount) AS total_gastado, COUNT(*) AS cantidad_pedidos
FROM sales
GROUP BY customer_id
HAVING COUNT(*) > 1;

--=== Consulta 4: MESES POR ENCIMA/DEBAJO DEL PROMEDIO===
WITH ventas_mensuales AS (
SELECT
    MONTH(order_date) AS mes,
    SUM(total_amount) AS total_facturado
FROM sales
GROUP BY MONTH(order_date)
)
SELECT mes, total_facturado,
CASE WHEN total_facturado > (SELECT AVG(total_facturado) FROM ventas_mensuales) THEN 'Por encima'
ELSE 'Por debajo' END AS estado_promedio
FROM ventas_mensuales
ORDER BY mes;

-- HALLAZGO 1: El producto 301 (Laptop Pro 15) generó $3.600, 
--representando aproximadamente el 54,5% de toda la facturación trimestral a pesar de registrar solo 2 pedidos.

-- HALLAZGO 2: El cliente 201 gastó $2.685 en apenas 2 pedidos, concentrando aproximadamente el 40,6% de la facturación total del trimestre.

---- HALLAZGO 3: Enero concentró aproximadamente el 49,6% de la facturación trimestral
--,febrero representó el 27,6%, mientras que marzo representó apenas el 22,8%, evidenciando una disminución progresiva de los ingresos mensuales.