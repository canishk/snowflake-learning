-- q1
CREATE OR REPLACE VIEW TASTY_BYTES.ANALYTICS.truck_franchise
AS
SELECT
    t.*,
    f.first_name AS franchisee_first_name,
    f.last_name AS franchisee_last_name
FROM tasty_bytes.raw_pos.truck t
JOIN tasty_bytes.raw_pos.franchise f
    ON t.franchise_id = f.franchise_id;

SELECT
    MAKE
FROM TASTY_BYTES.ANALYTICS.TRUCK_FRANCHISE
WHERE FRANCHISEE_FIRST_NAME='Sara'
AND FRANCHISEE_LAST_NAME='Nicholson';
-- Q2
DESCRIBE VIEW TASTY_BYTES.ANALYTICS.TRUCK_FRANCHISE;
-- Q3
DROP VIEW TASTY_BYTES.ANALYTICS.TRUCK_FRANCHISE;
-- Q4
CREATE MATERIALIZED VIEW TEST_DATABASE.TEST_SCHEMA.truck_franchise_materialized
AS
SELECT
    t.*,
    f.first_name AS franchisee_first_name,
    f.last_name AS franchisee_last_name
FROM tasty_bytes.raw_pos.truck t
JOIN tasty_bytes.raw_pos.franchise f
    ON t.franchise_id = f.franchise_id;
-- Q5
CREATE MATERIALIZED VIEW TEST_DATABASE.TEST_SCHEMA.nissan
AS
SELECT
    t.*
FROM tasty_bytes.raw_pos.truck t
WHERE make = 'Nissan';

SELECT COUNT(*) FROM TEST_DATABASE.TEST_SCHEMA.NISSAN;

-- Q6
DROP MATERIALIZED VIEW TEST_DATABASE.TEST_SCHEMA.NISSAN;