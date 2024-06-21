Q2. Which country has most invoices?


SELECT COUNT(*) as c, billing_country 
FROM [dbo].[invoice]
GROUP BY billing_country
ORDER BY c DESC