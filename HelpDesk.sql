-- DROP DATABASE helpdesk;

CREATE DATABASE helpdesk;

SHOW DATABASES;

USE helpdesk;

CREATE TABLE companies (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nit VARCHAR(15) UNIQUE,
    company_name VARCHAR(200),
    status VARCHAR(20)
);

CREATE TABLE contacts (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    status VARCHAR(20),
    client_id BIGINT,
    FOREIGN KEY (client_id) REFERENCES clients(id)
);

CREATE TABLE categories (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) UNIQUE,
    description VARCHAR(250) NOT NULL
);

CREATE TABLE tickets (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    description TEXT,
    priority VARCHAR(15),
    status VARCHAR(20),
    contact_id BIGINT,
    category_id BIGINT,
    FOREIGN KEY (contact_id) REFERENCES contacts(id),
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE technicians (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    specialty VARCHAR(100),
    status VARCHAR(20)
);

CREATE TABLE assigments (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    start_at DATETIME NOT NULL,
    end_at DATETIME,
    ticket_id BIGINT,
    technician_id BIGINT,
    FOREIGN KEY (ticket_id) REFERENCES tickets(id),
    FOREIGN KEY (technician_id) REFERENCES technicians(id)
);

CREATE TABLE assigments_history (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    previous_status VARCHAR(20),
    new_status VARCHAR(20),
    changed_at DATETIME,
    ticket_id BIGINT,
    technician_id BIGINT,
    FOREIGN KEY (ticket_id) REFERENCES tickets(id),
    FOREIGN KEY (technician_id) REFERENCES technicians(id)
);

CREATE TABLE comments (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    content TEXT,
    created_at DATETIME,
    contact_id BIGINT,
    ticket_id BIGINT,
    technician_id BIGINT,
    FOREIGN KEY (contact_id) REFERENCES contacts(id),
    FOREIGN KEY (ticket_id) REFERENCES tickets(id),
    FOREIGN KEY (technician_id) REFERENCES technicians(id)
);