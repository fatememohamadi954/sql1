-- INIT database
CREATE TABLE Product (
  ProductID INT AUTO_INCREMENT KEY,
  Name VARCHAR(100),
  Description VARCHAR(255)
);

INSERT INTO Product(Name, Description) VALUES ('Entity Framework Extensions', 'Use <a href="https://entityframework-extensions.net/" target="_blank">Entity Framework Extensions</a> to extend your DbContext with high-performance bulk operations.');
INSERT INTO Product(Name, Description) VALUES ('Dapper Plus', 'Use <a href="https://dapper-plus.net/" target="_blank">Dapper Plus</a> to extend your IDbConnection with high-performance bulk operations.');
INSERT INTO Product(Name, Description) VALUES ('C# Eval Expression', 'Use <a href="https://eval-expression.net/" target="_blank">C# Eval Expression</a> to compile and execute C# code at runtime.');

-- QUERY database
SELECT * FROM Product;
SELECT * FROM Product WHERE ProductID = 1;
CREATE TABLE users(
  UserID INT AUTO_INCREMENT PRIMARY KEY,
  Username VARCHAR(50) NOT NULL UNIQUE,
  Email VARCHAR(100) NOT NULL UNIQUE,
  PasswordHash VARCHAR(255) NOT NULL,
  FullName varchar(100),
  Address TEXT,
  PhoneNumber varchar(20),
  CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  );
  CREAT TABLES Categories(
    CategoryID AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL UNIQUE,
    Description TEXT
    );
    CREATE TABLE Products(
      ProductID INT AUTO_INCREMENT PRIMARY KEY,
      ProductName VARCHAR(100) NOT NULL,
      CategoryID INT,
      Price DECIMAL(10,2) NOT NULL,
      Description TEXT,
      Stock INT DEFAULT 0,
      CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      FOREIGN KEY(CategoryID)REFERENCES Categories(CategoryID)
      );
      CREATE TABLE Orders(
        OrderID INT AUTO_INCREMENT PRIMARY KEY,
        UserID INT,
        OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        Status VARCHAR(50) DEFAULT 'Pending' TotalAmount DECIMAL(10,2) NOT NULL,
        ShippingAddress TEXT,
        FOREIGN KEY (UserID)REFERENCES Users(UserID)
        );
  
