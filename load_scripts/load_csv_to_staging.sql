-- Загрузка заказов
COPY stg_orders(order_code, customer_code, order_date, status, total_amount)
FROM 'C:/Users/aleksandr.shepilov/Desktop/OLTP_csv/orders.csv'
DELIMITER ',' CSV HEADER;

-- Загрузка товаров в заказах
COPY stg_order_items(order_item_code, order_code, product_code, quantity)
FROM 'C:/Users/aleksandr.shepilov/Desktop/OLTP_csv/order_items.csv'
DELIMITER ',' CSV HEADER;

-- Загрузка клиентов
COPY stg_customers(customer_code, name, email, phone, address)
FROM 'C:/Users/aleksandr.shepilov/Desktop/OLTP_csv/customers_fixed.csv'
DELIMITER ',' CSV HEADER;

-- Загрузка товаров
COPY stg_products(product_code, name, price, stock_quantity, category, flavor, manufacturer)
FROM 'C:/Users/aleksandr.shepilov/Desktop/OLTP_csv/products_for_stg.csv'
DELIMITER ',' CSV HEADER;

-- Загрузка поставщиков
COPY stg_suppliers(supplier_code, name, country)
FROM 'C:/Users/aleksandr.shepilov/Desktop/OLTP_csv/suppliers.csv'
DELIMITER ',' CSV HEADER;

-- Загрузка складов
COPY stg_warehouse(warehouse_code, city, capacity)
FROM 'C:/Users/aleksandr.shepilov/Desktop/OLTP_csv/warehouse.csv'
DELIMITER ',' CSV HEADER;
