-- Q1. Top 10 products by discount percentage
SELECT DISTINCT name,
    category,
    mrp,
    discountpercentage
FROM zepto
ORDER BY discountpercentage DESC
LIMIT 10;
-- Q2. High-MRP products that are out of stock
SELECT DISTINCT name,
    category,
    mrp,
    out_of_stock
FROM zepto
WHERE out_of_stock = TRUE
ORDER BY mrp DESC;
-- Q3. Estimated revenue by category
SELECT category,
    ROUND(
        SUM(discounted_selling_price * available_quantity),
        2
    ) AS estimated_revenue
FROM zepto
GROUP BY category
ORDER BY estimated_revenue DESC;
-- Q4. Top 10 products by estimated revenue
SELECT name,
    category,
    discounted_selling_price,
    available_quantity,
    ROUND(
        discounted_selling_price * available_quantity,
        2
    ) AS estimated_revenue
FROM zepto
ORDER BY estimated_revenue DESC
LIMIT 10;
-- Q5. Average selling price by category
SELECT category,
    ROUND(AVG(discounted_selling_price), 2) AS average_selling_price
FROM zepto
GROUP BY category
ORDER BY average_selling_price DESC;
-- Q6. Out-of-stock percentage
SELECT ROUND(
        100.0 * SUM(
            CASE
                WHEN out_of_stock = TRUE THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS out_of_stock_percentage
FROM zepto;
-- Q7. Category-wise inventory analysis
SELECT category,
    COUNT(*) AS total_products,
    SUM(
        CASE
            WHEN out_of_stock = TRUE THEN 1
            ELSE 0
        END
    ) AS out_of_stock_products,
    SUM(available_quantity) AS total_available_quantity
FROM zepto
GROUP BY category
ORDER BY out_of_stock_products DESC;
-- Q8. Low-stock products
SELECT name,
    category,
    available_quantity,
    out_of_stock
FROM zepto
WHERE available_quantity <= 10
ORDER BY available_quantity ASC;
-- Q9. Average discount by category
SELECT category,
    ROUND(AVG(discountpercentage), 2) AS average_discount
FROM zepto
GROUP BY category
ORDER BY average_discount DESC;
-- Q10. Inventory value by category
SELECT category,
    ROUND(
        SUM(discounted_selling_price * available_quantity),
        2
    ) AS inventory_value
FROM zepto
GROUP BY category
ORDER BY inventory_value DESC;