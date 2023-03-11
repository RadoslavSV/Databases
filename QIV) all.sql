----1
--CREATE VIEW v_flights_airlines_confirmedCustomers
--AS

--WITH T AS
--(
--SELECT DISTINCT TT.name, fnumber
--FROM flight, booking, (SELECT name, airline.code
--					   FROM airline) TT
--WHERE flight.fnumber=booking.flight_number AND TT.code=airline_operator
--),
--M AS
--(
--SELECT flight_number, SUM(status) AS num_confirmed_customers
--FROM booking
--GROUP BY flight_number
--)
--SELECT name, fnumber, num_confirmed_customers
--FROM T, M
--WHERE fnumber=flight_number



----3
--CREATE VIEW v_Sofia_agencies
--AS

--SELECT *
--FROM agency
--WHERE city='Sofia'
--WITH CHECK OPTION;



----4
--CREATE VIEW v_agencies_nullPhones
--AS

--SELECT *
--FROM agency
--WHERE phone IS NULL
--WITH CHECK OPTION;



--5
--INSERT INTO v_Sofia_agencies
--VALUES('T1 Tour', 'Bulgaria', 'Sofia','+359');
--INSERT INTO v_agencies_nullPhones
--VALUES('T2 Tour', 'Bulgaria', 'Sofia',null);
--INSERT INTO v_Sofia_agencies
--VALUES('T3 Tour', 'Bulgaria', 'Varna','+359');
--INSERT INTO v_agencies_nullPhones
--VALUES('T4 Tour', 'Bulgaria', 'Varna',null);
--INSERT INTO v_agencies_nullPhones
--VALUES('T4 Tour', 'Bulgaria', 'Sofia','+359');



------------------------------------------------------------------------------------------------------------

--6
--CREATE VIEW RichExec
--AS
--SELECT name, address, cert#, networth
--FROM movieexec
--WHERE networth>=10000000

--7
--CREATE VIEW ExecutiveStar
--AS
--SELECT moviestar.name, moviestar.address, gender, birthdate, cert#, networth
--FROM movieexec, moviestar
--WHERE movieexec.name=moviestar.name

--9
--SELECT *
--FROM ExecutiveStar
--WHERE gender='F'

--10
--SELECT *
--FROM ExecutiveStar
--WHERE networth>=50000000

--11
--DROP VIEW RichExec;
--DROP VIEW ExecutiveStar;




-----------------------------------------------------------------------------------------------------
--12
--CREATE UNIQUE INDEX idx_PC_product
--ON product(model, type);
--13
--14
--DROP INDEX idx_PC_product ON product;