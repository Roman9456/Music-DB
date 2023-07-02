-- Создание таблицы Genres
CREATE TABLE IF NOT EXISTS Genres (
  genre_id SERIAL PRIMARY KEY,
  name VARCHAR(255) UNIQUE
);

-- Создание таблицы Artists
CREATE TABLE IF NOT EXISTS Artists (
  artist_id SERIAL PRIMARY KEY,
  name VARCHAR(255) UNIQUE
);

-- Создание таблицы ArtistGenres
CREATE TABLE IF NOT EXISTS ArtistGenres (
  artist_id INTEGER REFERENCES Artists(artist_id),
  genre_id INTEGER REFERENCES Genres(genre_id),
  PRIMARY KEY (artist_id, genre_id)
);

-- Создание таблицы Albums
CREATE TABLE IF NOT EXISTS Albums (
  album_id SERIAL PRIMARY KEY,
  title VARCHAR(255) UNIQUE,
  year INTEGER CHECK (year >= 1900),
  artist_id INTEGER REFERENCES Artists(artist_id)
);

-- Создание таблицы Tracks
CREATE TABLE IF NOT EXISTS Tracks (
  track_id SERIAL PRIMARY KEY,
  title VARCHAR(255) UNIQUE,
  duration INTEGER CHECK (duration > 0),
  album_id INTEGER REFERENCES Albums(album_id)
);

-- Создание таблицы Collections
CREATE TABLE IF NOT EXISTS Collections (
  collection_id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  year INTEGER CHECK (year >= 1900),
  CONSTRAINT unique_collection_title UNIQUE (title)
);

-- Создание таблицы CollectionTracks
CREATE TABLE IF NOT EXISTS CollectionTracks (
  collection_id INTEGER REFERENCES Collections(collection_id),
  track_id INTEGER REFERENCES Tracks(track_id),
  PRIMARY KEY (collection_id, track_id)