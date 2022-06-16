CREATE DATABASE IF NOT EXISTS db_test;
USE db_test;

CREATE TABLE IF NOT EXISTS roles(
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE IF NOT EXISTS clients(
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE IF NOT EXISTS users(
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE IF NOT EXISTS products(
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE IF NOT EXISTS services(
	id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE IF NOT EXISTS sells(
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE IF NOT EXISTS sold_products(
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE IF NOT EXISTS sold_services(
	id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE IF NOT EXISTS system_log(
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user TEXT NOT NULL,
    registry TEXT NOT NULL,
    table_name TEXT NOT NULL,
    row_id INT NOT NULL,
    date_time DATETIME DEFAULT NOW()
);

ALTER TABLE roles
    ADD COLUMN IF NOT EXISTS name TEXT NOT NULL;

ALTER TABLE clients
    ADD COLUMN IF NOT EXISTS name TEXT NOT NULL,
    ADD COLUMN IF NOT EXISTS id_card TEXT NOT NULL;

ALTER TABLE users
    ADD COLUMN IF NOT EXISTS name TEXT NOT NULL,
    ADD COLUMN IF NOT EXISTS email TEXT NOT NULL,
    ADD COLUMN IF NOT EXISTS password TEXT NOT NULL,
    ADD COLUMN IF NOT EXISTS role_id INT(11) NOT NULL,
    ADD FOREIGN KEY IF NOT EXISTS (role_id) REFERENCES roles(id);

ALTER TABLE products
    ADD COLUMN IF NOT EXISTS name TEXT NOT NULL,
    ADD COLUMN IF NOT EXISTS description TEXT NOT NULL,
    ADD COLUMN IF NOT EXISTS cost FLOAT(11) NOT NULL,
    ADD COLUMN IF NOT EXISTS sell_price FLOAT(11) NOT NULL,
    ADD COLUMN IF NOT EXISTS quantity INT(11) NOT NULL;

ALTER TABLE sold_products
    ADD COLUMN IF NOT EXISTS sell_id INT(11) NOT NULL,
    ADD COLUMN IF NOT EXISTS name TEXT NOT NULL,
    ADD COLUMN IF NOT EXISTS description TEXT NOT NULL,
    ADD COLUMN IF NOT EXISTS sell_price FLOAT(11) NOT NULL,
    ADD COLUMN IF NOT EXISTS quantity INT(11) NOT NULL,
    ADD FOREIGN KEY (sell_id) REFERENCES sells(id);

ALTER TABLE sells
    ADD COLUMN IF NOT EXISTS client_name TEXT NOT NULL,
    ADD COLUMN IF NOT EXISTS client_id_card TEXT NOT NULL,
    ADD COLUMN IF NOT EXISTS user_name TEXT NOT NULL,
    ADD COLUMN IF NOT EXISTS sell_datetime DATETIME DEFAULT NOW();


ALTER TABLE services
    ADD COLUMN IF NOT EXISTS name TEXT NOT NULL,
    ADD COLUMN IF NOT EXISTS description TEXT NOT NULL,
    ADD COLUMN IF NOT EXISTS cost FLOAT(11) NOT NULL,
    ADD COLUMN IF NOT EXISTS sell_price FLOAT(11) NOT NULL;

ALTER TABLE sold_services
    ADD COLUMN IF NOT EXISTS sell_id INT(11) NOT NULL,
    ADD COLUMN IF NOT EXISTS name TEXT NOT NULL,
    ADD COLUMN IF NOT EXISTS description TEXT NOT NULL,
    ADD COLUMN IF NOT EXISTS sell_price FLOAT(11) NOT NULL,
    ADD FOREIGN KEY IF NOT EXISTS (sell_id) REFERENCES sells(id);
