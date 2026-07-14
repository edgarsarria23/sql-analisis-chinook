-- Consulta 5: Clientes con gasto por encima de la media
-- Objetivo de negocio: identificar clientes de alto valor (VIP)
SELECT CustomerId, ROUND(SUM(Total), 2) AS gasto_total
FROM chinook.Invoice
GROUP BY CustomerId
HAVING SUM(Total) > (
    SELECT AVG(gasto_por_cliente)
    FROM (
        SELECT SUM(Total) AS gasto_por_cliente
        FROM chinook.Invoice
        GROUP BY CustomerId
    )
)
ORDER BY gasto_total DESC;

-- Consulta 6: Canciones más caras que el precio medio de su propio álbum
-- Subconsulta correlacionada: compara cada canción contra la media de SU álbum, no la media global
SELECT t.Name AS cancion, t.AlbumId, t.UnitPrice
FROM chinook.Track t
WHERE t.UnitPrice > (
    SELECT AVG(UnitPrice)
    FROM chinook.Track
    WHERE AlbumId = t.AlbumId
)
LIMIT 15;