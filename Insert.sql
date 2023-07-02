-- Вставка записей в таблицы Genres, Artists, ArtistGenres, Albums, Tracks
INSERT INTO Genres (name)
SELECT * FROM (VALUES
  ('Heavy Metal'),
  ('Thrash Metal'),
  ('Power Metal')
) AS g(name)
WHERE NOT EXISTS (SELECT 1 FROM Genres WHERE name = g.name);

INSERT INTO Artists (name)
SELECT * FROM (VALUES
  ('Iron Maiden'),
  ('Metallica'),
  ('Helloween'),
  ('Slayer'),
  ('Dream Theater'),
  ('Pearl Jam')
) AS a(name)
WHERE NOT EXISTS (SELECT 1 FROM Artists WHERE name = a.name);

INSERT INTO ArtistGenres (artist_id, genre_id)
SELECT * FROM (VALUES
  (1, 1),
  (2, 1),
  (3, 2),
  (3, 3),
  (4, 2),
  (5, 1),
  (5, 3),
  (6, 2)
) AS ag(artist_id, genre_id)
WHERE NOT EXISTS (SELECT 1 FROM ArtistGenres WHERE artist_id = ag.artist_id AND genre_id = ag.genre_id);

INSERT INTO Albums (title, year, artist_id)
SELECT * FROM (VALUES
  ('The Number of the Beast', 1982, 1),
  ('Master of Puppets', 1986, 2),
  ('Keeper of the Seven Keys Part II', 1988, 3),
  ('Reign in Blood', 1986, 4),
  ('Metropolis Pt. 2: Scenes from a Memory', 1999, 5),
  ('Ten', 1991, 6)
) AS al(title, year, artist_id)
WHERE NOT EXISTS (SELECT 1 FROM Albums WHERE title = al.title);

INSERT INTO Tracks (title, duration, album_id)
SELECT * FROM (VALUES
  ('Hallowed Be Thy Name', 420, 1),
  ('Battery', 312, 2),
  ('Eagle Fly Free', 370, 3),
  ('Angel of Death', 292, 4),
  ('The Dance of Eternity', 397, 5),
  ('Alive', 323, 6),
  ('My Favorite Song', 250, 1),
  ('Another Track of Mine', 300, 2),
  ('Track with "my" in Title', 180, 3)
) AS t(title, duration, album_id)
WHERE NOT EXISTS (SELECT 1 FROM Tracks WHERE title = t.title);

-- Вставка записей в таблицы Collections и CollectionTracks
INSERT INTO Collections (title, year)
SELECT * FROM (VALUES
  ('Best of Metal', 2000),
  ('Metallica Hits', 2010),
  ('Classic Metal', 1995),
  ('Thrash Metal Anthems', 2015),
  ('My Collection 2019', 2019),
  ('Collection with "my" Tracks', 2020),
  ('Best of My Songs', 2022)
) AS c(title, year)
WHERE NOT EXISTS (SELECT 1 FROM Collections WHERE title = c.title);

INSERT INTO CollectionTracks (collection_id, track_id)
SELECT * FROM (VALUES
  (1, 1),
  (2, 2),
  (1, 3),
  (2, 4),
  (3, 5),
  (4, 6)
) AS ct(collection_id, track_id)
WHERE NOT EXISTS (SELECT 1 FROM CollectionTracks WHERE collection_id = ct.collection_id AND track_id = ct.track_id);
