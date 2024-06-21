Q10. We want to find out the most popular music Genre for each country. We determine the 
most popular genre as the genre with the highest amount of purchases. Write a query 
that returns each country along with the top Genre. For countries where the maximum 
number of purchases is shared return all Genres?

WITH popular_genre AS 
(
  SELECT 
    COUNT(il.quantity) AS purchases,
    c.country,
    g.name AS genre_name,
    g.genre_id,
    ROW_NUMBER() OVER(PARTITION BY c.country ORDER BY COUNT(il.quantity) DESC) AS RowNo
  FROM 
    dbo.invoice_line AS il
  JOIN 
    dbo.invoice AS i ON i.invoice_id = il.invoice_id
  JOIN 
    dbo.customer AS c ON c.customer_id = i.customer_id
  JOIN 
    dbo.track AS t ON t.track_id = il.track_id
  JOIN 
    dbo.genre AS g ON g.genre_id = t.genre_id
  GROUP BY 
    c.country, g.name, g.genre_id
)
SELECT 
  country,
  genre_name,
  genre_id,
  purchases
FROM 
  popular_genre 
WHERE 
  RowNo = 1
ORDER BY 
  country;