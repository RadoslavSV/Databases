/*
SELECT name
FROM ships, classes
WHERE ships.class=classes.class AND displacement>50000
*/


/*
WITH T AS
(
SELECT name, class
FROM ships, outcomes
WHERE name=ship AND battle='Guadalcanal'
)

SELECT name, displacement, numguns
FROM T, classes
WHERE T.class=classes.class
*/


/*
SELECT country
FROM classes
WHERE type='bb'
INTERSECT
SELECT country
FROM classes
WHERE type='bc'
*/


/*
WITH T AS
(
SELECT ship, battle, date
FROM outcomes, battles
WHERE battle=battles.name AND result='damaged'
),
M AS
(
SELECT ship, battle, date
FROM outcomes, battles
WHERE battle=battles.name
)

SELECT T.ship
FROM T, M
WHERE T.ship=M.ship AND T.battle!=M.battle AND T.date<M.date
*/


