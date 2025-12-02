-- Insert sample customers
INSERT INTO dim_customer (customer_name, email, city, country) VALUES
('John Smith', 'john.smith@email.com', 'New York', 'USA'),
('Maria Garcia', 'maria.garcia@email.com', 'Madrid', 'Spain'),
('David Chen', 'david.chen@email.com', 'Beijing', 'China'),
('Emma Wilson', 'emma.wilson@email.com', 'London', 'UK'),
('Alex Johnson', 'alex.johnson@email.com', 'Sydney', 'Australia'),
('Sophie Martin', 'sophie.martin@email.com', 'Paris', 'France');

-- Insert sample products
INSERT INTO dim_product (product_name, category, price, supplier) VALUES
('MacBook Pro 16"', 'Electronics', 2499.99, 'Apple Inc.'),
('Wireless Mouse', 'Electronics', 49.99, 'Logitech'),
('Office Chair', 'Furniture', 299.50, 'IKEA'),
('Notebook Set', 'Stationery', 24.99, 'Moleskine'),
('Coffee Maker', 'Home Appliances', 89.99, 'Nespresso'),
('Desk Lamp', 'Furniture', 45.00, 'Philips');

-- Insert time dimension data (January 2024)
INSERT INTO dim_time (full_date, year, quarter, month, month_name, day, day_of_week, day_name, is_weekend) VALUES
('2024-01-15', 2024, 1, 1, 'January', 15, 1, 'Monday', false),
('2024-01-16', 2024, 1, 1, 'January', 16, 2, 'Tuesday', false),
('2024-01-17', 2024, 1, 1, 'January', 17, 3, 'Wednesday', false),
('2024-01-18', 2024, 1, 1, 'January', 18, 4, 'Thursday', false),
('2024-01-19', 2024, 1, 1, 'January', 19, 5, 'Friday', false),
('2024-01-20', 2024, 1, 1, 'January', 20, 6, 'Saturday', true),
('2024-01-21', 2024, 1, 1, 'January', 21, 7, 'Sunday', true);

-- Insert sample sales transactions
INSERT INTO sales_fact (customer_id, product_id, time_id, amount, quantity, discount) VALUES
(1, 1, 1, 2499.99, 1, 0),      -- John buys MacBook
(2, 3, 2, 299.50, 2, 10),      -- Maria buys 2 chairs with 10% discount
(3, 5, 3, 89.99, 1, 0),        -- David buys coffee maker
(4, 4, 4, 24.99, 3, 5),        -- Emma buys 3 notebooks with 5% discount
(5, 2, 5, 49.99, 1, 15),       -- Alex buys mouse with 15% discount
(6, 6, 6, 45.00, 1, 0),        -- Sophie buys lamp on Saturday
(1, 2, 7, 49.99, 2, 0),        -- John buys 2 mice on Sunday
(2, 4, 1, 24.99, 1, 0);        -- Maria buys notebook