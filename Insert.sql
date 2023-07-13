-- Вставка записей в таблицу Genres
INSERT INTO Genres (name)
VALUES
  ('Heavy Metal'),
  ('Thrash Metal'),
  ('Power Metal');

-- Вставка записей в таблицу Artists
INSERT INTO Artists (name)
VALUES
  ('Iron Maiden'),
  ('Metallica'),
  ('Helloween'),
  ('Slayer'),
  ('Dream Theater'),
  ('Pearl Jam');

-- Вставка записей в таблицу ArtistGenres
INSERT INTO ArtistGenres (artist_id, genre_id)
VALUES
  (1, 1),
  (2, 1),
  (3, 2),
  (3, 3),
  (4, 2),
  (5, 1),
  (5, 3),
  (6, 2);

-- Вставка записей в таблицу Albums
INSERT INTO Albums (title, year)
VALUES
  ('The Number of the Beast', 1982),
  ('Master of Puppets', 1986),
  ('Keeper of the Seven Keys Part II', 1988),
  ('Reign in Blood', 1986),
  ('Metropolis Pt. 2: Scenes from a Memory', 1999),
  ('Ten', 1991),
  ('The Book of Souls', 2015),
  ('Hardwired... to Self-Destruct', 2016),
  ('Pumpkins United', 2017),
  ('Repentless', 2015),
  ('Distance Over Time', 2019),
  ('Gigaton', 2020);


-- Вставка записей в таблицу Tracks
INSERT INTO Tracks (title, duration, album_id)
VALUES
  ('Hallowed Be Thy Name', 420, 1),
  ('Battery', 312, 2),
  ('Eagle Fly Free', 370, 3),
  ('Angel of Death', 292, 4),
  ('The Dance of Eternity', 397, 5),
  ('Alive', 323, 6),
  ('My Favorite Song', 250, 1),
  ('Another Track of Mine', 300, 2),
  ('Track with "my" in Title', 180, 3),
  ('Speed of Light', 391, 7),
  ('Atlas, Rise!', 387, 8),
  ('Pumpkins United', 774, 9),
  ('Repentless', 225, 10),
  ('Untethered Angel', 346, 11),
  ('Dance of the Clairvoyants', 267, 12);

-- Вставка записей в таблицу Collections
INSERT INTO Collections (title, year)
VALUES
  ('Best of Metal', 2000),
  ('Metallica Hits', 2010),
  ('Classic Metal', 1995),
  ('Thrash Metal Anthems', 2015),
  ('My Collection 2019', 2019),
  ('Collection with "my" Tracks', 2020),
  ('Best of My Songs', 2022);

-- Вставка записей в таблицу CollectionTracks
INSERT INTO CollectionTracks (collection_id, track_id)
VALUES
  (1, 1),
  (2, 2),
  (1, 3),
  (2, 4),
  (3, 5),
  (4, 6),
  (5, 7),
  (6, 8),
  (7, 9),
  (5, 10),
  (6, 11),
  (7, 12);





