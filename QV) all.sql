----1
--ALTER TABLE Flight ADD num_pass INT CHECK(num_pass>=0);

----2
--ALTER TABLE agency ADD num_book INT CHECK(num_book>=0);

--3
SELECT * FROM flight
SELECT * FROM agency
SELECT * FROM booking
---------
--CREATE TRIGGER ai_booking_increase_conf_res 
--ON booking
--FOR INSERT
--AS
--UPDATE flight
--   SET num_pass = isnull(num_pass,0) + (SELECT count(1) FROM inserted WHERE flight_number=fnumber)
-- WHERE fnumber IN (SELECT flight_number FROM inserted)
--UPDATE agency
--   SET num_book = isnull(num_book,0) + (SELECT count(1) FROM inserted WHERE agency=name)
-- WHERE name IN (SELECT agency FROM inserted);

--delete from booking where code in ('YV298P','YJ298P','YK298P');

--update Flight
--   set num_pass = null
-- where fnumber in ('SU2061', 'SU2060');

-- update Agency
--   set num_book = null
-- where name in ('Travel Two', 'Travel Tour');

-- insert into Booking
--values('YV298P', 'Travel Two', 'FB', 'SU2061', 3, '2014-10-09', '2014-11-25', 350, 1),
--	  ('YJ298P', 'Travel Two', 'FB', 'SU2061', 1, '2014-10-08', '2014-11-25', 350, 1),
--	  ('YK298P', 'Travel Tour', 'FB', 'SU2060', 2, '2014-10-07', '2014-11-25', 350, 1);


----4
--CREATE TRIGGER ad_booking_decrease_conf_res 
--ON booking
--FOR DELETE
--AS
--UPDATE flight
--   SET num_pass = num_pass - (SELECT count(1) FROM deleted WHERE flight_number=fnumber)
-- WHERE fnumber IN (SELECT flight_number FROM deleted);
--UPDATE Agency
--   SET num_book = num_book - (SELECT count(1) FROM deleted WHERE agency=name)
-- WHERE name IN (SELECT agency FROM deleted);


--5