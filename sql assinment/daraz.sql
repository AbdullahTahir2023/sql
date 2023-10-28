Desgin a database of another e-commerce application closesly related to Daraz
Features
- user creation
- agent creation
- merchant creation
- product
- category
- order_product
- order
- payment


create database ecommerce_daraz;

CREATE TABLE `ecommerce_daraz`.`user_creation` (
  `user_id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(255) NOT NULL,
  `user_email` VARCHAR(255) NOT NULL,
  `user_password` VARCHAR(45) NOT NULL,
  `is_verified` TINYINT NOT NULL DEFAULT 0,
  `created_datetime` DATETIME NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_email_UNIQUE` (`user_email` ASC) VISIBLE,
  INDEX `idx_username` (`user_name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


CREATE TABLE `ecommerce_daraz`.`agent` (
  `agent_id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) UNSIGNED NOT NULL,
  `agent_created_datetime` DATETIME NULL,
  PRIMARY KEY (`agent_id`),
  INDEX `idx_agent_user_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `idx_agent_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `ecommerce_daraz`.`user_creation` (`user_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


CREATE TABLE `ecommerce_daraz`.`merchant` (
  `merchant_id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `agent_id` INT(11) UNSIGNED NOT NULL,
  `user_id` INT(11) UNSIGNED NOT NULL,
  `created_datetime` DATETIME NULL,
  PRIMARY KEY (`merchant_id`),
  INDEX `fk_agent_id_idx` (`agent_id` ASC) VISIBLE,
  INDEX `fk_user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_agent_id`
    FOREIGN KEY (`agent_id`)
    REFERENCES `ecommerce_daraz`.`agent` (`agent_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `ecommerce_daraz`.`user_creation` (`user_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;



CREATE TABLE `ecommerce_daraz`.`products` (
  `product_id` INT(11) NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(255) NOT NULL,
  `product_desc` TEXT(500) NULL,
  `quantity` INT(11) UNSIGNED NOT NULL DEFAULT 0,
  `product_category` INT(11) UNSIGNED NOT NULL,
  `merchant_id` INT(11) UNSIGNED NOT NULL,
  `created_datetime` DATETIME NULL,
  PRIMARY KEY (`product_id`),
  INDEX `idx_product_name` (`product_name` ASC) VISIBLE,
  INDEX `idx_merchant_id_idx` (`merchant_id` ASC) VISIBLE,
  CONSTRAINT `idx_merchant_id`
    FOREIGN KEY (`merchant_id`)
    REFERENCES `ecommerce_daraz`.`merchant` (`merchant_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


CREATE TABLE `ecommerce_daraz`.`category` (
  `category_id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(255) NOT NULL,
  `category_desc` TEXT(500) NULL,
  `category_type` ENUM('Digital', 'Physical') NOT NULL,
  `created_datetime` DATETIME NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;



CREATE TABLE `ecommerce_daraz`.`orders` (
  `order_id` INT(11) UNSIGNED NOT NULL,
  `user_id` INT(11) UNSIGNED NOT NULL,
  `order_date` DATE NOT NULL,
  `status` ENUM('Shipped', 'In Process', 'Canceled') NOT NULL,
  `comments` TEXT(500) NULL,
  `created_date` DATETIME NULL,
  PRIMARY KEY (`order_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


CREATE TABLE `ecommerce_daraz`.`order_product` (
  `order_id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` INT(11) NOT NULL DEFAULT 0,
  `quantity_ordered` INT(11) NOT NULL DEFAULT 0,
  `price_each` INT(11) NOT NULL DEFAULT 0,
  `created_date` DATETIME NULL,
  PRIMARY KEY (`order_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;



CREATE TABLE `ecommerce_daraz`.`payment` (
  `user_id` INT(11) UNSIGNED NOT NULL,
  `order_id` INT(11) UNSIGNED NOT NULL,
  `amount` INT(11) UNSIGNED NOT NULL,
  `payment_datetime` DATETIME NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
