-- Q1
USE WAREHOUSE compute_wh;
CREATE DATABASE test_ingestion;
CREATE OR REPLACE FILE FORMAT test_ingestion.public.csv_ff
type = 'csv';

CREATE OR REPLACE STAGE TEST_INGESTION.PUBLIC.TEST_STAGE
URL='s3://sfquickstarts/tasty-bytes-builder-education/raw_pos/truck'
FILE_FORMAT = test_ingestion.public.csv_ff;

-- Q2
ls @TEST_INGESTION.PUBLIC.TEST_STAGE;

-- Q3
-- truck table build
CREATE OR REPLACE TABLE test_ingestion.public.truck
(
    truck_id NUMBER(38,0),
    menu_type_id NUMBER(38,0),
    primary_city VARCHAR(16777216),
    region VARCHAR(16777216),
    iso_region VARCHAR(16777216),
    country VARCHAR(16777216),
    iso_country_code VARCHAR(16777216),
    franchise_flag NUMBER(38,0),
    year NUMBER(38,0),
    make VARCHAR(16777216),
    model VARCHAR(16777216),
    ev_flag NUMBER(38,0),
    franchise_id NUMBER(38,0),
    truck_opening_date DATE
);

COPY INTO TEST_INGESTION.PUBLIC.TRUCK
FROM @TEST_INGESTION.PUBLIC.TEST_STAGE;