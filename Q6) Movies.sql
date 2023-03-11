--1
/*
SELECT title, year, length
FROM movie
WHERE year<2000 AND (length>120 OR length IS NULL)
*/


--2
/*
SELECT name, gender
FROM moviestar
WHERE name LIKE 'J%' AND birthdate>'1949-01-01'
ORDER BY name DESC
*/


--3
/*
SELECT studioname, COUNT(DISTINCT starname) AS num_actors
FROM movie m JOIN starsin s
ON m.title=s.movietitle
GROUP BY studioname
*/


--4
/*
SELECT starname, COUNT(movietitle) AS num_movies
FROM starsin
GROUP BY starname
*/


--5
/*
SELECT studioname, title, year
FROM movie m1
WHERE year>=ALL(SELECT year
				FROM movie m2
				WHERE m1.studioname=m2.studioname)
ORDER BY m1.studioname DESC
*/


--6
/*
SELECT name
FROM moviestar m
WHERE m.gender='M' AND m.birthdate>=ALL(SELECT birthdate
										FROM moviestar m2
										WHERE m2.gender='M')
*/


--7
/*
WITH T AS
(
SELECT starname, COUNT(movietitle) AS num_movies
FROM starsin
GROUP BY starname
HAVING COUNT(movietitle)>=ALL(SELECT COUNT(movietitle)
							  FROM starsin
							  GROUP BY starname)
),
M AS
(
SELECT title AS movietitle, studioname AS studio
FROM movie
)
SELECT DISTINCT m.studio, T.starname, T.num_movies
FROM T t JOIN starsin s
ON T.starname=s.starname
JOIN M m
ON m.movietitle=s.movietitle
*/


--8
/*
SELECT movietitle, movieyear, COUNT(starname) AS num_actors
FROM starsin
GROUP BY movietitle, movieyear
HAVING COUNT(starname)>2
*/