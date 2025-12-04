USE sales_inventory;

-- 1. Top 5 products
SELECT 
    p.product_name,
    SUM(soi.quantity) AS total_sold
FROM sales_order_items soi
JOIN products p ON soi.product_id = p.product_id
GROUP BY soi.product_id
ORDER BY total_sold DESC
LIMIT 5;

-- 2. Monthly sales (CTE)
WITH monthly_sales AS (
    SELECT 
        DATE_FORMAT(order_date, '%Y-%m') AS month,
        SUM(soi.quantity * soi.selling_price) AS total_revenue
    FROM sales_order_items soi
    JOIN sales_orders so ON so.so_id = soi.so_id
    GROUP BY month
)
SELECT * FROM monthly_sales;

-- 3. Supplier purchase cost
SELECT 
    s.supplier_name,
    SUM(poi.quantity * poi.cost_price) AS total_purchase
FROM purchase_order_items poi
JOIN purchase_orders po ON poi.po_id = po.po_id
JOIN suppliers s ON po.supplier_id = s.supplier_id
GROUP BY s.supplier_id;

-- 4. Low-stock products
SELECT 
    p.product_name,
    i.quantity
FROM inventory i
JOIN products p ON i.product_id = p.product_id
WHERE i.quantity < 10;
