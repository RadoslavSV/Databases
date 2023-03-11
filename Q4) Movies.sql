--1
/*
WITH T AS
(
SELECT cert#
FROM movieexec e JOIN movie m
ON e.cert#=m.producerc#
WHERE m.title='Star Wars'
)

SELECT title, name
FROM movieexec e JOIN movie m
ON e.cert#=m.producerc#
JOIN T t
ON t.cert#=e.cert#
*/


--2
/*
WITH T AS
(
SELECT movietitle
FROM starsin
WHERE starname='Harrison Ford'
)

SELECT DISTINCT name
FROM movieexec e JOIN movie m
ON e.cert#=m.producerc#
JOIN T t
ON t.movietitle=m.title
*/


--3
/*
SELECT DISTINCT studioname AS name, starname
FROM starsin s JOIN movie m
ON s.movietitle=m.title
ORDER BY name
*/


--4
/*
WITH T AS
(
SELECT name, networth
FROM movieexec e1
WHERE networth>=ALL(SELECT networth
					FROM movieexec)
)

SELECT s.starname, t.networth, m.title
FROM movieexec e JOIN movie m
ON e.cert#=m.producerc#
JOIN T t
ON e.name=t.name
JOIN starsin s
ON m.title=s.movietitle
*/


--5
/*
SELECT m.name, s.movietitle
FROM moviestar m LEFT JOIN starsin s
ON m.name=s.starname
WHERE s.movietitle IS NULL
*/