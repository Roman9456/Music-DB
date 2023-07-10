
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
WHERE title ~* '(^|\W)(my|мой)(\W|$)';

--Согласно замечаниям, но у меня он не срабатывает потому что видимо есть кавычки...не стал обходить этот момент, поэтому применил решение выше.
SELECT title
FROM Tracks
WHERE string_to_array(lower(title), ' ') && ARRAY['my', 'мой'];

--Количество исполнителей в каждом жанре:
SELECT Genres.name AS genre, COUNT(ArtistGenres.artist_id) AS artist_count
FROM Genres
LEFT JOIN ArtistGenres ON Genres.genre_id = ArtistGenres.genre_id
GROUP BY Genres.genre_id, Genres.name;


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



---Все исполнители, которые не выпустили альбомы в 2020 году:
SELECT Artists.name
FROM Artists
LEFT JOIN AlbumArtists ON Artists.artist_id = AlbumArtists.artist_id
LEFT JOIN Albums ON AlbumArtists.album_id = Albums.album_id
WHERE Albums.year <> 2020 OR Albums.year IS NULL;


--Названия сборников, в которых присутствует конкретный исполнитель(Iron maiden)
SELECT Collections.title
FROM Collections
JOIN CollectionTracks ON Collections.collection_id = CollectionTracks.collection_id
JOIN Tracks ON CollectionTracks.track_id = Tracks.track_id
JOIN Albums ON Tracks.album_id = Albums.album_id
JOIN AlbumArtists ON Albums.album_id = AlbumArtists.album_id
JOIN Artists ON AlbumArtists.artist_id = Artists.artist_id
WHERE Artists.name = 'Iron Maiden';


--Названия альбомов, в которых присутствуют исполнители более чем одного жанра
SELECT DISTINCT Albums.title
FROM Albums
JOIN AlbumArtists ON Albums.album_id = AlbumArtists.album_id
JOIN Artists ON AlbumArtists.artist_id = Artists.artist_id
JOIN ArtistGenres ON Artists.artist_id = ArtistGenres.artist_id
GROUP BY Albums.title, ArtistGenres.artist_id
HAVING COUNT(DISTINCT ArtistGenres.genre_id) > 1;



--Наименования треков, которые не входят в сборники
SELECT t.title AS track
FROM Tracks t
LEFT JOIN CollectionTracks ct ON ct.track_id = t.track_id
WHERE ct.collection_id IS NULL; 

--Исполнитель или исполнители, написавшие самый короткий по продолжительности трек
SELECT Artists.name AS artist
FROM Tracks
JOIN Albums ON Albums.album_id = Tracks.album_id
JOIN Artists ON Artists.artist_id = Albums.artist_id
WHERE Tracks.duration = (
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








