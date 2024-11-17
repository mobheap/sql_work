create database if not exists sales;
use sales;
CREATE TABLE IF NOT EXISTS sales (
    purchase_number INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    date_of_purchase DATE NOT NULL,
    customer_id INT,
    item_code VARCHAR(10) NOT NULL
);
CREATE TABLE IF NOT EXISTS customers (
    customer_id INT NOT NULL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_adress VARCHAR(255),
    number_of_complaints INT
);
SELECT 
    *
FROM
    sales;
SELECT 
    *
FROM
    sales.sales;
drop table sales;
CREATE TABLE IF NOT EXISTS items (
    item_code VARCHAR(255),
    item VARCHAR(255),
    unit_price NUMERIC(10 , 2 ),
    company_id VARCHAR(255)
);
CREATE TABLE IF NOT EXISTS companies (
    company_id VARCHAR(255),
    company_name VARCHAR(255),
    headquarters_phone_number INTEGER(12)
);
CREATE TABLE IF NOT EXISTS sales (
    purchase_number INT AUTO_INCREMENT,
    date_of_purchase DATE,
    customer_id INT,
    item_code VARCHAR(10),
    PRIMARY KEY (purchase_number)
);
alter table sales
add foreign key (customer_id) references customers(customer_id) on delete cascade;
alter table customers
add unique key (email_adress);
alter table customers
drop index email_adress;
alter table sales
drop FOREIGN KEY sales_ibfk_1;
alter table customers
modify customer_id int auto_increment;
alter table customers
add column gender enum('M', 'F') after last_name;
insert into customers(first_name, last_name, gender, email_adress, number_of_complaints)
values ('John', 'Mackinley', 'M', 'john.mchinley@mail.com', 0);
alter table customers
change column number_of_complaints number_of_complaints int DEFAULT 0;
insert into customers (first_name, last_name, gender)
values ('Peter', 'Figaro', 'M');
SELECT 
    *
FROM
    customers;
alter table companies
modify company_name VARCHAR(255) DEFAULT 'X',
add constraint unique(headquarters_phone_number);
alter table companies
change column company_name company_name varchar(255) not null;
alter table companies
modify headquarters_phone_number VARCHAR(255) null;
alter table companies
change column headquarters_phone_number headquarters_phone_number varchar(255) not null;