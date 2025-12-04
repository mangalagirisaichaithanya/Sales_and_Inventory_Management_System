USE sales_inventory;

-- Inventory overview
CREATE VIEW v_product_inventory AS
SELECT 
    p.product_id,
    p.product_name,
    p.unit_price,
    i.quantity
FROM products p
LEFT JOIN inventory i ON p.product_id = i.product_id;

-- Sales summary
CREATE VIEW v_sales_summary AS
SELECT 
    so.so_id,
    so.order_date,
    c.customer_name,
    SUM(soi.quantity * soi.selling_price) AS total_amount
FROM sales_orders so
JOIN sales_order_items soi ON so.so_id = soi.so_id
JOIN customers c ON so.customer_id = c.customer_id
GROUP BY so.so_id;
