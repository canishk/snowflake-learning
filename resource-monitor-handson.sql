CREATE RESOURCE MONITOR tasty_test_rm
WITH 
    CREDIT_QUOTA = 15
    FREQUENCY = daily -- reset the monitor daily
    START_TIMESTAMP = immediately -- begin tracking immediately
    TRIGGERS 
        ON 90 PERCENT DO NOTIFY -- notify accountadmins at 80%
        ON 100 PERCENT DO SUSPEND -- suspend warehouse at 100 percent, let queries finish
        ON 110 PERCENT DO SUSPEND_IMMEDIATE;

SHOW RESOURCE MONITORS;

CREATE WAREHOUSE tasty_test_wh ;

ALTER WAREHOUSE tasty_test_wh SET RESOURCE_MONITOR = tasty_test_rm;

SHOW RESOURCE MONITORS;

ALTER RESOURCE MONITOR tasty_test_rm 
set credit_quota=20;