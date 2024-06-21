Q9. Find how much amount spent by each customer on artists? Write a query to return customer name, artist name and total spent?

WITH best_selling_artist AS (
    SELECT TOP 1 
        a.artist_id, 
        a.name AS artist_name,
        SUM(il.unit_price * il.quantity) AS total_sales
    FROM dbo.invoice_line il
    JOIN dbo.track t ON t.track_id = il.track_id
    JOIN dbo.album al ON al.album_id = t.album_id
    JOIN dbo.artist a ON a.artist_id = al.artist_id
    GROUP BY a.artist_id, a.name
    ORDER BY total_sales DESC
)
SELECT 
    c.customer_id, 
    c.first_name, 
    c.last_name, 
    bsa.artist_name,
    SUM(il.unit_price * il.quantity) AS amount_spent
FROM dbo.invoice i
JOIN dbo.customer c ON c.customer_id = i.customer_id
JOIN dbo.invoice_line il ON il.invoice_id = i.invoice_id
JOIN dbo.track t ON t.track_id = il.track_id
JOIN dbo.album al ON al.album_id = t.album_id
JOIN dbo.artist a ON a.artist_id = al.artist_id
CROSS JOIN best_selling_artist bsa
WHERE a.artist_id = bsa.artist_id
GROUP BY c.customer_id, c.first_name, c.last_name, bsa.artist_name
ORDER BY amount_spent DESC;