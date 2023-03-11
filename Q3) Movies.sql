--1
/*
SELECT name
FROM moviestar
WHERE gender='M' AND name IN (SELECT name
							  FROM movieexec
							  WHERE networth>10000000);
*/


--2
/*
SELECT name
FROM moviestar
WHERE name NOT IN (SELECT name
			       FROM movieexec);
*/


--3
/*
SELECT title
FROM movie
WHERE length>(SELECT length
			  FROM movie
			  WHERE title='Star Wars');
*/


--4
/*
WITH T AS
(
SELECT networth
FROM movieexec
WHERE name='Merv Griffin'
)

SELECT title, name
FROM movie, movieexec
WHERE producerc#=cert# AND name IN (SELECT name
									FROM movieexec, T
									WHERE movieexec.networth>T.networth)
*/