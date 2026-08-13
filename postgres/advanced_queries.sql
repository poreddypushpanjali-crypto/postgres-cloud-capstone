-- 1. CTE + aggregation
WITH customer_spend AS (
    SELECT c.customer_id, c.full_name,
           SUM(o.total_amount) AS total_spend
    FROM customers c
    JOIN orders o ON o.customer_id = c.customer_id
    GROUP BY c.customer_id, c.full_name
)
SELECT *
FROM customer_spend
ORDER BY total_spend DESC;

-- 2. Window function: customer order ranking
SELECT customer_id, order_id, total_amount,
       RANK() OVER (
           PARTITION BY customer_id
           ORDER BY total_amount DESC
       ) AS order_rank
FROM orders;

-- 3. Running monthly revenue
SELECT date_trunc('month', order_date) AS month,
       SUM(total_amount) AS monthly_revenue,
       SUM(SUM(total_amount)) OVER (
           ORDER BY date_trunc('month', order_date)
       ) AS cumulative_revenue
FROM orders
GROUP BY 1
ORDER BY 1;

-- 4. JSONB search
SELECT product_name, attributes
FROM products
WHERE attributes @> '{"brand":"TechOne"}';

-- 5. Materialized view
DROP MATERIALIZED VIEW IF EXISTS monthly_sales_summary;

CREATE MATERIALIZED VIEW monthly_sales_summary AS
SELECT date_trunc('month', order_date) AS month,
       COUNT(*) AS order_count,
       SUM(total_amount) AS revenue
FROM orders
GROUP BY 1
ORDER BY 1;

REFRESH MATERIALIZED VIEW monthly_sales_summary;

SELECT * FROM monthly_sales_summary;

-- 6. Query plan for optimization
EXPLAIN ANALYZE
SELECT *
FROM orders
WHERE customer_id = 1
  AND order_date >= CURRENT_DATE - INTERVAL '365 days';

-- 7. Transaction / locking demonstration
BEGIN;
SELECT * FROM orders WHERE order_id = 1 FOR UPDATE;
UPDATE orders SET status = 'SHIPPED' WHERE order_id = 1;
COMMIT;
