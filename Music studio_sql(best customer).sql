Q5.  Who is the best customer? The customer who has spent the most money will be 
declared the best customer. Write a query that returns the person who has spent the 
most money?


SELECT TOP 1 
    dbo.customer.customer_id, 
    dbo.customer.first_name, 
    dbo.customer.last_name, 
    SUM(dbo.invoice.total) AS total
FROM dbo.customer
JOIN dbo.invoice ON dbo.customer.customer_id = dbo.invoice.customer_id
GROUP BY dbo.customer.customer_id, dbo.customer.first_name, dbo.customer.last_name
ORDER BY total DESC;