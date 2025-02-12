-- Creating the Supply Chain Optimization database
CREATE DATABASE supply_chain_optimization;
USE supply_chain_optimization;

-- Suppliers table
CREATE TABLE suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    contact_email VARCHAR(100),
    phone_number VARCHAR(20),
    location VARCHAR(100),
    reliability_score DECIMAL(3,2) CHECK (reliability_score BETWEEN 0 AND 10)
);

-- Warehouses table
CREATE TABLE warehouses (
    warehouse_id INT AUTO_INCREMENT PRIMARY KEY,
    warehouse_name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    capacity INT NOT NULL
);

-- Shipments table
CREATE TABLE shipments (
    shipment_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_id INT,
    warehouse_id INT,
    product_name VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    delivery_date DATE NOT NULL,
    status ENUM('Pending', 'In Transit', 'Delivered') DEFAULT 'Pending',
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
);

-- Inventory table
CREATE TABLE inventory (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    warehouse_id INT,
    product_name VARCHAR(100) NOT NULL,
    stock_level INT NOT NULL,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
);

-- Query to track pending shipments
SELECT * FROM shipments WHERE status = 'Pending';

-- Query to check stock levels per warehouse
SELECT warehouse_name, product_name, stock_level 
FROM inventory 
JOIN warehouses ON inventory.warehouse_id = warehouses.warehouse_id;
