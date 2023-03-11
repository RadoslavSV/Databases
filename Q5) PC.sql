--1
/*
SELECT CAST(AVG(speed) AS DECIMAL(8,2)) AS AvgSpeed
FROM pc
*/


--2
/*
SELECT maker, AVG(screen) AS AvgScreen
FROM laptop, product
WHERE laptop.model=product.model
GROUP BY maker
*/


--3
/*
SELECT CAST(AVG(speed) AS DECIMAL(8,2)) AS AvgSpeed
FROM laptop
WHERE price>1000
*/


--4
/*
SELECT maker, CAST(AVG(price) AS DECIMAL(8,2)) AS AvgPrice
FROM pc, product
WHERE pc.model=product.model AND maker='A'
GROUP BY maker
*/


--5
/*
WITH T AS
(
SELECT maker, price
FROM pc, product
WHERE pc.model=product.model AND maker='B'
UNION ALL
SELECT maker, price
FROM laptop, product
WHERE laptop.model=product.model AND maker='B'
)
SELECT maker, AVG(price) AS AvgPrice
FROM T
GROUP BY maker
*/


--6
/*
SELECT speed, AVG(price) AS AvgPrice
FROM pc
GROUP BY speed
*/


--7
/*
SELECT maker, COUNT(code) AS number_of_pc
FROM pc, product
WHERE pc.model=product.model
GROUP BY maker
HAVING COUNT(code)>1
*/


--8
/*
SELECT maker, MAX(price) AS price
FROM pc, product
WHERE pc.model=product.model AND pc.price>=ALL(SELECT price
											   FROM pc)
GROUP BY maker
*/


--9
/*
SELECT speed, AVG(price) AS AvgPrice
FROM pc
WHERE speed>800
GROUP BY speed
*/


--10
/*
WITH T AS
(
SELECT maker
FROM product
WHERE type='PC'
INTERSECT
SELECT DISTINCT maker
FROM product
WHERE type='Printer'
)
SELECT T.maker, CAST(AVG(hd) AS DECIMAL(8,2)) AS AvgHDD
FROM pc, product, T
WHERE pc.model=product.model AND product.maker=T.maker
GROUP BY T.maker
*/