-- DROP DATABASE assetcontrol;

CREATE DATABASE assetcontrol;

SHOW DATABASES;

USE assetcontrol;

CREATE TABLE sites (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    site_name VARCHAR(15) UNIQUE,
    code VARCHAR(200),   
);

CREATE TABLE departaments (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    departament_name VARCHAR(100),
    site_id BIGINT,
    FOREIGN KEY (site_id) REFERENCES sites(id)
);

CREATE TABLE employees (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) UNIQUE,
    code VARCHAR(100),
    email VARCHAR(100),
    status VARCHAR(20),
    departament_id BIGINT,
    FOREIGN KEY (departament_id) REFERENCES departaments(id)
);

CREATE TABLE assets (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    patrimonial_identifier VARCHAR(100),
    serial_number VARCHAR(100),
    brand VARCHAR(100),
    model VARCHAR(100),
    purchase_date DATE,
    status VARCHAR(20),
    asset_types_id BIGINT,
    site_id BIGINT,
    FOREIGN KEY (site_id) REFERENCES sites(id),
    FOREIGN KEY (asset_types_id) REFERENCES asset_types(id)
);

CREATE TABLE assignments (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    assigned_date DATETIME NOT NULL,
    return_date DATETIME,
    collection_status boolean,
    employee_id BIGINT,
    asset_id BIGINT,
    FOREIGN KEY (employee_id) REFERENCES employees(id),
    FOREIGN KEY (asset_id) REFERENCES assets(id)
);

CREATE TABLE asset_types (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) UNIQUE,
);

CREATE TABLE amaintenance (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    start_date DATETIME,
    type boolean,
    description varchar(200),
    cost DECIMAL(10, 2),
    end_date DATETIME,
    result varchar(200),
    asset_id BIGINT,
    FOREIGN KEY (asset_id) REFERENCES assets(id)
);