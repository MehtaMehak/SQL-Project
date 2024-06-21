Q8.  Return all the track names that have a song length longer than the average song length. 
Return the Name and Milliseconds for each track. Order by the song length with the 
longest songs listed first?




SELECT name, milliseconds
FROM dbo.track
WHERE milliseconds > (
    SELECT AVG(milliseconds)
    FROM dbo.track
)
ORDER BY milliseconds DESC;
