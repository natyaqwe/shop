CREATE DATABASE clothing;
USE clothing;
CREATE TABLE IF NOT EXISTS `employee` (
	`employee_id` int AUTO_INCREMENT NOT NULL,
	`user_name` varchar(255) NOT NULL,
	`first_name` varchar(30) NOT NULL,
	`last_name` varchar(30) NOT NULL,
	`position` varchar(15) NOT NULL,
	`employment_date` date NOT NULL,
	`manager_id` int,
	`bonus` float,
	`gender` varchar(1) NOT NULL,
	`birth_date` date NOT NULL,
	PRIMARY KEY (`employee_id`)
);
CREATE TABLE IF NOT EXISTS `Warehouse` (
	`warehouse_id` INT AUTO_INCREMENT NOT NULL,
	`warehouse_name` VARCHAR(50) NOT NULL,
	`city` VARCHAR(50) NOT NULL,
	`street` VARCHAR(40) NOT NULL,
	`building_number` VARCHAR(10),
	PRIMARY KEY (`warehouse_id`)
);
CREATE TABLE IF NOT EXISTS `product` (
	 `product_id` INT AUTO_INCREMENT NOT NULL,
    `product_name` VARCHAR(100) NOT NULL,
    `product_description` VARCHAR(255),
    `category` VARCHAR(50) NOT NULL,
    `manufacture` VARCHAR(50) NOT NULL,
    `amount` INT NOT NULL,
    `price` FLOAT NOT NULL,
    `color` VARCHAR(30),
    `material` VARCHAR(50),
    `warehouse_id` INT NOT NULL,
    `size` VARCHAR(20),
    PRIMARY KEY (`product_id`)
);
CREATE TABLE IF NOT EXISTS `customer` (
	`customer_id` int AUTO_INCREMENT NOT NULL,
	`first_name` varchar(30) NOT NULL,
	`last_name` varchar(30) NOT NULL,
	`user_name` varchar(30) NOT NULL,
	`gender` varchar(1) NOT NULL,
	`birth_date` date NOT NULL,
	`phone_number` varchar(15) NOT NULL,
	`email` varchar(50) NOT NULL,
	`discount` int,
	`password` varchar(30) NOT NULL,
	`city` varchar(30) NOT NULL,
	PRIMARY KEY (`customer_id`)
);
CREATE TABLE IF NOT EXISTS `orders` (
	`orders_id` int AUTO_INCREMENT NOT NULL,
	`product_id` int NOT NULL,
	`invoice_id` int NOT NULL,
	`order_date` datetime NOT NULL,
	`amount` int NOT NULL,
	PRIMARY KEY (`orders_id`)
);
CREATE TABLE IF NOT EXISTS `Invoice` (
	`invoice_id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`employee_id` int NOT NULL,
	`customer_id` int NOT NULL,
	`payment_method` int NOT NULL,
	`transaction_moment` datetime NOT NULL,
	`status` varchar(30) NOT NULL,
	PRIMARY KEY (`invoice_id`)
);

ALTER TABLE `employee` ADD CONSTRAINT `employee_fk6` FOREIGN KEY (`manager_id`) REFERENCES `employee`(`employee_id`);
ALTER TABLE `product` ADD CONSTRAINT `product_fk9` FOREIGN KEY (`warehouse_id`) REFERENCES `Warehouse`(`warehouse_id`);

ALTER TABLE `orders` ADD CONSTRAINT `orders_fk1` FOREIGN KEY (`product_id`) REFERENCES `product`(`product_id`);

ALTER TABLE `orders` ADD CONSTRAINT `orders_fk2` FOREIGN KEY (`invoice_id`) REFERENCES `Invoice`(`invoice_id`);
ALTER TABLE `Invoice` ADD CONSTRAINT `Invoice_fk1` FOREIGN KEY (`employee_id`) REFERENCES `employee`(`employee_id`);

ALTER TABLE `Invoice` ADD CONSTRAINT `Invoice_fk2` FOREIGN KEY (`customer_id`) REFERENCES `customer`(`customer_id`);
ALTER TABLE employee CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE Warehouse CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE product CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE customer CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE orders CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE Invoice CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
