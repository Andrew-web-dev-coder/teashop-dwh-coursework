-- 1. Количество заказов по каждому покупателю
SELECT customer_code, COUNT(order_code) AS total_orders
FROM stg_orders
GROUP BY customer_code
ORDER BY total_orders DESC;

-- 2. Выручка по дням только по завершённым заказам
SELECT order_date, SUM(total_amount) AS daily_revenue
FROM stg_orders
WHERE status = 'COMPLETED'
GROUP BY order_date
ORDER BY order_date;

-- 3. Количество заказов по каждому статусу (PENDING, COMPLETED, CANCELLED)
SELECT status, COUNT(*) AS status_count
FROM stg_orders
GROUP BY status;