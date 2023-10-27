-- User table (as before)

-- Role table
CREATE TABLE Role (
    RoleID INT PRIMARY KEY,
    Name VARCHAR(50),
    -- Add other role-related columns
);

-- Employee table
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    RoleID INT,
    -- Add other employee-related columns
);

-- Leave table
CREATE TABLE Leave (
    LeaveID INT PRIMARY KEY,
    EmployeeID INT,
    LeaveDate DATE,
    Reason TEXT,
    Status VARCHAR(20),
    -- Add other leave-related columns
);

-- Attendance table
CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY,
    EmployeeID INT,
    Date DATE,
    Status VARCHAR(20),
    -- Add other attendance-related columns
);

-- Salary table
CREATE TABLE Salary (
    SalaryID INT PRIMARY KEY,
    EmployeeID INT,
    Month INT,
    Year INT,
    Amount DECIMAL(10, 2),
    -- Add other salary-related columns
);
