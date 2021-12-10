--
-- File generated with SQLiteStudio v3.3.3 on Thu Dec 9 22:08:41 2021
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Customer
CREATE TABLE Customer (
    UserID               INTEGER       PRIMARY KEY AUTOINCREMENT,
    FullName             VARCHAR (200) NOT NULL,
    Address              TEXT          NOT NULL,
    PaymentInformationID               REFERENCES PaymentInformation (ID) 
                                       NOT NULL
);


-- Table: Employee
CREATE TABLE Employee (
    ID       INTEGER       PRIMARY KEY AUTOINCREMENT,
    FullName VARCHAR (200) NOT NULL
);


-- Table: EmployeeCustomers
CREATE TABLE EmployeeCustomers (
    EmployeeID            REFERENCES Employee (ID),
    CustomerID            REFERENCES Customer (UserID),
    InteractionID INTEGER PRIMARY KEY AUTOINCREMENT
);


-- Table: Grocery
CREATE TABLE Grocery (
    SKUNumber   INTEGER       PRIMARY KEY AUTOINCREMENT,
    ItemName    VARCHAR (200) NOT NULL,
    Description TEXT,
    Quantity    INT           NOT NULL
);


-- Table: PaymentInformation
CREATE TABLE PaymentInformation (
    ID         INTEGER PRIMARY KEY AUTOINCREMENT,
    CCNum              UNIQUE
                       NOT NULL,
    NameOnCard         NOT NULL,
    CVC                NOT NULL
);


-- Table: ShoppingCartContents
CREATE TABLE ShoppingCartContents (
    CustomerID      REFERENCES Customer (UserID),
    ItemName   TEXT NOT NULL
);


-- View: AvailableItems
CREATE VIEW AvailableItems AS
    SELECT ItemName,
           Quantity
      FROM Grocery
     WHERE Grocery.Quantity > 0;


-- View: ExistingEmployees
CREATE VIEW ExistingEmployees AS
    SELECT FullName
      FROM Employee;


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
