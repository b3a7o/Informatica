create DATABASE esPDO

use esPDO

create table customers(
    customer_id int not null AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(127) not null,
    email VARCHAR(255) not null,
    password varchar(255) not null
)

create table products(
    product_id int not null AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) not null,
    price int not null,
    is_available BOOLEAN 
)

create table orders(
    order_id int not null AUTO_INCREMENT PRIMARY KEY,
    product_id int not null,
    customer_id int not NULL,
    quantity int not null,
    Foreign Key (product_id) REFERENCES products(product_id),
    Foreign Key (customer_id) REFERENCES customers(customer_id)
)


select * from customers


insert into products(name, price, is_available) VALUES("yeezy", 200, true)


select * from customers