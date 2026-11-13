# Fiori-App
```abap
SELECT  
    s~WAREHOUSE_ID,
    w~CITY && '(' && w~WAREHOUSE_NAME && ')' AS location,
    s~PRODUCT_ID,
    p~PROD_NAME,
    s~AMOUNT
  FROM 
    ZSPAC###_STOCK AS s
  INNER JOIN ZSPAC###_PRODUCT AS p ON p~product_id = s~product_id
  INNER JOIN ZSPAC###_WH AS w ON w~warehouse_id = s~warehouse_id
*  WHERE s~AMOUNT > 0
  ORDER BY w~WAREHOUSE_ID ASCENDING, s~AMOUNT DESCENDING
```
