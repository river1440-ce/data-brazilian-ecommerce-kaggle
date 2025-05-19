-- Customers table
ALTER TABLE customers
  ADD PRIMARY KEY (id);

-- Sellers table
ALTER TABLE sellers
  ADD PRIMARY KEY (id);

-- Geolocation
ALTER TABLE geolocation
  ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY;

-- Product Category Translation table
ALTER TABLE product_category_name_translation
  ADD PRIMARY KEY (product_category_name);

-- Products table
ALTER TABLE products
  ADD PRIMARY KEY (id),
  ADD FOREIGN KEY (product_category_name) REFERENCES product_category_name_translation(product_category_name);

-- Orders table
ALTER TABLE orders
  ADD PRIMARY KEY (id),
  ADD FOREIGN KEY (customer_id) REFERENCES customers(id);

-- Order Items table
ALTER TABLE order_items
  ADD PRIMARY KEY (order_id, order_item_id),
  ADD FOREIGN KEY (order_id) REFERENCES orders(id),
  ADD FOREIGN KEY (product_id) REFERENCES products(id),
  ADD FOREIGN KEY (seller_id) REFERENCES sellers(id);

-- Order Payments table
ALTER TABLE order_payments
  ADD PRIMARY KEY (order_id, payment_sequential),
  ADD FOREIGN KEY (order_id) REFERENCES orders(id);

-- Order Reviews table
ALTER TABLE order_reviews
  ADD PRIMARY KEY (review_id, order_id),
  ADD FOREIGN KEY (order_id) REFERENCES orders(id);
