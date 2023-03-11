--1
/*
SELECT COUNT(DISTINCT class) AS NO_Classes
FROM classes
WHERE type='bb'
*/


--2
/*
SELECT class, AVG(numguns) AS avgGuns
FROM classes
WHERE type='bb'
GROUP BY class
*/


--3
/*
SELECT AVG(numguns) AS avgGuns
FROM classes
WHERE type='bb'
*/


--4
/*
SELECT classes.class, MIN(launched) AS FirstYear, MAX(launched) AS LastYear
FROM ships, classes
WHERE ships.class=classes.class
GROUP BY classes.class
*/


--5
/*
SELECT s.class, COUNT(name) AS No_Sunk
FROM ships s JOIN outcomes o
ON s.name=o.ship
WHERE result='sunk'
GROUP BY s.class
*/


--6
/*
WITH T AS
(
SELECT s.class
FROM ships s JOIN classes c
ON s.class=c.class
GROUP BY s.class
HAVING COUNT(name)>2
),
M AS
(
SELECT s.class, COUNT(name) AS No_Sunk
FROM ships s JOIN outcomes o
ON s.name=o.ship AND o.result='sunk'
GROUP BY s.class
)
SELECT T.class, No_Sunk
FROM T, M
WHERE T.class=M.class
*/


--7
/*
SELECT country, CAST(AVG(bore) AS DECIMAL(8,2)) AS avg_bore
FROM ships, classes
WHERE ships.class=classes.class
GROUP BY country
*/