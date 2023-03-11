--1
/*
SELECT p.maker, p.model, p.type
FROM product p LEFT JOIN pc p1
ON p.model=p1.model
WHERE p.type='PC' AND p1.code IS NULL
UNION
SELECT p.maker, p.model, p.type
FROM product p LEFT JOIN laptop l1
ON p.model=l1.model
WHERE p.type='Laptop' AND l1.code IS NULL
UNION
SELECT p.maker, p.model, p.type
FROM product p LEFT JOIN printer pr1
ON p.model=pr1.model
WHERE p.type='Printer' AND pr1.code IS NULL
*/


--2
/*
SELECT DISTINCT p1.maker
FROM product p1 JOIN product p2
ON p1.maker=p2.maker AND p1.model!=p2.model
WHERE (p1.type='Printer' AND p2.type='Laptop') OR (p1.type='Laptop' AND p2.type='Printer')
*/


--3
/*
SELECT DISTINCT l1.hd
FROM laptop l1 JOIN laptop l2
ON l1.model!=l2.model AND l1.hd=l2.hd
*/


--4
/*
SELECT p1.model
FROM pc p1 LEFT JOIN product pr1
ON p1.model=pr1.model
WHERE pr1.maker IS NULL
*/