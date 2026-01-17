CREATE or REPLACE TABLE tasty_bytes.raw_pos.truck_dev
    CLONE tasty_bytes.raw_pos.truck;
SELECT * FROM tasty_bytes.raw_pos.truck_dev;
SET saved_query_id = LAST_QUERY_ID();
SET saved_timestamp = CURRENT_TIMESTAMP;
UPDATE tasty_bytes.raw_pos.truck_dev t
    SET t.year = (YEAR(CURRENT_DATE()) -1000);

-- Q1
SHOW VARIABLES;
-- Q2
SELECT * FROM tasty_bytes.raw_pos.truck_dev
AT (TIMESTAMP => $saved_timestamp)
WHERE TRUCK_ID=1;
-- Q3
SELECT * FROM tasty_bytes.raw_pos.truck_dev
BEFORE(STATEMENT =>  $saved_query_id)
WHERE TRUCK_ID = 2;
