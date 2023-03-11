--1
/*
SELECT DISTINCT country
FROM classes
WHERE numguns>=ALL(SELECT numguns
				   FROM classes)
*/


--2
/*
SELECT DISTINCT class
FROM ships
WHERE name IN (SELECT ship
			   FROM outcomes
			   WHERE result='sunk')
*/


--3
/*
SELECT name, class
FROM ships
WHERE class IN (SELECT class
				FROM classes
				WHERE bore=16)
*/


--4
/*
SELECT battle
FROM outcomes
WHERE ship IN (SELECT name
			   FROM ships
			   WHERE class='Kongo')
*/


--5
/*
WITH T AS
(
SELECT class
FROM classes, (SELECT bore, MAX(numguns) AS numguns
			   FROM classes  
			   GROUP BY bore) M
WHERE M.bore=classes.bore AND M.numguns=classes.numguns
INTERSECT
SELECT ships.class
FROM ships, classes
WHERE ships.class=classes.class
)
SELECT T.class, name
FROM T, ships
WHERE T.class=ships.class
ORDER BY T.class
*/