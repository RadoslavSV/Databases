CREATE TABLE airline(
	code VARCHAR(20) NOT NULL,
	name VARCHAR(50) NOT NULL,
	country VARCHAR(50) NOT NULL
);

INSERT INTO AIRLINE
VALUES ('AZ', 'Alitalia', 'Italy'),
	   ('BA', 'British Airways', 'United Kingdom'),
	   ('LH', 'Lufthansa', 'Germany'),
	   ('SR', 'Swissair', 'Switzerland'),
	   ('FB', 'Bulgaria Air', 'Bulgaria'),
	   ('AF', 'Air France', 'France'),
	   ('TK', 'Turkish Airlines', 'Turkey'),
	   ('AA', 'American Airlines', 'United States');

SELECT *
FROM airline

CREATE TABLE airport(
	code VARCHAR(20) NOT NULL,
	name VARCHAR(50) NOT NULL,
	country VARCHAR(50) NOT NULL,
	city VARCHAR(50) NOT NULL
);

INSERT INTO AIRPORT
VALUES ('SOF', 'Sofia International', 'Bulgaria', 'Sofia'),
		('CDG', 'Charles De Gaulle', 'France', 'Paris'),
		('ORY', 'Orly', 'France', 'Paris'),
		('LBG', 'Le Bourget', 'France', 'Paris'),
		('JFK', 'John F Kennedy International', 'United States', 'New York'),
		('ORD', 'Chicago O''Hare International', 'United States', 'Chicago'),
		('FCO', 'Leonardo da Vinci International', 'Italy', 'Rome'),
		('LHR', 'London Heathrow', 'United Kingdom', 'London');

SELECT *
FROM airport

CREATE TABLE airplane(
	code VARCHAR(20) NOT NULL,
	type VARCHAR(20) NOT NULL,
	seats INTEGER NOT NULL,
	year INTEGER NOT NULL
);

INSERT INTO AIRPLANE
VALUES ('319', 'Airbus A319', 150, 1993),
		('320', 'Airbus A320', 280, 1984),
		('321', 'Airbus A321', 150, 1989),
		('100', 'Fokker 100', 80, 1991),
		('738', 'Boeing 737-800', 90, 1997),
		('735', 'Boeing 737-800', 90, 1995);

SELECT *
FROM airplane

CREATE TABLE flight(
	fnumber VARCHAR(20) NOT NULL,
	airline_operator VARCHAR(20) NOT NULL,
	dep_airport VARCHAR(20) NOT NULL,
	arr_airport VARCHAR(20) NOT NULL,
	flight_time VARCHAR(20) NOT NULL,
	flight_duration INTEGER NOT NULL,
	airplane VARCHAR(20) NOT NULL
);

INSERT INTO FLIGHT
VALUES ('FB1363', 'AZ', 'SOF', 'ORY', '12:45', 100, '738'),
		('FB1364', 'AZ', 'CDG', 'SOF', '10:00', 120, '321'),
		('SU2060', 'AZ', 'LBG', 'SOF', '11:10', 110, '738'),
		('SU2061', 'TK', 'SOF', 'JFK', '13:00', 110, '320'),
		('FB363', 'FB', 'SOF', 'ORD', '15:10', 110, '738'),
		('FB364', 'FB', 'LHR', 'SOF', '21:05', 120, '738');

SELECT *
FROM flight

CREATE TABLE customer(
	id INTEGER NOT NULL,
	fname VARCHAR(50) NOT NULL,
	lname VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL
);

INSERT INTO CUSTOMER
VALUES (1, 'Petar', 'Milenov', 'petter@mail.com'),
		(2, 'Dimitar', 'Petrov', 'petrov@mail.com'),
		(3, 'Ivan', 'Ivanov', 'ivanov@mail.com'),
		(4, 'Petar', 'Slavov', 'slavov@mail.com'),
		(5, 'Bogdan', 'Bobov', 'bobov@mail.com');

SELECT *
FROM customer

CREATE TABLE agency(
	name VARCHAR(50) NOT NULL,
	country VARCHAR(50) NOT NULL,
	city VARCHAR(50) NOT NULL,
	phone VARCHAR(20)
);

INSERT INTO AGENCY
VALUES ('Travel One', 'Bulgaria', 'Sofia', '0783482233'),
		('Travel Two', 'Bulgaria', 'Plovdiv', '02882234'),
		('Travel Tour', 'Bulgaria', 'Sofia', NULL),
		('Aerotravel', 'Bulgaria', 'Varna', '02884233');

SELECT *
FROM agency

CREATE TABLE booking(
	code VARCHAR(50) NOT NULL,
	agency VARCHAR(50) NOT NULL,
	airline_code VARCHAR(20) NOT NULL,
	flight_number VARCHAR(20) NOT NULL,
	customer_id INTEGER NOT NULL,
	booking_date VARCHAR(50) NOT NULL,
	flight_date VARCHAR(50) NOT NULL,
	price INTEGER NOT NULL,
	status INTEGER NOT NULL
);

INSERT INTO BOOKING
VALUES ('YN298P', 'Travel One', 'FB', 'FB1363', 1, '2013-11-18', '2013-12-25', 300, 0),
		('YA298P', 'Travel Two', 'FB', 'FB1364', 2, '2013-12-18', '2013-12-25', 300, 1),
		('YB298P', 'Travel Tour', 'FB', 'SU2060', 3, '2014-01-18', '2014-02-25', 400, 0),
		('YC298P', 'Travel One', 'FB', 'SU2061', 4, '2014-11-11', '2014-11-25', 350, 0),
		('YD298P', 'Travel Tour', 'FB', 'FB363', 1, '2013-11-03', '2013-12-20', 250, 1),
		('YE298P', 'Aerotravel', 'FB', 'FB364', 2, '2013-11-07', '2013-12-21', 150, 0);

SELECT *
FROM booking



--a
ALTER TABLE airline
ADD CONSTRAINT pk_airline_code PRIMARY KEY(code);
ALTER TABLE airplane
ADD CONSTRAINT pk_airplane_code PRIMARY KEY(code);
ALTER TABLE booking
ADD CONSTRAINT pk_booking_code PRIMARY KEY(code);
ALTER TABLE flight
ADD CONSTRAINT pk_flight_fnumber PRIMARY KEY(fnumber);
ALTER TABLE agency
ADD CONSTRAINT pk_agency_name PRIMARY KEY(name);
ALTER TABLE customer
ADD CONSTRAINT pk_customer_id PRIMARY KEY(id);
ALTER TABLE airport
ADD CONSTRAINT pk_airport_code PRIMARY KEY(code);



--b
ALTER TABLE flight
ADD CONSTRAINT fk_flight_airline FOREIGN KEY(airline_operator)
REFERENCES airline(code);
ALTER TABLE booking
ADD CONSTRAINT fk_booking_airline FOREIGN KEY(airline_code)
REFERENCES airline(code);

ALTER TABLE flight
ADD CONSTRAINT fk_flight_depAirport FOREIGN KEY(dep_airport)
REFERENCES airport(code);
ALTER TABLE flight
ADD CONSTRAINT fk_flight_arrAirport FOREIGN KEY(arr_airport)
REFERENCES airport(code);

ALTER TABLE flight
ADD CONSTRAINT fk_flight_airplane FOREIGN KEY(airplane)
REFERENCES airplane(code);

ALTER TABLE booking
ADD CONSTRAINT fk_booking_agency FOREIGN KEY(agency)
REFERENCES agency(name);

ALTER TABLE booking
ADD CONSTRAINT fk_booking_flightNumber FOREIGN KEY(flight_number)
REFERENCES flight(fnumber);

ALTER TABLE booking
ADD CONSTRAINT fk_booking_customerId FOREIGN KEY(customer_id)
REFERENCES customer(id);




--c
--done in declaration




--d
ALTER TABLE airline
ADD CONSTRAINT uq_airline_name UNIQUE(name);

ALTER TABLE airport
ADD CONSTRAINT uq_airport_name_country UNIQUE(name,country);




--e
ALTER TABLE airplane
ADD CONSTRAINT ck_seats CHECK(seats>0);

ALTER TABLE booking
ADD CONSTRAINT ck_flightDate CHECK(flight_date>=booking_date);

ALTER TABLE customer
ADD CONSTRAINT ck_email CHECK(email LIKE '%@%.%' AND LEN(email)>=6 );

ALTER TABLE booking
ADD CONSTRAINT ck_status CHECK(status=0 OR status=1);