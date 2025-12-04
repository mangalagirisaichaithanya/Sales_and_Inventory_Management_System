DROP DATABASE IF EXISTS sales_inventory;
CREATE DATABASE sales_inventory;
USE sales_inventory;

-- ============================
-- 1. Suppliers
-- ============================
CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name VARCHAR(100) NOT NULL,
    contact_person VARCHAR(100),
    phone VARCHAR(20)
);

-- ============================
-- 2. Customers
-- ============================
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20)
);

-- ============================
-- 3. Products
-- ============================
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    supplier_id INT,
    unit_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

-- ============================
-- 4. Inventory (1:1 with products)
-- ============================
CREATE TABLE inventory (
    product_id INT PRIMARY KEY,
    quantity INT DEFAULT 0 CHECK (quantity >= 0),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- ============================
-- 5. Purchase Orders (Stock In)
-- ============================
CREATE TABLE purchase_orders (
    po_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

-- Purchase order items
CREATE TABLE purchase_order_items (
    po_item_id INT PRIMARY KEY AUTO_INCREMENT,
    po_id INT,
    product_id INT,
    quantity INT NOT NULL,
    cost_price DECIMAL(10,2),
    FOREIGN KEY (po_id) REFERENCES purchase_orders(po_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- ============================
-- 6. Sales Orders (Stock Out)
-- ============================
CREATE TABLE sales_orders (
    so_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Sales order items
CREATE TABLE sales_order_items (
    so_item_id INT PRIMARY KEY AUTO_INCREMENT,
    so_id INT,
    product_id INT,
    quantity INT NOT NULL,
    selling_price DECIMAL(10,2),
    FOREIGN KEY (so_id) REFERENCES sales_orders(so_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- ============================
-- 7. Indexes
-- ============================
CREATE INDEX idx_supplier_product ON products(supplier_id);
CREATE INDEX idx_sales_date ON sales_orders(order_date);
