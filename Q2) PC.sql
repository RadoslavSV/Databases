/*
SELECT maker, speed
FROM product, laptop
WHERE type='laptop' AND hd>9 AND product.model=laptop.model
*/


/*
SELECT DISTINCT product.model, price
FROM product, pc
WHERE maker='B' AND product.model=pc.model
UNION
SELECT product.model, price
FROM product, laptop
WHERE maker='B' AND product.model=laptop.model
UNION
SELECT product.model, price
FROM product, printer
WHERE maker='B' AND product.model=printer.model
*/


/*
SELECT DISTINCT maker
FROM product
WHERE type='Laptop'
EXCEPT
SELECT DISTINCT maker
FROM product
WHERE type='PC'
*/


/*
WITH T AS
(
SELECT *, 
COUNT(*) OVER (PARTITION BY hd) as cnt
FROM pc
)
SELECT DISTINCT hd
FROM T
WHERE cnt>1
*/


/*
SELECT DISTINCT a.model, b.model 
FROM pc a, pc b 
WHERE a.speed = b.speed AND a.ram=b.ram AND a.model<b.model
*/