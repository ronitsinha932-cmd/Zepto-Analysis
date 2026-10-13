-- Q11. Products priced above their category average
SELECT name,
    category,
    discounted_selling_price
FROM zepto z
WHERE discounted_selling_price > (
        SELECT AVG(discounted_selling_price)
        FROM zepto
        WHERE category = z.category
    )
ORDER BY discounted_selling_price DESC;
-- Q12. Rank products by estimated revenue
SELECT name,
    category,
    ROUND(
        discounted_selling_price * available_quantity,
        2
    ) AS estimated_revenue,
    RANK() OVER (
        ORDER BY discounted_selling_price * available_quantity DESC
    ) AS revenue_rank
FROM zepto
LIMIT 20;
-- Q13. Rank categories by estimated revenue
WITH category_revenue AS (
    SELECT category,
        SUM(
            discounted_selling_price * available_quantity
        ) AS total_revenue
    FROM zepto
    GROUP BY category
)
SELECT category,
    ROUND(total_revenue, 2) AS total_revenue,
    RANK() OVER (
        ORDER BY total_revenue DESC
    ) AS revenue_rank
FROM category_revenue;
-- Q14. Revenue contribution percentage by category
WITH category_revenue AS (
    SELECT category,
        SUM(
            discounted_selling_price * available_quantity
        ) AS revenue
    FROM zepto
    GROUP BY category
)
SELECT category,
    ROUND(revenue, 2) AS revenue,
    ROUND(
        100.0 * revenue / SUM(revenue) OVER (),
        2
    ) AS revenue_percentage
FROM category_revenue
ORDER BY revenue DESC;
-- Q15. Highest discounted product in each category
WITH ranked_products AS (
    SELECT name,
        category,
        discountpercentage,
        RANK() OVER (
            PARTITION BY category
            ORDER BY discountpercentage DESC
        ) AS discount_rank
    FROM zepto
)
SELECT name,
    category,
    discountpercentage
FROM ranked_products
WHERE discount_rank = 1
ORDER BY category;