**Задание 2**

** Название и продолжительность самого длительного трека.

select name_, duration from tracks
WHERE duration = (SELECT MAX(duration) FROM tracks);

** Название треков, продолжительность которых не менее 3,5 минут.

select name_ from tracks
where duration > '00:03:30';

** Названия сборников, вышедших в период с 2018 по 2020 год включительно.

select name_ from collections c 
where release_year > 2017 and release_year < 2021;

** Исполнители, чьё имя состоит из одного слова.

select name_ from artists
WHERE (LENGTH(name_) - LENGTH(replace(name_, ' ', ''))) = 0;

** Название треков, которые содержат слово «мой» или «my».

select name_ from tracks t 
where name_ like '%my%';

**Задание 3**

** Количество исполнителей в каждом жанре.

select genres.name_, count(ag.artist_id) FROM genres
LEFT JOIN artists_genres ag ON genres.genre_id = ag.genre_id
LEFT join artists a on ag.artist_id = a.artist_id 
GROUP BY genres.name_ 

** Количество треков, вошедших в альбомы 2019–2020 годов.

SELECT albums.name_, COUNT(tracks.track_id) from albums
LEFT JOIN tracks ON tracks.album_id = albums.album_id
WHERE albums.release_year > 2018 and albums.release_year < 2021
GROUP BY albums.name_ 

** Средняя продолжительность треков по каждому альбому.

SELECT albums.name_, AVG(duration) FROM albums
LEFT JOIN tracks on tracks.album_id = albums.album_id
GROUP BY albums.name_
ORDER BY AVG(duration) DESC;

** Все исполнители, которые не выпустили альбомы в 2020 году.

select name from artists ar
where name not in (select ar.name from artists ar
join albumsartists aa on ar.id = aa.artist_id
join albums al on aa.album_id = al.id
where al.year_of_release = 2020);

