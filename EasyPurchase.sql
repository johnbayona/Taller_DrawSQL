-- DROP DATABASE easypurchase;

CREATE DATABASE easypurchase;

SHOW DATABASES;

USE easypurchase;

CREATE TABLE employees (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(15) UNIQUE,
    email BIGINT,  
);

CREATE TABLE products (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(100),
    sunit_measure varchar(100),
);

CREATE TABLE suppliers (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) UNIQUE,
    code VARCHAR(100),
    email VARCHAR(100),
    status BOOLEAN,
);

CREATE TABLE purchases_requests (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    request_date DATETIME NOT NULL,
    status VARCHAR(20),
    employees_id BIGINT,
    FOREIGN KEY (employees_id) REFERENCES employees(id)
);

CREATE TABLE purchases_request_items (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    quantity_requested DECIMAL(10, 2),
    product_id VARCHAR(100),
    REQUEST_ID BIGINT,
);

CREATE TABLE purchases_orders (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    norder_date DATETIME NOT NULL,
    status ENUM('PENDING', 'APPROVED', 'REJECTED'),
    supplier_id VARCHAR(100),
    request_id BIGINT,
    FOREIGN KEY (request_id) REFERENCES purchases_requests(id)
);


CREATE TABLE purchases_orders_items (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    ordered_quantity DECIMAL(10, 2),
    unit_prince BIGINT,
    order_id BIGINT,
    request_item_id BIGINT,
    FOREIGN KEY (order_id) REFERENCES purchases_orders(id),
    FOREIGN KEY (request_item_id) REFERENCES purchases_request_items(id)
);

CREATE TABLE receipts (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    receipt_date DATETIME NOT NULL,
    remission_number VARCHAR(100),
    observations VARCHAR(100),
    order_id BIGINT,
    FOREIGN KEY (order_id) REFERENCES purchases_orders(id)
);

CREATE TABLE receipt_items (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    received_quantity DECIMAL(10, 2),
    receipt_id BIGINT,
    order_item_id BIGINT,
    FOREIGN KEY (order_item_id) REFERENCES purchases_orders_items(id)
);