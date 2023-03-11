ALTER TABLE manufacturer ADD num_items INT CHECK(num_items>=0);

CREATE TRIGGER tr_increase_num_of_items
ON item
FOR INSERT
AS
UPDATE manufacturer
   SET num_items = isnull(num_items,0) + (SELECT count(1) FROM inserted WHERE manufacturer_code=manufacturer.code)
 WHERE manufacturer.code IN (SELECT manufacturer_code FROM inserted);

----

CREATE TRIGGER tr_decrease_num_of_items
ON item
FOR DELETE
AS
UPDATE manufacturer
   SET num_items = num_items - (SELECT count(1) FROM deleted WHERE manufacturer_code=manufacturer.code)
 WHERE manufacturer.code IN (SELECT manufacturer_code FROM deleted);
 
-----------------------------
--INSERT INTO location
--VALUES ('SAR22P100','A',22,100);
--INSERT INTO location
--VALUES ('SAR25P100','A',25,100);
--INSERT INTO item
--	VALUES ('HONOLULU','23yw7nc7j5','Chair','SAR22P100');
--INSERT INTO item
--	VALUES ('HAWAII','23yw7nc7j5','Sofa','SAR25P100');
--DELETE FROM item WHERE item.code='HONOLULU';
--DELETE FROM item WHERE item.code='HAWAII';
--DELETE FROM location WHERE location.code='SAR22P100';
--DELETE FROM location WHERE location.code='SAR25P100';