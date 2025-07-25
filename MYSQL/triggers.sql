-- Stock Alert Table
CREATE TABLE StockAlerts (
    alert_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    warehouse_id INT,
    current_quantity INT,
    alert_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Trigger
DELIMITER $$

CREATE TRIGGER trg_low_stock
AFTER UPDATE ON Stock
FOR EACH ROW
BEGIN
    IF NEW.quantity < (SELECT reorder_level FROM Products WHERE product_id = NEW.product_id) THEN
        INSERT INTO StockAlerts (product_id, warehouse_id, current_quantity)
        VALUES (NEW.product_id, NEW.warehouse_id, NEW.quantity);
    END IF;
END$$

DELIMITER ;


--Prevent stock quantity from going below zero during an update
DELIMITER $$

CREATE TRIGGER trg_prevent_negative_stock
BEFORE UPDATE ON Stock
FOR EACH ROW
BEGIN
    IF NEW.quantity < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Stock quantity cannot be negative.';
    END IF;
END$$

DELIMITER ;

--Log all stock updates (before and after) into a new log table
CREATE TABLE StockChangeLog (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    stock_id INT,
    product_id INT,
    warehouse_id INT,
    old_quantity INT,
    new_quantity INT,
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$

CREATE TRIGGER trg_log_stock_changes
AFTER UPDATE ON Stock
FOR EACH ROW
BEGIN
    INSERT INTO StockChangeLog (
        stock_id,
        product_id,
        warehouse_id,
        old_quantity,
        new_quantity
    )
    VALUES (
        NEW.stock_id,
        NEW.product_id,
        NEW.warehouse_id,
        OLD.quantity,
        NEW.quantity
    );
END$$

DELIMITER ;
