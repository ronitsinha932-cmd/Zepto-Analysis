-- Total number of products
SELECT COUNT(*) AS total_products
FROM zepto;
-- Sample records
SELECT *
FROM zepto
LIMIT 20;
-- Check NULL values
SELECT *
FROM zepto
WHERE name IS NULL
    OR category IS NULL
    OR mrp IS NULL
    OR discountpercentage IS NULL
    OR available_quantity IS NULL
    OR discounted_selling_price IS NULL
    OR weight_in_gram IS NULL
    OR out_of_stock IS NULL
    OR quantity IS NULL;
-- Product categories
SELECT DISTINCT category
FROM zepto
ORDER BY category;
-- Stock status
SELECT out_of_stock,
    COUNT(*) AS product_count
FROM zepto
GROUP BY out_of_stock;
-- Duplicate product names
SELECT name,
    COUNT(sku_id) AS number_of_skus
FROM zepto
GROUP BY name
HAVING COUNT(sku_id) > 1
ORDER BY number_of_skus DESC;