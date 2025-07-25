
INSERT INTO Products (product_name, description, reorder_level) VALUES
('Laptop', 'Dell Inspiron 14', 5),
('Mouse', 'Logitech Wireless', 10),
('Keyboard', 'RGB Mechanical', 7),
('Monitor', 'Samsung 24"', 8),
('SSD', 'Samsung 1TB SSD', 5),
('HDD', 'Seagate 2TB HDD', 6),
('Printer', 'HP LaserJet Pro', 3),
('Router', 'TP-Link Archer', 4),
('Switch', 'Cisco 24-Port Switch', 4),
('Headset', 'Sony WH-CH520', 6);


INSERT INTO Warehouses (warehouse_name, location) VALUES
('Central Depot', 'Mumbai'),
('North Depot', 'Delhi'),
('South Depot', 'Chennai'),
('West Depot', 'Pune'),
('East Depot', 'Kolkata');


INSERT INTO Suppliers (supplier_name, contact_info) VALUES
('TechWorld', 'tech@world.com'),
('Global Supplies', 'global@supplies.com'),
('ElectroMart', 'contact@emart.com'),
('Gadget King', 'king@gadget.com'),
('Peripheral Co', 'info@peripheral.com'),
('MegaStore', 'support@megastore.com'),
('Smart Supplies', 'smart@supplies.com'),
('Digital Planet', 'sales@dp.com'),
('PC Parts Ltd', 'pc@parts.com'),
('Device House', 'service@devicehouse.com');


INSERT INTO Product_Supplier (product_id, supplier_id) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
(1, 2), (2, 3), (3, 4), (4, 5), (5, 6),
(6, 7), (7, 8), (8, 9), (9, 10), (10, 1);


INSERT INTO Stock (product_id, warehouse_id, quantity) VALUES
(1, 1, 20), (2, 1, 8), (3, 1, 12), (4, 1, 5), (5, 1, 4),
(1, 2, 3), (2, 2, 12), (3, 2, 6), (4, 2, 7), (6, 2, 10),
(5, 3, 15), (6, 3, 3), (7, 3, 2), (8, 3, 9), (9, 3, 5),
(10, 4, 10), (8, 4, 7), (9, 4, 3), (2, 4, 2), (1, 4, 4),
(7, 5, 1), (6, 5, 5), (5, 5, 6), (3, 5, 8), (4, 5, 4),
(1, 3, 6), (2, 3, 3), (10, 2, 5), (9, 1, 7), (8, 2, 6);
