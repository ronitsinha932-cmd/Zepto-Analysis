-- Check products with zero price
SELECT *
FROM zepto
WHERE mrp = 0
    OR discounted_selling_price = 0;
-- Remove products with zero MRP
DELETE FROM zepto
WHERE mrp = 0;
-- Convert price from paisa to rupees
UPDATE zepto
SET mrp = mrp / 100.0,
    discounted_selling_price = discounted_selling_price / 100.0;
-- Verify prices
SELECT mrp,
    discounted_selling_price
FROM zepto;
-- Check cleaned data
SELECT *
FROM zepto
LIMIT 20;