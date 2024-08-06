-- Create the database
CREATE DATABASE IF NOT EXISTS ProductDB;
USE ProductDB;

-- Create the Products table
CREATE TABLE IF NOT EXISTS Products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    category VARCHAR(255),
    image VARCHAR(255),
    status VARCHAR(50),
    tags TEXT,
    created_by VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the ProductRestrictions table
CREATE TABLE IF NOT EXISTS ProductRestrictions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    type VARCHAR(255),
    sub_type VARCHAR(255),
    value VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES Products(id)
);

-- Create the ProductTypes table
CREATE TABLE IF NOT EXISTS ProductTypes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    status VARCHAR(50)
);

-- Create the ProductTypeAmounts table
CREATE TABLE IF NOT EXISTS ProductTypeAmounts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    type_id INT NOT NULL,
    price DECIMAL(10, 2),
    currency VARCHAR(50),
    status VARCHAR(50),
    FOREIGN KEY (product_id) REFERENCES Products(id),
    FOREIGN KEY (type_id) REFERENCES ProductTypes(id)
);

-- Create the ProductTypeDistributions table
CREATE TABLE IF NOT EXISTS ProductTypeDistributions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    status VARCHAR(50)
);

-- Create the ProductTypeDistributionAmounts table
CREATE TABLE IF NOT EXISTS ProductTypeDistributionAmounts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_type_amount_id INT NOT NULL,
    product_type_distribution_id INT NOT NULL,
    amount DECIMAL(10, 2),
    FOREIGN KEY (product_type_amount_id) REFERENCES ProductTypeAmounts(id),
    FOREIGN KEY (product_type_distribution_id) REFERENCES ProductTypeDistributions(id)
);

-- Create a temporary debug table
CREATE TABLE IF NOT EXISTS DebugLogs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    log_message VARCHAR(255) NOT NULL,
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
