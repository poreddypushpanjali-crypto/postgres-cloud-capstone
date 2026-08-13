INSERT INTO customers(full_name,email,city) VALUES
('Ananya Rao','ananya@example.com','Hyderabad'),
('Rahul Kumar','rahul@example.com','Vijayawada'),
('Meera Sharma','meera@example.com','Chennai'),
('Arjun Patel','arjun@example.com','Bengaluru'),
('Priya Nair','priya@example.com','Kochi');

INSERT INTO products(product_name,category,price,attributes) VALUES
('Laptop Pro 14','Electronics',85000,'{"brand":"TechOne","ram":"16GB"}'),
('Wireless Mouse','Accessories',1200,'{"brand":"TechOne","type":"wireless"}'),
('Mechanical Keyboard','Accessories',4500,'{"brand":"KeyPro","switch":"blue"}'),
('Monitor 27','Electronics',22000,'{"brand":"ViewMax","size":"27"}'),
('USB-C Hub','Accessories',2800,'{"brand":"ConnectX","ports":8}');

INSERT INTO orders(customer_id,order_date,status,total_amount) VALUES
(1,'2026-01-10','DELIVERED',86200),
(2,'2026-02-14','DELIVERED',4500),
(3,'2026-03-08','PLACED',24800),
(4,'2026-04-12','DELIVERED',87800),
(5,'2026-05-21','SHIPPED',7300),
(1,'2026-06-04','DELIVERED',30800),
(2,'2026-06-15','PLACED',1200),
(3,'2026-07-03','DELIVERED',22000);

INSERT INTO order_items(order_id,product_id,quantity,unit_price) VALUES
(1,1,1,85000),(1,2,1,1200),
(2,3,1,4500),
(3,4,1,22000),(3,2,1,1200),(3,5,1,1600),
(4,1,1,85000),(4,5,1,2800),
(5,3,1,4500),(5,2,1,1200),(5,5,1,1600),
(6,4,1,22000),(6,3,1,4500),(6,5,1,2800),(6,2,1,1200),
(7,2,1,1200),
(8,4,1,22000);
