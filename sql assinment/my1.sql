-- User table
CREATE TABLE User (
    UserID INT PRIMARY KEY,
    Username VARCHAR(50),
    Email VARCHAR(100),
    Password VARCHAR(100),
    -- Add other user-related columns
);

-- Category table
CREATE TABLE Category (
    CategoryID INT PRIMARY KEY,
    Name VARCHAR(50),
    Description TEXT,
    -- Add other category-related columns
);

-- Product table
CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10, 2),
    CategoryID INT,
    -- Add other product-related columns
);

-- Order_Product table
CREATE TABLE Order_Product (
    OrderProductID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    -- Add other order product-related columns
);

-- Order table
CREATE TABLE Order (
    OrderID INT PRIMARY KEY,
    UserID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    -- Add other order-related columns
);

-- Payment table
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    PaymentDate DATE,
    Amount DECIMAL(10, 2),
    -- Add other payment-related columns
);
