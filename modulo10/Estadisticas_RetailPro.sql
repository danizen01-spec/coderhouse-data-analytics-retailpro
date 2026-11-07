--MEDIANA VS. MEDIA (RETAILPRO)
USE Ventas_Tech_DB
SELECT * FROM ventas
SELECT DISTINCT
    AVG(total_venta) OVER () AS media,
    PERCENTILE_CONT(0.5)
        WITHIN GROUP (ORDER BY total_venta)
        OVER () AS mediana
FROM ventas

--OUTLIERS METODO IRQ
WITH q AS (
  SELECT DISTINCT
    PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY total_venta) OVER () AS q1,
    PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY total_venta) OVER () AS q3
  FROM ventas
)
SELECT
  q1, q3,
  (q3 - q1)          AS iqr,
  q1 - 1.5*(q3 - q1) AS limite_inferior,
  q3 + 1.5*(q3 - q1) AS limite_superior
FROM q;

--REGISTROS FUERA DE LOS LIMITES
WITH q AS (
  SELECT DISTINCT
    PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY total_venta) OVER () AS q1,
    PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY total_venta) OVER () AS q3
  FROM ventas
)
SELECT v.*
FROM ventas v, q
WHERE v.total_venta < q.q1 - 1.5*(q.q3 - q.q1)
   OR v.total_venta > q.q3 + 1.5*(q.q3 - q.q1); 