# warehouse-inventory-system
Here’s a professional and structured `README.md` file for your **Inventory and Warehouse Management System** project:

---

````markdown
# 🏭 Inventory and Warehouse Management System

This project is a MySQL-based backend system designed to efficiently manage inventory across multiple warehouses. It includes support for tracking products, monitoring stock levels, handling low-stock alerts, and managing supplier-product relationships.


---

## 📑 Table of Contents

- [Features](#features)
- [Tech Stack](#tech-stack)
- [Entity Relationship Diagram](#entity-relationship-diagram)
- [Schema Overview](#schema-overview)
- [Sample Data](#sample-data)
- [Queries](#queries)
- [Triggers](#triggers)
- [Stored Procedures](#stored-procedures)
- [Setup Instructions](#setup-instructions)
- [Project Structure](#project-structure)

---

## ✅ Features

- Manage products and their stock across warehouses
- Automatically alert on low inventory
- Transfer stock between warehouses using stored procedures
- Track which suppliers provide which products
- Easily extendable and normalized schema

---

## 🧰 Tech Stack

| Component      | Tool       |
|----------------|------------|
| Database       | MySQL 8.x  |
| GUI Tool       | DBeaver    |
| ER Diagram     | drawSQL / ERD Tool |
| Sample Data    | SQL Inserts |
| Version Control| Git + GitHub |

---

## 🧩 Entity Relationship Diagram

![ER Diagram](ER_diagram/ERD.png)

This ERD shows the core entities: **Products**, **Warehouses**, **Suppliers**, **Stock**, **Product_Supplier**, and **StockAlerts** with their relationships and constraints.

---

## 🗂️ Schema Overview

- `Products(product_id, product_name, description, reorder_level)`
- `Warehouses(warehouse_id, warehouse_name, location)`
- `Suppliers(supplier_id, supplier_name, contact_info)`
- `Stock(stock_id, product_id, warehouse_id, quantity)`
- `Product_Supplier(product_id, supplier_id)`
- `StockAlerts(alert_id, product_id, warehouse_id, current_quantity, alert_time)`

---

## 🧪 Sample Data

Includes over 50+ records:
- 10+ warehouses
- 15+ products
- 10+ suppliers
- 50+ stock entries
- 20+ supplier-product mappings



---

## 🔍 Queries

Useful SQL queries to retrieve inventory insights:

- Products low in stock:
  ```sql
  SELECT p.product_name, w.warehouse_name, s.quantity
  FROM Stock s
  JOIN Products p ON s.product_id = p.product_id
  JOIN Warehouses w ON s.warehouse_id = w.warehouse_id
  WHERE s.quantity < p.reorder_level;
````

* Total stock per product:

  ```sql
  SELECT p.product_name, SUM(s.quantity) AS total_stock
  FROM Stock s
  JOIN Products p ON s.product_id = p.product_id
  GROUP BY p.product_name;
  ```

* Warehouses holding a specific product:

  ```sql
  SELECT w.warehouse_name, s.quantity
  FROM Stock s
  JOIN Warehouses w ON s.warehouse_id = w.warehouse_id
  WHERE s.product_id = 3;
  ```

📁 More queries: `03_queries/useful_queries.sql`

---

## ⚠️ Triggers

### 1. `low_stock_alert_trigger`

Automatically logs an alert when stock falls below reorder level.

### 2. `prevent_negative_stock_trigger`

Prevents any stock from becoming negative.

📁 Triggers defined in: `04_triggers/triggers.sql`

---

## ⚙️ Stored Procedure

### `transfer_stock`

Transfers stock from one warehouse to another while validating quantity availability.

**Parameters:**

* `IN product INT`
* `IN from_wh INT`
* `IN to_wh INT`
* `IN qty INT`




---

```

Let me know if you'd like this README formatted for PDF or added directly into your GitHub repo with a live link and description.
```
