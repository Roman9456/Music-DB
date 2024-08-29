# Music Database

## English

### Description
This project is a part of a music database management system. It includes the following tables:

1. Genres: Stores the different music genres.
2. Artists: Stores the artists and their corresponding genre(s).
3. Albums: Stores the album details, including the title and year.
4. Tracks: Stores the track details, including the title, duration, and the associated album.
5. Collections: Stores the details of music collections, including the title and year.
6. ArtistGenres: Associates artists with their corresponding genres.
7. AlbumArtists: Associates albums with their corresponding artists.
8. CollectionTracks: Associates tracks with their respective collections.

The script also includes sample data insertions for each table.

### Features
- The Genres, Artists, Albums, Tracks, and Collections tables store the primary data.
- The ArtistGenres, AlbumArtists, and CollectionTracks tables are join tables for the many-to-many relationships.
- The Albums table has a check constraint on the year column.
- The Tracks table has a check constraint on the duration column and a unique constraint on the title column.
- The Collections table has a unique constraint on the title column and a check constraint on the year column.

### Usage
This database schema can be used to store and manage music-related data, including genres, artists, albums, tracks, and music collections. The provided sample data can be used as a starting point for further development and analysis.

## Russian

### Описание
Этот проект является частью системы управления музыкальной базой данных. Он включает в себя следующие таблицы:

1. Genres: Хранит различные музыкальные жанры.
2. Artists: Хранит информацию об артистах и соответствующих им жанрах.
3. Albums: Хранит информацию об альбомах, включая название и год.
4. Tracks: Хранит информацию о треках, включая название, длительность и связанный альбом.
5. Collections: Хранит информацию о музыкальных коллекциях, включая название и год.
6. ArtistGenres: Связывает артистов с соответствующими им жанрами.
7. AlbumArtists: Связывает альбомы с соответствующими им артистами.
8. CollectionTracks: Связывает треки с их соответствующими коллекциями.

Скрипт также включает примеры вставки данных для каждой таблицы.

### Возможности
- Таблицы Genres, Artists, Albums, Tracks и Collections хранят основные данные.
- Таблицы ArtistGenres, AlbumArtists и CollectionTracks являются таблицами связи для многие-ко-многим отношений.
- Таблица Albums имеет ограничение на проверку значения year.
- Таблица Tracks имеет ограничение на проверку значения duration и уникальное ограничение на поле title.
- Таблица Collections имеет уникальное ограничение на поле title и ограничение на проверку значения year.

### Использование
Эта схема базы данных может быть использована для хранения и управления музыкальными данными, включая жанры, артистов, альбомы, треки и музыкальные коллекции. Предоставленные примеры данных могут быть использованы в качестве отправной точки для дальнейшей разработки и анализа.
