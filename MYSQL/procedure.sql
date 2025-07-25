DELIMITER $$

CREATE PROCEDURE TransferStock (
    IN prod_id INT,
    IN from_wh INT,
    IN to_wh INT,
    IN qty INT
)
BEGIN
    DECLARE from_qty INT;

    SELECT quantity INTO from_qty FROM Stock 
    WHERE product_id = prod_id AND warehouse_id = from_wh;

    IF from_qty >= qty THEN
        UPDATE Stock SET quantity = quantity - qty 
        WHERE product_id = prod_id AND warehouse_id = from_wh;

        INSERT INTO Stock (product_id, warehouse_id, quantity)
        VALUES (prod_id, to_wh, qty)
        ON DUPLICATE KEY UPDATE quantity = quantity + qty;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Not enough stock to transfer';
    END IF;
END$$

DELIMITER ;
