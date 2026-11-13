# Fiori-App
```abap
SELECT  
    s~WAREHOUSE_ID,
    w~CITY && '(' && w~WAREHOUSE_NAME && ')' AS location,
    s~PRODUCT_ID,
    p~PROD_NAME,
    s~AMOUNT
  FROM 
    ZSPAC113_STOCK AS s
  INNER JOIN ZSPAC113_PRODUCT AS p ON p~product_id = s~product_id
  INNER JOIN ZSPAC113_WH AS w ON w~warehouse_id = s~warehouse_id
*  WHERE s~AMOUNT > 0
  ORDER BY w~WAREHOUSE_ID ASCENDING, s~AMOUNT DESCENDING
```
