Q6. Write query to return the email, first name, last name, & Genre of all Rock Music 
listeners. Return your list ordered alphabetically by email starting with A?




SELECT DISTINCT email, first_name, last_name
FROM dbo.customer
JOIN dbo.invoice ON dbo.customer.customer_id = dbo.invoice.customer_id
JOIN dbo.invoice_line ON dbo.invoice.invoice_id = dbo.invoice_line.invoice_id
WHERE track_id IN (
                    SELECT track_id from dbo.track
                    JOIN dbo.genre ON dbo.track.genre_id = dbo.genre.genre_id
                    WHERE dbo.genre.name LIKE 'ROCK'
					)
ORDER BY email;
