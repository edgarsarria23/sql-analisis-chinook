-- Consulta 7: Ranking de clientes por gasto dentro de cada país
-- Usa un CTE para calcular el gasto total por cliente, y luego una window function
-- (RANK) para ordenar a los clientes DENTRO de cada país por su gasto
WITH gasto_cliente AS (
    SELECT c.CustomerId, c.Country, c.FirstName, c.LastName,
           SUM(i.Total) AS gasto_total
    FROM chinook.Customer c
    JOIN chinook.Invoice i ON c.CustomerId = i.CustomerId
    GROUP BY c.CustomerId, c.Country, c.FirstName, c.LastName
)
SELECT *,
       RANK() OVER (PARTITION BY Country ORDER BY gasto_total DESC) AS ranking_en_su_pais
FROM gasto_cliente
ORDER BY Country, ranking_en_su_pais;

-- Consulta 8: Ingresos mensuales acumulados (running total)
-- Usa un CTE para agrupar ingresos por mes, y una window function (SUM() OVER)
-- para calcular el acumulado progresivo mes a mes
WITH ingresos_mes AS (
    SELECT DATE_TRUNC('month', InvoiceDate) AS mes, SUM(Total) AS ingresos
    FROM chinook.Invoice
    GROUP BY mes
)
SELECT mes, ingresos,
       SUM(ingresos) OVER (ORDER BY mes) AS ingresos_acumulados
FROM ingresos_mes
ORDER BY mes;