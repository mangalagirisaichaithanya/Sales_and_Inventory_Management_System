USE sales_inventory;

-- Suppliers
INSERT INTO suppliers (supplier_name, contact_person, phone) VALUES
('TechSource Ltd', 'Amit Shah', '999112233'),
('FreshFarms Traders', 'Neha Singh', '888445566');

-- Customers
INSERT INTO customers (customer_name, email, phone) VALUES
('Rahul Gupta', 'rahul@example.com', '999887766'),
('Sneha Verma', 'sneha@example.com', '999223344');

-- Products
INSERT INTO products (product_name, supplier_id, unit_price) VALUES
('Laptop', 1, 55000),
('Keyboard', 1, 700),
('Organic Rice 5kg', 2, 350),
('Wheat Flour 10kg', 2, 420);

-- Inventory init (set all products to zero)
INSERT INTO inventory (product_id, quantity)
SELECT product_id, 0 FROM products;

-- Purchase Orders
INSERT INTO purchase_orders (supplier_id) VALUES (1), (2);

INSERT INTO purchase_order_items (po_id, product_id, quantity, cost_price) VALUES
(1, 1, 20, 50000),
(1, 2, 50, 500),
(2, 3, 40, 300),
(2, 4, 30, 350);

-- Sales Orders
INSERT INTO sales_orders (customer_id) VALUES (1), (2);

INSERT INTO sales_order_items (so_id, product_id, quantity, selling_price) VALUES
(1, 1, 2, 60000),
(1, 2, 5, 800),
(2, 3, 3, 400);
