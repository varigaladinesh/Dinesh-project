This ER diagram models a relational database used to track products, suppliers, warehouse stock, and inventory alerts. It consists of **six main entities** and clearly defines **relationships** between them using **primary keys (PK)** and **foreign keys (FK)**.

---

## 🧱 **Entities & Attributes**

### 1. **Products**

* **product\_id** (PK): Unique identifier for each product.
* **product\_name**: Name of the product.
* **description**: Details about the product.
* **reorder\_level**: Minimum quantity that should be maintained in stock.

🔗 **Relationships**:

* Connected to `Stock` (1-to-many)
* Connected to `Product_Supplier` (many-to-many)
* Connected to `StockAlerts` (1-to-many)

---

### 2. **Warehouses**

* **warehouse\_id** (PK): Unique ID for each warehouse.
* **warehouse\_name**: Name or code of the warehouse.
* **location**: City or site of the warehouse.

🔗 **Relationships**:

* Connected to `Stock` (1-to-many)
* Connected to `StockAlerts` (1-to-many)

---

### 3. **Suppliers**

* **supplier\_id** (PK): Unique identifier for suppliers.
* **supplier\_name**: Name of the company or individual.
* **contact\_info** *(optional)*: Email or phone (not shown in diagram but present in schema).

🔗 **Relationships**:

* Connected to `Product_Supplier` (1-to-many)

---

### 4. **Stock**

* **stock\_id** (PK): Unique record for a stock entry.
* **product\_id** (FK): Refers to `Products(product_id)`.
* **warehouse\_id** (FK): Refers to `Warehouses(warehouse_id)`.
* **quantity**: Number of units in that warehouse.

🔗 **Relationships**:

* Many-to-1 with `Products` and `Warehouses`

---

### 5. **Product\_Supplier** (Association/Join Table)

* **product\_id** (PK, FK): Refers to `Products(product_id)`.
* **supplier\_id** (PK, FK): Refers to `Suppliers(supplier_id)`.

🔁 **Many-to-Many Relationship**:

* A product can have multiple suppliers.
* A supplier can supply multiple products.

---

### 6. **StockAlerts**

* **alert\_id** (PK): Auto-generated ID for each alert.
* **product\_id** (FK): Refers to `Products(product_id)`.
* **warehouse\_id** (FK): Refers to `Warehouses(warehouse_id)`.
* **current\_quantity**: Quantity that triggered the alert.
* **alert\_time**: Timestamp of when the alert occurred.

🔔 **Purpose**:

* Automatically logs when stock falls below the `reorder_level`.

---

## 🔗 **Relationships Summary**

| Relationship             | Type         |
| ------------------------ | ------------ |
| Products → Stock         | One-to-Many  |
| Warehouses → Stock       | One-to-Many  |
| Products ↔ Suppliers     | Many-to-Many |
| Stock → StockAlerts      | One-to-Many  |
| Products → StockAlerts   | One-to-Many  |
| Warehouses → StockAlerts | One-to-Many  |

---

## 📌 Use Cases Supported by Diagram

* **Inventory tracking** per product and warehouse
* **Supplier management** for each product
* **Low stock alerts** and restocking triggers
* **Warehouse-specific reporting**
* **Audit logging** and stock change monitoring (via triggers)


