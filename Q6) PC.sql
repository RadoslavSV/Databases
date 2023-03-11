--1
/*
SELECT DISTINCT l1.model, l1.code, l1.screen
FROM laptop l1 JOIN laptop l2
ON l1.model=l2.model
WHERE l1.screen=11 OR l1.screen=15
*/


--2
/*
WITH T AS
(
SELECT maker, MIN(price) AS price
FROM product p, laptop l
WHERE p.model=l.model
GROUP BY maker
),
M AS
(
SELECT pc.model, pc.price, product.maker
FROM pc, product
WHERE pc.model=product.model
)
SELECT DISTINCT model
FROM T, M
WHERE T.maker=M.maker AND M.price<T.price
*/


--3
/*
WITH T AS
(
SELECT maker, MIN(price) AS price
FROM product p, laptop l
WHERE p.model=l.model
GROUP BY maker
),
M AS
(
SELECT DISTINCT pc.model, product.maker, AVG(price) AS avg_price
FROM pc, product
WHERE pc.model=product.model
GROUP BY pc.model, product.maker
)
SELECT M.model, M.avg_price
FROM T, M
WHERE T.maker=M.maker AND M.avg_price<T.price
*/


--4
/*
WITH T AS
(
SELECT pc.code, product.maker, pc.price
FROM pc, product
WHERE pc.model=product.model
)
SELECT t1.code, t1.maker, (SELECT COUNT(t2.code)
						   FROM T t2  
						   WHERE t2.price>=t1.price AND t1.code!=t2.code) AS num_pc_higher_price
FROM T t1  
GROUP BY t1.code, t1.maker, t1.price
*/


--4 [UNKNOWN WHY THIS BELOW IS CONSIDERED CORRECT]
/*
SELECT p1.code, maker, COUNT(p2.code) num_pc_higher_price
FROM pc p1, pc p2, product
WHERE p1.price<=p2.price AND p1.model=product.model AND p2.model=product.model
GROUP BY p1.code, maker
*/