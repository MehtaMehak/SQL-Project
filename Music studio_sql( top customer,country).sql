Q11. Write a query that determines the customer that has spent the most on music for each 
country. Write a query that returns the country along with the top customer and how
much they spent. For countries where the top amount spent is shared, provide all 
customers who spent this amount?

WITH CustomerSpendingByCountry AS (
    SELECT 
        c.customer_id,
        c.first_name,
        c.last_name,
        i.billing_country,
        SUM(i.total) AS total_spending,
        ROW_NUMBER() OVER (
            PARTITION BY i.billing_country 
            ORDER BY SUM(i.total) DESC
        ) AS RowNo
    FROM dbo.invoice AS i
    INNER JOIN dbo.customer AS c ON c.customer_id = i.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name, i.billing_country
)
SELECT *
FROM CustomerSpendingByCountry
WHERE RowNo = 1
ORDER BY billing_country ASC, total_spending DESC;