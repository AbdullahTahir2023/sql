-- Create the HRM database
CREATE DATABASE hrm_db;

-- Use the HRM database
USE hrm_db;

-- Create the Users table
CREATE TABLE users (
  user_id INT(11) NOT NULL AUTO_INCREMENT,
  user_name VARCHAR(255) NOT NULL,
  user_email VARCHAR(255) NOT NULL,
  user_password VARCHAR(255) NOT NULL,
  user_reg_datetime DATETIME NOT NULL,
  user_role ENUM('SUPERADMIN', 'ADMIN') NOT NULL DEFAULT 'ADMIN',
  PRIMARY KEY (user_id),
  INDEX idx_username (user_name ASC),
  UNIQUE INDEX user_email_UNIQUE (user_email ASC)
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- Create the Employees table
CREATE TABLE employees (
  employee_id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  employee_name VARCHAR(255) NOT NULL,
  employee_email VARCHAR(255) NOT NULL,
  employee_job_title VARCHAR(45),
  employee_created_by INT(11) NOT NULL,
  employee_created_date DATETIME NOT NULL,
  PRIMARY KEY (employee_id),
  INDEX idx_employee_name (employee_name ASC),
  UNIQUE INDEX employee_email_UNIQUE (employee_email ASC),
  INDEX fk_user_id_idx (employee_created_by ASC),
  CONSTRAINT fk_user_id
    FOREIGN KEY (employee_created_by)
    REFERENCES users (user_id)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- Create the Employee Attendance table
CREATE TABLE employee_attendance (
  attendance_id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  employee_id INT(11) UNSIGNED NOT NULL,
  attendance_date DATE NOT NULL,
  attendance_type ENUM('Present', 'Absent', 'On Leave') NOT NULL,
  created_by INT(11) NOT NULL,
  created_on DATETIME NULL,
  PRIMARY KEY (attendance_id),
  INDEX fk_employee_id_idx (employee_id ASC),
  INDEX fk_created_by_idx (created_by ASC),
  CONSTRAINT fk_employee_id
    FOREIGN KEY (employee_id)
    REFERENCES employees (employee_id)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT fk_created_by
    FOREIGN KEY (created_by)
    REFERENCES users (user_id)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- Create the Employee Salary table
CREATE TABLE employee_salary (
  employee_salary_id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  employee_id INT(11) UNSIGNED NOT NULL,
  salary_month ENUM("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December") NOT NULL,
  salary_year YEAR NOT NULL,
  salary_amount INT(11) NOT NULL,
  added_by INT(11) UNSIGNED NOT NULL,
  added_on DATETIME NULL,
  PRIMARY KEY (employee_salary_id),
  INDEX idx_employee_id_idx (employee_id ASC),
  CONSTRAINT fk_employee_id
    FOREIGN KEY (employee_id)
    REFERENCES employees (employee_id)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  INDEX idx_added_by (added_by ASC),
  CONSTRAINT fk_added_by
    FOREIGN KEY (added_by)
    REFERENCES users (user_id)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
