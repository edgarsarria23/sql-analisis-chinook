-- Ingresos totales por país (uniendo clientes con facturas)
SELECT c.Country, ROUND(SUM(i.Total), 2) AS ingresos_totales
FROM chinook.Customer c
JOIN chinook.Invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.Country
ORDER BY ingresos_totales DESC;

-- Los 10 artistas cuyos álbumes generan más ingresos
SELECT ar.Name AS artista, ROUND(SUM(ii.UnitPrice * ii.Quantity), 2) AS ingresos
FROM chinook.InvoiceLine ii
JOIN chinook.Track t ON ii.TrackId = t.TrackId
JOIN chinook.Album al ON t.AlbumId = al.AlbumId
JOIN chinook.Artist ar ON al.ArtistId = ar.ArtistId
GROUP BY ar.Name
ORDER BY ingresos DESC
LIMIT 10;