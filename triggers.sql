USE sales_inventory;

DELIMITER $$

-- ============================
-- Trigger: Stock In (Purchase)
-- ============================
CREATE TRIGGER trg_purchase_stock_in
AFTER INSERT ON purchase_order_items
FOR EACH ROW
BEGIN
    UPDATE inventory
    SET quantity = quantity + NEW.quantity
    WHERE product_id = NEW.product_id;
END $$


-- ============================
-- Trigger: Stock Out (Sales)
-- ============================
CREATE TRIGGER trg_sales_stock_out
AFTER INSERT ON sales_order_items
FOR EACH ROW
BEGIN
    UPDATE inventory
    SET quantity = quantity - NEW.quantity
    WHERE product_id = NEW.product_id;
END $$

DELIMITER ;
