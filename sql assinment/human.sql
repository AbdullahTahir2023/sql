Desgin a database of Human Resource Managment application
# Requirements
# a superadmin (sa) can add admin and superadmin
# sa or admin can add employees
# sa or admin can mark leave of employee
# sa or admin can mark an employee absent
# sa or admin can add entry of salary every month


create database hrm_db;

CREATE TABLE `hrm_db`.`users` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(255) NOT NULL,
  `user_email` VARCHAR(255) NOT NULL,
  `user_password` VARCHAR(255) NOT NULL,
  `user_reg_datetime` DATETIME NOT NULL,
  `user_role` ENUM('SUPERADMIN', 'ADMIN') NOT NULL DEFAULT 'ADMIN',
  PRIMARY KEY (`user_id`),
  INDEX `idx_username` (`user_name` ASC) VISIBLE,
  UNIQUE INDEX `user_email_UNIQUE` (`user_email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;



CREATE TABLE `hrm_db`.`employees` (
  `employee_id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `employee_name` VARCHAR(255) NOT NULL,
  `employee_email` VARCHAR(255) NOT NULL,
  `employee_job_title` VARCHAR(45) NULL,
  `employee_created_by` INT(11) NOT NULL,
  `employee_created_date` DATETIME NOT NULL,
  PRIMARY KEY (`employee_id`),
  INDEX `idx_employee_name` (`employee_name` ASC) VISIBLE,
  UNIQUE INDEX `employee_email_UNIQUE` (`employee_email` ASC) VISIBLE,
  INDEX `fk_user_id_idx` (`employee_created_by` ASC) VISIBLE,
  CONSTRAINT `fk_user_id`
    FOREIGN KEY (`employee_created_by`)
    REFERENCES `hrm_db`.`users` (`user_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


CREATE TABLE `hrm_db`.`employee_attendance` (
  `attendance_id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `employee_id` INT(11) UNSIGNED NOT NULL,
  `attendance_date` DATE NOT NULL,
  `attendance_type` ENUM('Present', 'Absent', 'On Leave') NOT NULL,
  `created_by` INT(11) NOT NULL,
  `created_on` DATETIME NULL,
  PRIMARY KEY (`attendance_id`),
  INDEX `fk_employee_id_idx` (`employee_id` ASC) VISIBLE,
  INDEX `fk_created_by_idx` (`created_by` ASC) VISIBLE,
  CONSTRAINT `fk_employee_id`
    FOREIGN KEY (`employee_id`)
    REFERENCES `hrm_db`.`employees` (`employee_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_created_by`
    FOREIGN KEY (`created_by`)
    REFERENCES `hrm_db`.`users` (`user_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;



CREATE TABLE `hrm_db`.`employee_salary` (
  `employee_salary_id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `employee_id` INT(11) UNSIGNED NOT NULL,
  `salary_month` ENUM("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December") NOT NULL,
  `salary_year` YEAR NOT NULL,
  `salary_amount` INT(11) NOT NULL,
  `added_by` INT(11) UNSIGNED NOT NULL,
  `added_on` DATETIME NULL,
  PRIMARY KEY (`employee_salary_id`),
  INDEX `idx_employee_id_idx` (`employee_id` ASC) VISIBLE,
  CONSTRAINT `idx_employee_id`
    FOREIGN KEY (`employee_id`)
    REFERENCES `hrm_db`.`employees` (`employee_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `idx_added_by`
    FOREIGN KEY ()
    REFERENCES `hrm_db`.`users` ()
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
