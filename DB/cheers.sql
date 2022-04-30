CREATE SCHEMA `cheers_dineIn_experience` ;

CREATE TABLE customers
(cust_id INT(8) NOT NULL,
cust_first_name varchar(20) NOT NULL,
cust_last_name varchar(20) NOT NULL,
PRIMARY KEY(cust_id)
);

CREATE TABLE roles
(role_id INT(8) NOT NULL,
role_name varchar(20) NOT NULL,
role_admin bool NOT NULL,
PRIMARY KEY(role_id)
);

# following will fall due to employee table not existing yet
CREATE TABLE restaurant
(restaurant_id INT(8) NOT NULL,
restaurant_name varchar(20) NOT NULL,
restaurant_address varchar(25) NOT NULL,
restaurant_city varchar(20) NOT NULL,
restaurant_state varchar(20) NOT NULL,
restaurant_zip INT(5) NOT NULL,
restaurant_country varchar(25) NOT NULL,
restaurant_phone INT(12) NOT NULL,
restaurant_email varchar(20) NOT NULL,
restaurant_website varchar(20) NOT NULL,
restaurant_manager varchar(20) NOT NULL,
PRIMARY KEY(restaurant_id,
FOREIGN KEY (restaurant_manager) REFERENCES employees(employee_id)
);


CREATE TABLE employees
(employee_id INT(8) NOT NULL,
employee_first_name varchar(20) NOT NULL,
employee_last_name varchar(20) NOT NULL,
employee_role_id INT(8) NOT NULL,
employee_restaurant_id INT(8) NOT NULL,
PRIMARY KEY(employee_id),
FOREIGN KEY (employee_role_id) REFERENCES roles(role_id),
FOREIGN KEY (employee_restaurant_id) REFERENCES restaurant(restaurant_id)
);

#making jugment calls here on the data types
CREATE TABLE menu
(menu_id INT(8) NOT NULL,
menu_name varchar(20) NOT NULL,
menu_open TIMESTAMP,
menu_close TIMESTAMP,
menu_comments TINYTEXT,
restaurant_id INT(8) NOT NULL,
PRIMARY KEY(menu_id),
FOREIGN KEY (restaurant_id) REFERENCES restaurant(restaurant_id)
);

#making more calls on these data types
CREATE TABLE dishes
(dishes_id INT(8) NOT NULL,
dishes_name varchar(20) NOT NULL,
dishes_cost decimal(15,2) NOT NULL,
dish_prep_time decimal(8,2),
dish_comments TINYTEXT,
menu_id INT(8) NOT NULL,
PRIMARY KEY(dishes_id),
FOREIGN KEY (menu_id) REFERENCES menu(menu_id)
);


CREATE TABLE table
(table_id INT(8) NOT NULL,
restaurant_id INT(8) NOT NULL,
table_notes TINYTEXT,
PRIMARY KEY(table_id),
FOREIGN KEY (restaurant_id) REFERENCES restaurant(restaurant_id)
);

CREATE TABLE orders
(order_id INT(8) NOT NULL,
order_number INT(8) NOT NULL,
order_cost decimal(15,2) NOT NULL,
order_status varchar(20) NOT NULL,
order_date DATETIME NOT NULL,
order_notes TINYTEXT,
cust_id INT(8) NOT NULL,
table_id INT(8) NOT NULL,
PRIMARY KEY(order_id),
FOREIGN KEY (cust_id) REFERENCES customers(cust_id),
FOREIGN KEY (table_id) REFERENCES table(table_id)
);

CREATE TABLE ordered_items
(orditm_id INT(8) NOT NULL,
order_id INT(8) NOT NULL,
orditm_status varchar(20) NOT NULL,
orditm_notes TINYTEXT,
orditm_cost decimal(15,2) NOT NULL,
orditm_qty INT(8) NOT NULL,
PRIMARY KEY(orditm_id),
FOREIGN KEY (order_id) REFERENCES orders(order_id)
);



CREATE TABLE payments
(payment_id INT(8) NOT NULL,
payment_cc_num INT(16) NOT NULL,
payment_cc_exp DATE NOT NULL,
payment_cc_cvv INT(5) NOT NULL,
payment_cc_zip INT(5) NOT NULL,
order_id INT(8) NOT NULL,
PRIMARY KEY(payment_id),
FOREIGN KEY (order_id) REFERENCES orders(order_id)
);


CREATE TABLE reviews
(review_id INT(8) NOT NULL,
review_rating INT(3) NOT NULL,
review_notes TINYTEXT NOT NULL,
order_id INT(8) NOT NULL,
PRIMARY KEY(review_id),
FOREIGN KEY (order_id) REFERENCES orders(order_id)
);


















