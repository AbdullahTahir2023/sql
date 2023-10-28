Desgin a database of e-commerce application
# tables
- user
- category
- product
- order_product
- order
- payment


create database ecommerce

CREATE TABLE `ecommerce`.`users` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(255) NULL,
  `password` VARCHAR(45) NULL,
  `email` VARCHAR(255) NULL,
  `is_verified` TINYINT NULL DEFAULT 0,
  `datetime` DATETIME NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


ALTER TABLE `ecommerce`.`users` 
CHANGE COLUMN `user_name` `user_name` VARCHAR(255) NOT NULL ,
CHANGE COLUMN `password` `password` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `email` `email` VARCHAR(255) NOT NULL ;


CREATE TABLE `ecommerce`.`category` (
  `category_id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(255) NOT NULL,
  `category_description` TEXT(500) NULL,
  `category_type` ENUM('Physical', 'Digital') NULL,
  `datetime` DATETIME NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


CREATE TABLE `ecommerce`.`products` (
  `product_id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(255) NOT NULL,
  `product_desc` TEXT(500) NULL,
  `product_category` INT(11) NOT NULL,
  `quantity_stock` INT(11) NOT NULL DEFAULT 0,
  `datetime` DATETIME NOT NULL DEFAULT NOW(),
  PRIMARY KEY (`product_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


CREATE TABLE `ecommerce`.`order_product` (
  `order_id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` INT(11) NOT NULL DEFAULT 0,
  `quantity_ordered` INT(11) NOT NULL DEFAULT 0,
  `price_each` INT(11) NOT NULL DEFAULT 0,
  `created_date` DATETIME NULL,
  PRIMARY KEY (`order_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


CREATE TABLE `ecommerce`.`orders` (
  `order_id` INT(11) UNSIGNED NOT NULL,
  `user_id` INT(11) UNSIGNED NOT NULL,
  `order_date` DATE NOT NULL,
  `status` ENUM('Shipped', 'In Process', 'Canceled') NOT NULL,
  `comments` TEXT(500) NULL,
  `created_date` DATETIME NULL,
  PRIMARY KEY (`order_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


CREATE TABLE `ecommerce`.`payment` (
  `user_id` INT(11) UNSIGNED NOT NULL,
  `order_id` INT(11) UNSIGNED NOT NULL,
  `amount` INT(11) UNSIGNED NOT NULL,
  `payment_datetime` DATETIME NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


ALTER TABLE `ecommerce`.`products` 
ADD INDEX `product_name` (`product_name` ASC) VISIBLE;
;

ALTER TABLE `ecommerce`.`users` 
ADD INDEX `idx_username` (`user_name` ASC) VISIBLE;
;
