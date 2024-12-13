DROP DATABASE IF EXISTS 	Sale_Management;
CREATE DATABASE 			Sale_Management;
USE 						Sale_Management;

DROP TABLE IF EXISTS 	Customers;
CREATE TABLE 			Customers
(
	customer_id				TINYINT PRIMARY KEY,
    first_name				VARCHAR(10) NOT NULL,
    last_name				VARCHAR(10) NOT NULL,
    email_address			VARCHAR(50),
    number_of_complaints	TINYINT
);

DROP TABLE IF EXISTS 	Items;
CREATE TABLE 			Items
(
	item_code					CHAR(3) PRIMARY KEY,
    item						VARCHAR(30) NOT NULL,
    unit_price_usd				DECIMAL(18,4) NOT NULL,
    company_id					TINYINT,
    headquarters_phone_number	CHAR(16)
);

DROP TABLE IF EXISTS 	SALES;
CREATE TABLE 			SALES
(
	purchase_number		SMALLINT PRIMARY KEY,
    date_of_purchase	DATE,
    customer_id			TINYINT,
    item_code			CHAR(3),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
	FOREIGN KEY (item_code) REFERENCES Items(item_code)
);