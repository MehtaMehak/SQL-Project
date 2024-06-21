Q7. Let's invite the artists who have written the most rock music in our dataset. Write a 
query that returns the Artist name and total track count of the top 10 rock bands?


SELECT TOP 10 
    dbo.artist.artist_id, 
    dbo.artist.name, 
    COUNT(dbo.track.track_id) AS [number of songs]
FROM dbo.track
JOIN dbo.album ON dbo.track.album_id = dbo.album.album_id
JOIN dbo.artist ON dbo.album.artist_id = dbo.artist.artist_id
JOIN dbo.genre ON dbo.track.genre_id = dbo.genre.genre_id
WHERE dbo.genre.name = 'ROCK'
GROUP BY dbo.artist.artist_id, dbo.artist.name
ORDER BY [number of songs] DESC;