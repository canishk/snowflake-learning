-- q1
DESCRIBE TABLE TASTY_BYTES.RAW_POS.MENU;
-- Q2
SELECT TYPEOF(MENU_ITEM_HEALTH_METRICS_OBJ) FROM TASTY_BYTES.RAW_POS.MENU;

-- Q3
SELECT test_array[0] FROM test_db.test_sc.test_tb;
-- Q4
SELECT MENU_ITEM_HEALTH_METRICS_OBJ['menu_item_health_metrics'][0]['ingredients'][0]
FROM tasty_bytes.raw_pos.menu
WHERE MENU_ITEM_NAME = 'Mango Sticky Rice';