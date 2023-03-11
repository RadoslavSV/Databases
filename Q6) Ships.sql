--1
/*
SELECT DISTINCT ship
FROM outcomes
WHERE ship LIKE 'C%' OR ship LIKE 'K%'
*/


--2
/*
SELECT s.name AS ship, c.country AS country
FROM ships s, classes c
WHERE s.class=c.class
EXCEPT
SELECT s.name AS ship, c.country AS country
FROM ships s JOIN classes c
ON s.class=c.class
JOIN outcomes o
ON o.ship=s.name
WHERE o.result='sunk'
*/


--3
/*
SELECT DISTINCT c.country, COUNT(ship) AS num_sunk_ships
FROM classes c LEFT JOIN ships s
ON c.class=s.class
LEFT JOIN outcomes o
ON o.ship=s.name AND o.result='sunk'
GROUP BY c.country
*/


--4
/*
WITH T AS
(
SELECT battle, COUNT(ship) AS no_ships
FROM outcomes
GROUP BY battle
),
M AS
(
SELECT battle, COUNT(ship) AS no_ships
FROM outcomes
WHERE battle='Guadalcanal'
GROUP BY battle
)
SELECT T.battle
FROM T, M
WHERE T.no_ships>M.no_ships
*/


--5
/*

WITH T AS
(
	SELECT battle, COUNT(T.country) AS no_countries
	FROM outcomes, (SELECT c.country, s.name AS ship
					FROM classes c JOIN ships s
					ON c.class=s.class) T
	WHERE outcomes.ship=T.ship
	GROUP BY battle
),
M AS
(
	SELECT battle, COUNT(T.country) AS no_countries
	FROM outcomes, (SELECT c.country, s.name AS ship
					FROM classes c JOIN ships s
					ON c.class=s.class) T
	WHERE outcomes.ship=T.ship AND battle='Surigao Strait'
	GROUP BY battle
)
SELECT T.battle
FROM T, M
WHERE T.no_countries>M.no_countries

*/


--6
/*
WITH T AS
(
SELECT s.name, c.displacement, c.numguns
FROM ships s, classes c
WHERE s.class=c.class AND c.displacement<=ALL(SELECT displacement
											  FROM classes)
)
SELECT name, displacement, numguns
FROM T
WHERE numguns>=ALL(SELECT numguns
				   FROM T)
*/


--7
/*
WITH T AS
(
SELECT ship
FROM outcomes
WHERE result='damaged'
INTERSECT
SELECT ship
FROM outcomes
WHERE result='ok'
)
SELECT COUNT(ship) AS num_ships
FROM T
*/


--8
/*

WITH TTT AS
(
SELECT ship, num_ships
FROM (SELECT ship, battle
	  FROM outcomes
	  WHERE result='damaged') T, (SELECT battle, COUNT(ship) AS num_ships
								  FROM outcomes 
								  GROUP BY battle) M
WHERE T.battle=M.battle
),
MMM AS
(
	SELECT ship, num_ships
	FROM (SELECT ship, battle
		  FROM outcomes
		  WHERE result='ok') TT, (SELECT battle, COUNT(ship) AS num_ships
								  FROM outcomes 
								  GROUP BY battle) MM
	WHERE TT.battle=MM.battle
)
SELECT TTT.ship
FROM TTT, MMM
WHERE TTT.ship=MMM.ship AND TTT.num_ships<MMM.num_ships

*/