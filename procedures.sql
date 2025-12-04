USE sales_inventory;
DELIMITER $$

CREATE PROCEDURE create_sale (
    IN p_customer_id INT,
    IN p_product_id INT,
    IN p_qty INT,
    IN p_price DECIMAL(10,2)
)
BEGIN
    INSERT INTO sales_orders(customer_id, order_date)
    VALUES (p_customer_id, CURRENT_TIMESTAMP);

    SET @last_so_id = LAST_INSERT_ID();

    INSERT INTO sales_order_items (so_id, product_id, quantity, selling_price)
    VALUES (@last_so_id, p_product_id, p_qty, p_price);
END $$

DELIMITER ;
