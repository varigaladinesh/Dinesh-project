
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    description TEXT,
    reorder_level INT DEFAULT 10
);


CREATE TABLE Warehouses (
    warehouse_id INT AUTO_INCREMENT PRIMARY KEY,
    warehouse_name VARCHAR(100),
    location VARCHAR(100)
);

CREATE TABLE Suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(100),
    contact_info VARCHAR(100)
);


CREATE TABLE Stock (
    stock_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    warehouse_id INT,
    quantity INT DEFAULT 0,
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (warehouse_id) REFERENCES Warehouses(warehouse_id)
);


CREATE TABLE Product_Supplier (
    product_id INT,
    supplier_id INT,
    PRIMARY KEY (product_id, supplier_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);
