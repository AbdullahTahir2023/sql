-- User table (as before)

-- Agent table
CREATE TABLE Agent (
    AgentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    -- Add other agent-related columns
);

-- Merchant table
CREATE TABLE Merchant (
    MerchantID INT PRIMARY KEY,
    Name VARCHAR(100),
    Description TEXT,
    -- Add other merchant-related columns
);

-- Category table (as before)

-- Product table (as before)

-- Order_Product table (as before)

-- Order table (as before)

-- Payment table (as before)
