CREATE TABLE dim_customers AS
SELECT DISTINCT
    customer_id,
    name,
    country,
    segment,
    created_at
FROM customers_raw;

CREATE TABLE dim_products AS
SELECT
    sku,
    category,
    cost
FROM products_raw
WHERE active = 'True';

CREATE TABLE fact_orders AS
SELECT
    order_id,
    customer_id,
    sku,
    quantity,
    unit_price,
    DATE(order_date) AS order_date,
    channel,
    quantity * unit_price AS revenue
FROM orders_raw
WHERE quantity > 0
AND unit_price > 0;