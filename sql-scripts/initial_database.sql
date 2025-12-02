-- Data Warehouse Schema
-- Do NOT create database - Docker already does this

-- Connect to the database
\c DataWarehouse;

-- Create dimension tables
CREATE TABLE dim_customer (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(50),
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE dim_product (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2) CHECK (price >= 0),
    supplier VARCHAR(100),
    in_stock BOOLEAN DEFAULT true
);

CREATE TABLE dim_time (
    time_id SERIAL PRIMARY KEY,
    full_date DATE UNIQUE NOT NULL,
    year INTEGER NOT NULL,
    quarter INTEGER NOT NULL,
    month INTEGER NOT NULL,
    month_name VARCHAR(20),
    day INTEGER NOT NULL,
    day_of_week INTEGER,
    day_name VARCHAR(20),
    is_weekend BOOLEAN,
    is_holiday BOOLEAN DEFAULT false
);

-- Create fact table
CREATE TABLE sales_fact (
    sale_id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES dim_customer(customer_id),
    product_id INTEGER REFERENCES dim_product(product_id),
    time_id INTEGER REFERENCES dim_time(time_id),
    amount DECIMAL(10,2) NOT NULL CHECK (amount >= 0),
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    discount DECIMAL(5,2) DEFAULT 0 CHECK (discount BETWEEN 0 AND 100),
    total_amount DECIMAL(10,2) GENERATED ALWAYS AS (amount * quantity * (1 - discount/100)) STORED,
    sale_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Indexes for faster queries
CREATE INDEX idx_sales_customer ON sales_fact(customer_id);
CREATE INDEX idx_sales_product ON sales_fact(product_id);
CREATE INDEX idx_sales_time ON sales_fact(time_id);
CREATE INDEX idx_sales_date ON sales_fact(sale_timestamp);
CREATE INDEX idx_customer_country ON dim_customer(country);
CREATE INDEX idx_product_category ON dim_product(category);
CREATE INDEX idx_time_date ON dim_time(full_date);