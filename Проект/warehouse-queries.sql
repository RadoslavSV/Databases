CREATE INDEX idx_type_code
ON item(type, code);
CREATE INDEX idx_type_code_manufacturer
ON item(type, code, manufacturer_code);

CREATE INDEX idx_type_price
ON table_(type, price);
CREATE INDEX idx_basematerial_price
ON table_(basematerial, price);
CREATE INDEX idx_type_basematerial
ON table_(type, basematerial);

CREATE INDEX idx_basematerial_price
ON chair(basematerial, price);
CREATE INDEX idx_numLegs
ON chair(num_legs);

CREATE INDEX idx_basematerial_price
ON sofa(basematerial, price);
CREATE INDEX idx_numSeats
ON sofa(num_seats);

SELECT *
FROM manufacturer
CREATE INDEX idx_name
ON manufacturer(name);
CREATE INDEX idx_name_county
ON manufacturer(name, county);

CREATE INDEX idx_sector_row_position
ON location(sector, row, position);

CREATE INDEX idx_id_name
ON bundle(id,name);

CREATE INDEX idx_bundleID_storeCode
ON delivery(bundle_id,store_code);

CREATE INDEX idx_name_address
ON store(name, address);
CREATE INDEX idx_type_name
ON store(type, name);
CREATE INDEX idx_code_name
ON store(code, name);


---------------------------------------------------------------------------------------------
--1
CREATE VIEW v_allItemsPrices
AS
SELECT item.code, price
FROM item, table_
WHERE item.code=table_.item_code
UNION
SELECT item.code, price
FROM item, sofa
WHERE item.code=sofa.item_code
UNION
SELECT item.code, price
FROM item, chair
WHERE item.code=chair.item_code

--2
CREATE VIEW v_AvgPricesOfProducts
AS
SELECT type, AVG(price) AS avg_price
FROM item, chair
WHERE item.code=chair.item_code
GROUP BY type
UNION
SELECT type, AVG(price) AS avg_price
FROM item, sofa
WHERE item.code=sofa.item_code
GROUP BY type
UNION
SELECT item.type, AVG(price) AS avg_price
FROM item, table_
WHERE item.code=table_.item_code
GROUP BY item.type

--3
CREATE VIEW v_sofasAbove100
AS
SELECT item_code, basematerial, price
FROM sofa
WHERE price>=100
WITH CHECK OPTION;

--4
CREATE VIEW v_all_4legged_Chairs
AS
SELECT item_code, basematerial, colour
FROM chair
WHERE num_legs=4
WITH CHECK OPTION;

--5
CREATE VIEW v_min_max_prices_allMaterials
AS
SELECT basematerial, MIN(price) AS min_price, MAX(price) AS max_price
FROM chair
GROUP BY basematerial

--6
CREATE VIEW v_wooden_tables
AS
SELECT basematerial, type
FROM table_
WHERE basematerial LIKE '%wood%'
WITH CHECK OPTION;

--7
CREATE VIEW v_Bulgarian_manufacturers
AS
SELECT *
FROM manufacturer
WHERE county='Bulgaria'
WITH CHECK OPTION;

--8
CREATE VIEW v_bulgarianBundles_withDescription
AS
SELECT *
FROM bundle
WHERE name LIKE '%bulgarian%' AND description IS NOT NULL
WITH CHECK OPTION;

--9
CREATE VIEW v_deliveriesBefore2022
AS
SELECT bundle_id, delivery_feature_id, delivery_date
FROM delivery
WHERE delivery_date<'2022-01-01'
WITH CHECK OPTION;

--10
CREATE VIEW v_allStores_numberOfBundles
AS
SELECT store.name, COUNT(delivery.bundle_id) AS num_bundles
FROM store, delivery
WHERE store.code=delivery.store_code
GROUP BY store.name

--11
CREATE VIEW v_stores_deliveries
AS
SELECT DISTINCT s.code, s.name, s.type, df.delivery_company, df.delivery_vehicle
FROM store s, delivery d, delivery_feature df
WHERE s.code=d.store_code AND d.delivery_feature_id=df.id

---------------------------------------------------------------------------------------------