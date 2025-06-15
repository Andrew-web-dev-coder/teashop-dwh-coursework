-- Очистка dim_customer и вставка новых данных
DELETE FROM dim_customer;

INSERT INTO dim_customer (customerid, name, email, address, startdate, enddate, iscurrent)
SELECT
  customer_code,
  name,
  email,
  address,
  CURRENT_DATE,
  NULL,
  TRUE
FROM stg_customers;

-- Очистка dim_product и вставка
DELETE FROM dim_product;

INSERT INTO dim_product (productid, name, price)
SELECT product_code, name, price
FROM stg_products;

-- Очистка dim_time и вставка
DELETE FROM dim_time;

INSERT INTO dim_time (date, month, year)
SELECT DISTINCT order_date, EXTRACT(MONTH FROM order_date), EXTRACT(YEAR FROM order_date)
FROM stg_orders;

-- Очистка fact_sales и вставка
DELETE FROM fact_sales;

INSERT INTO fact_sales (date, customerid, productid, total_sales)
SELECT
  o.order_date,
  o.customer_code,
  i.product_code,
  (i.quantity * p.price)::NUMERIC(10, 2)
FROM stg_orders o
JOIN stg_order_items i ON o.order_code = i.order_code
JOIN stg_products p ON i.product_code = p.product_code;

-- Очистка fact_restocking и вставка (если требуется)
DELETE FROM fact_restocking;
-- Здесь можно вставлять данные, если у тебя есть информация о пополнении товара
