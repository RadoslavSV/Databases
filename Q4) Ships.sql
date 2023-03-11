--1
/*
SELECT *
FROM ships s JOIN classes c
ON s.class=c.class
*/


--2
/*
SELECT *
FROM ships s RIGHT JOIN classes c
ON c.class=s.class
ORDER BY name
*/


--3
/*
WITH T AS
(
SELECT s.name
FROM classes c JOIN ships s
ON c.class=s.class
EXCEPT
SELECT DISTINCT name
FROM ships s JOIN outcomes o
ON s.name=o.ship
)

SELECT c.country, s.name
FROM classes c JOIN ships s
ON c.class=s.class
JOIN T t
ON t.name=s.name
ORDER BY country, name
*/


--4
/*
SELECT s.name AS 'Ship Name'
FROM ships s JOIN classes c
ON s.class=c.class
WHERE c.numguns>=7 AND s.launched=1916
*/


--5
/*
SELECT o.ship, o.battle, b.date
FROM outcomes o JOIN battles b
ON o.battle=b.name
WHERE o.result='sunk'
ORDER BY b.name
*/


--6
/*
SELECT s.name, c.displacement, s.launched
FROM ships s JOIN classes c
ON s.class=c.class
WHERE s.name=c.class
*/


--7
/*
SELECT c.*
FROM classes c LEFT JOIN ships s
ON c.class=s.class
WHERE s.name IS NULL
*/


--8
/*
SELECT s.name, c.displacement, c.numguns, o.result
FROM ships s JOIN classes c
ON s.class=c.class
JOIN outcomes o
ON o.battle='North Atlantic'
WHERE s.name=o.ship
*/