/*
SELECT name
FROM starsin, moviestar
WHERE starname=name AND movietitle='The Usual Suspects' AND gender='M'
*/


/*
SELECT DISTINCT starname
FROM starsin, movie
WHERE movieyear=1995 AND studioname='MGM'
*/


/*
SELECT DISTINCT name
FROM movie, movieexec
WHERE studioname='MGM' AND producerc#=cert#
*/


/*
WITH T AS
(
SELECT length
FROM movie
WHERE title='Star Wars'
)

SELECT title
FROM movie, T
WHERE movie.length>T.length
*/


/*
WITH T AS
(
SELECT networth AS networth_S
FROM movieexec
WHERE name='Stephen Spielberg'
)

SELECT name
FROM movieexec, T
WHERE networth>networth_S
*/


/*
WITH T AS
(
SELECT networth AS networth_S
FROM movieexec
WHERE name='Stephen Spielberg'
)

SELECT title
FROM movie, movieexec, T
WHERE producerc#=cert# AND networth>networth_S
*/




