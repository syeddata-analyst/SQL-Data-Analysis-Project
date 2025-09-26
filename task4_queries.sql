-- Task 4: SQL for Data Analysis (PostgreSQL)
-- Dataset: Ecommerce_SQL_Database

-- 1. Select customers (basic SELECT)
SELECT customer_id, first_name, last_name, email 
FROM customers
LIMIT 10;

-- 2. Products with price > 500 (WHERE + ORDER BY)
SELECT * 
FROM products
WHERE price > 500
ORDER BY price DESC;

-- 3. Total revenue per customer (GROUP BY + SUM)
SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id
ORDER BY total_spent DESC;

-- 4. Average order value (Aggregate function)
SELECT AVG(total_amount) AS avg_order_value
FROM orders;

-- 5. Orders with customer details (INNER JOIN)
SELECT o.order_id, c.first_name, c.last_name, o.total_amount
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
ORDER BY o.total_amount DESC;

-- 6. Products with or without sales (LEFT JOIN)
SELECT p.product_id, p.product_name, oi.quantity
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id;

-- 7. Customers who spent more than average (Subquery + HAVING)
SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id
HAVING SUM(total_amount) > (
    SELECT AVG(total_amount) FROM orders
);

-- 8. Create a view for top customers (CREATE VIEW)
CREATE VIEW top_customers AS
SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id
ORDER BY total_spent DESC;

-- 9. Create index for optimization (CREATE INDEX)
CREATE INDEX idx_orders_customer_id
ON orders(customer_id);
