--1
/*
SELECT maker
FROM product
WHERE type='PC' AND model IN (SELECT model
							  FROM pc
							  WHERE speed>500);
*/


--2
/*
SELECT code, model, price
FROM printer
WHERE price>=ALL(SELECT price
				 FROM printer);
*/


--3
/*
SELECT *
FROM laptop
WHERE speed<ALL(SELECT speed
				FROM pc);
*/


--4
/*
WITH T AS
(
SELECT product.model, price
FROM product, pc
WHERE product.model=pc.model AND price>=ALL(SELECT price
											FROM pc)
UNION
SELECT product.model, price
FROM product, laptop
WHERE product.model=laptop.model AND price>=ALL(SELECT price
											    FROM laptop)
UNION
SELECT product.model, price
FROM product, printer
WHERE product.model=printer.model AND price>=ALL(SELECT price
											     FROM printer)
)
SELECT *
FROM T
WHERE price>=ALL(SELECT price
				 FROM T)
*/


--5
/*
SELECT maker
FROM printer, product
WHERE printer.color='y' AND printer.model=product.model AND printer.price<=ALL(SELECT price
														                       FROM printer, product
														                       WHERE printer.color='y' AND printer.model=product.model)
*/


--6
/*
WITH T AS
(
SELECT maker, speed
FROM pc, product
WHERE pc.model=product.model AND ram<=ALL(SELECT ram
										  FROM pc, product
										  WHERE pc.model=product.model)
)

SELECT maker
FROM T
WHERE speed>=ALL(SELECT speed
				 FROM T)
*/