-- Продажи по годам
SELECT t.year, SUM(s.total_sales) AS total
FROM fact_sales s
JOIN dim_time t ON s.date = t.date
GROUP BY t.year
ORDER BY t.year;

-- Средняя сумма покупки по клиентам
SELECT c.name, AVG(s.total_sales) AS avg_sales
FROM fact_sales s
JOIN dim_customer c ON s.customerid = c.customerid
GROUP BY c.name
ORDER BY avg_sales DESC;

-- Количество продаж по категориям
SELECT b.category, SUM(s.total_sales) AS total_sales
FROM fact_sales s
JOIN dim_product p ON s.productid = p.product_id
JOIN bridge_product_category b ON p.product_id = b.productid
GROUP BY b.category
ORDER BY total_sales DESC;
