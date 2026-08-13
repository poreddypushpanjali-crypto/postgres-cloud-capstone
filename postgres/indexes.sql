CREATE INDEX idx_orders_customer_date
ON orders(customer_id, order_date DESC);

CREATE INDEX idx_orders_status
ON orders(status);

CREATE INDEX idx_order_items_product
ON order_items(product_id);

CREATE INDEX idx_products_attributes
ON products USING GIN(attributes);

CREATE INDEX idx_orders_recent
ON orders(order_date DESC)
WHERE status IN ('PLACED','SHIPPED');
