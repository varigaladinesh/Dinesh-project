--View Current Stock Across Warehouses
SELECT 
    p.product_name,
    w.warehouse_name,
    s.quantity
FROM Stock s
JOIN Products p ON s.product_id = p.product_id
JOIN Warehouses w ON s.warehouse_id = w.warehouse_id
ORDER BY p.product_name, w.warehouse_name;

--Reorder Alert – Products Below Reorder Level
SELECT 
    p.product_name,
    w.warehouse_name,
    s.quantity,
    p.reorder_level
FROM Stock s
JOIN Products p ON s.product_id = p.product_id
JOIN Warehouses w ON s.warehouse_id = w.warehouse_id
WHERE s.quantity < p.reorder_level
ORDER BY s.quantity ASC;

--Total Stock per Product (All Warehouses Combined)
SELECT 
    p.product_name,
    SUM(s.quantity) AS total_quantity
FROM Stock s
JOIN Products p ON s.product_id = p.product_id
GROUP BY p.product_id
ORDER BY total_quantity DESC;

--Total Inventory Count per Warehouse
SELECT 
    w.warehouse_name,
    SUM(s.quantity) AS total_stock
FROM Stock s
JOIN Warehouses w ON s.warehouse_id = w.warehouse_id
GROUP BY w.warehouse_id
ORDER BY total_stock DESC;

--Products Supplied by Each Supplier
SELECT 
    s.supplier_name,
    p.product_name
FROM Product_Supplier ps
JOIN Suppliers s ON ps.supplier_id = s.supplier_id
JOIN Products p ON ps.product_id = p.product_id
ORDER BY s.supplier_name;

--Find Warehouses with Specific Product (e.g., 'Laptop')
SELECT 
    w.warehouse_name,
    s.quantity
FROM Stock s
JOIN Warehouses w ON s.warehouse_id = w.warehouse_id
JOIN Products p ON s.product_id = p.product_id
WHERE p.product_name = 'Laptop';

--List Products Not in Stock at Any Warehouse
SELECT 
    p.product_name
FROM Products p
LEFT JOIN Stock s ON p.product_id = s.product_id
GROUP BY p.product_id
HAVING SUM(s.quantity) IS NULL OR SUM(s.quantity) = 0;

--Top 5 Most Stocked Products
SELECT 
    p.product_name,
    SUM(s.quantity) AS total_quantity
FROM Stock s
JOIN Products p ON s.product_id = p.product_id
GROUP BY p.product_id
ORDER BY total_quantity DESC
LIMIT 5;

--Low Stock by Percentage (Products < 25% of Reorder Level)
SELECT 
    p.product_name,
    w.warehouse_name,
    s.quantity,
    p.reorder_level,
    ROUND((s.quantity / p.reorder_level) * 100, 2) AS stock_percent
FROM Stock s
JOIN Products p ON s.product_id = p.product_id
JOIN Warehouses w ON s.warehouse_id = w.warehouse_id
WHERE s.quantity < (0.25 * p.reorder_level);

--Search Products by Keyword ('SSD', 'Mouse', etc.)
SELECT * FROM Products
WHERE product_name LIKE '%SSD%'
   OR description LIKE '%SSD%';
