
--Название и продолжительность самого длительного трека:
SELECT title, duration
FROM Tracks
WHERE duration = (SELECT MAX(duration) FROM Tracks); 

--Название треков, продолжительность которых не менее 3,5 минут:
SELECT title
FROM Tracks
WHERE duration >= 210;

--Названия сборников, вышедших в период с 2018 по 2020 год включительно:
SELECT title
FROM Collections
WHERE year BETWEEN 2018 AND 2020; 


--Исполнители, чьё имя состоит из одного слова:
SELECT name
FROM Artists
WHERE name NOT LIKE '% %'; 

--Название треков, которые содержат слово «мой» или «my»: 
SELECT title
FROM Tracks
WHERE title ILIKE '%мой%' OR title ILIKE '%my%'; 


--Количество исполнителей в каждом жанре:
SELECT g.name AS genre, COUNT(*) AS artist_count
FROM Genres g
JOIN Artists a ON a.genre_id = g.genre_id
GROUP BY g.name; 

--Количество треков, вошедших в альбомы 2019–2020 годов:
SELECT COUNT(*) AS track_count
FROM Tracks t
JOIN Albums a ON a.album_id = t.album_id
WHERE a.year BETWEEN 2019 AND 2020; 


--Средняя продолжительность треков по каждому альбому:
SELECT a.title AS album, AVG(t.duration) AS avg_duration
FROM Albums a
JOIN Tracks t ON t.album_id = a.album_id
GROUP BY a.title; 

--Все исполнители, которые не выпустили альбомы в 2020 году:
SELECT name
FROM Artists
WHERE artist_id NOT IN (
  SELECT DISTINCT artist_id
  FROM Albums
  WHERE year = 2020
);

--Названия сборников, в которых присутствует конкретный исполнитель(Iron maiden) :
SELECT c.title AS collection
FROM Collections c
JOIN CollectionTracks ct ON ct.collection_id = c.collection_id
JOIN Tracks t ON t.track_id = ct.track_id
JOIN Albums a ON a.album_id = t.album_id
JOIN Artists ar ON ar.artist_id = a.artist_id
WHERE ar.name = 'Iron Maiden'; 


--Названия альбомов, в которых присутствуют исполнители более чем одного жанра
SELECT DISTINCT a.title AS album
FROM Albums a
JOIN Artists ar ON ar.artist_id = a.artist_id
JOIN ArtistGenres ag ON ag.artist_id = ar.artist_id
GROUP BY a.album_id
HAVING COUNT(DISTINCT ag.genre_id) > 1;




--Наименования треков, которые не входят в сборники
SELECT t.title AS track
FROM Tracks t
LEFT JOIN CollectionTracks ct ON ct.track_id = t.track_id
WHERE ct.collection_id IS NULL; 

--Исполнитель или исполнители, написавшие самый короткий по продолжительности трек
SELECT ar.name AS artist
FROM Tracks t
JOIN Albums a ON a.album_id = t.album_id
JOIN Artists ar ON ar.artist_id = a.artist_id
WHERE t.duration = (
  SELECT MIN(duration)
  FROM Tracks
); 

--Названия альбомов, содержащих наименьшее количество треков:
SELECT a.title AS album
FROM Albums a
JOIN (
  SELECT album_id, COUNT(*) AS track_count
  FROM Tracks
  GROUP BY album_id
) track_counts ON track_counts.album_id = a.album_id
WHERE track_counts.track_count = (
  SELECT MIN(track_count)
  FROM (
    SELECT COUNT(*) AS track_count
    FROM Tracks
    GROUP BY album_id
  ) counts
);








