--1
--INSERT INTO moviestar
--VALUES ('Nicole Kidman', NULL, 'F', '1967-06-20');


--2
--DELETE FROM movieexec
--WHERE cert# IN (SELECT cert#
--				FROM movieexec
--				WHERE networth<30000000)


--3
--DELETE FROM moviestar
--WHERE name=(SELECT name
--			FROM moviestar
--			WHERE address IS NULL)


--4
--INSERT INTO product
--VALUES('C','1100','PC');

--INSERT INTO pc
--VALUES('12','1100','2400','2048','500','52x','299');


--5
--DELETE FROM pc
--WHERE model IN (SELECT model
--				FROM pc
--				WHERE model='1100')


--6
--DELETE FROM laptop
--WHERE model IN (SELECT model FROM product
--				WHERE type='Laptop' AND maker IN (SELECT DISTINCT maker
--												  FROM product
--												  EXCEPT
--												  SELECT DISTINCT maker
--												  FROM product
--												  WHERE type='Printer'))


--7
--UPDATE product
--SET maker='A'
--WHERE maker='B'


--8
--UPDATE pc
--SET price=price/2


--9
--UPDATE laptop
--SET screen=screen+1
--WHERE laptop.model IN (SELECT model
--						FROM product
--						WHERE type='Laptop' AND maker='B')


--10
--INSERT INTO ships
--VALUES('Nelson','Nelson',1927)
--INSERT INTO ships
--VALUES('Rodney','Nelson',1927)
--INSERT INTO classes
--VALUES('Nelson','bb','Gt.Britain',9,16,34000)


--!!!additional
--UPDATE pc
--SET price = price-price*5/100
--WHERE code IN 
--(
--SELECT pc.code
--FROM pc, product
--WHERE pc.model=product.model AND maker IN (SELECT maker
--										   FROM product, printer
--										   WHERE product.model=printer.model
--									       GROUP BY maker
--										   HAVING AVG(price)>200)
--)