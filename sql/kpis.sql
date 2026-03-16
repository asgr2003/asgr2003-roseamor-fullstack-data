
-- ROSEAMOR KPI QUERIES

-- 1. TOTAL SALES
SELECT 
SUM(quantity * unit_price) AS total_sales
FROM fact_orders;


-- 2. TOTAL MARGIN
SELECT 
SUM((unit_price - cost) * quantity) AS total_margin
FROM fact_orders f
JOIN dim_products p
ON f.sku = p.sku;


-- 3. TOTAL ORDERS
SELECT 
COUNT(DISTINCT order_id) AS total_orders
FROM fact_orders;


-- 4. AVERAGE TICKET
SELECT 
SUM(quantity * unit_price) / COUNT(DISTINCT order_id) AS avg_ticket
FROM fact_orders;

-- DASHBOARD VISUALIZATIONS

-- 5. SALES BY MONTH
SELECT 
strftime('%Y-%m', order_date) AS month,
SUM(quantity * unit_price) AS sales
FROM fact_orders
GROUP BY month
ORDER BY month;


-- 6. SALES BY CHANNEL
SELECT 
channel,
SUM(quantity * unit_price) AS sales
FROM fact_orders
GROUP BY channel
ORDER BY sales DESC;


-- 7. MARGIN BY CATEGORY
SELECT 
p.category,
SUM((f.unit_price - p.cost) * f.quantity) AS margin
FROM fact_orders f
JOIN dim_products p
ON f.sku = p.sku
GROUP BY p.category
ORDER BY margin DESC;


-- 8. TOP 10 CUSTOMERS
SELECT 
c.name,
SUM(f.quantity * f.unit_price) AS revenue
FROM fact_orders f
JOIN dim_customers c
ON f.customer_id = c.customer_id
GROUP BY c.name
ORDER BY revenue DESC
LIMIT 10;


-- 9. TOP 10 PRODUCTS
SELECT 
sku,
SUM(quantity) AS units_sold
FROM fact_orders
GROUP BY sku
ORDER BY units_sold DESC
LIMIT 10;