-- Total de clientes por país
SELECT Country, COUNT(*) AS total_clientes
FROM chinook.Customer
GROUP BY Country
ORDER BY total_clientes DESC;