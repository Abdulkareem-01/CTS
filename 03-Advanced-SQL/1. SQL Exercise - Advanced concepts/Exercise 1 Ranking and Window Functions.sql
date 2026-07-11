
CREATE DATABASE IF NOT EXISTS OnlineRetailStore;


USE OnlineRetailStore;


DROP TABLE IF EXISTS Products;


CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);


INSERT INTO Products (ProductID, ProductName, Category, Price) VALUES
(101,'Laptop','Electronics',90000),
(102,'Mobile','Electronics',50000),
(103,'Tablet','Electronics',50000),
(104,'Smart Watch','Electronics',25000),
(105,'Mouse','Electronics',1000),
(201,'Sofa','Furniture',30000),
(202,'Dining Table','Furniture',25000),
(203,'Chair','Furniture',10000),
(204,'Bed','Furniture',35000),
(205,'Cupboard','Furniture',35000),
(301,'Shirt','Clothing',2000),
(302,'Jeans','Clothing',3000),
(303,'Jacket','Clothing',5000),
(304,'T-Shirt','Clothing',1500),
(305,'Sweater','Clothing',5000);


SELECT * FROM Products;


SELECT
    ProductID,
    ProductName,
    Category,
    Price,
    ROW_NUMBER() OVER (
        PARTITION BY Category
        ORDER BY Price DESC
    ) AS RowNum,
    RANK() OVER (
        PARTITION BY Category
        ORDER BY Price DESC
    ) AS RankNum,
    DENSE_RANK() OVER (
        PARTITION BY Category
        ORDER BY Price DESC
    ) AS DenseRankNum
FROM Products;


SELECT *
FROM
(
    SELECT
        ProductID,
        ProductName,
        Category,
        Price,
        ROW_NUMBER() OVER (
            PARTITION BY Category
            ORDER BY Price DESC
        ) AS RowNum,
        RANK() OVER (
            PARTITION BY Category
            ORDER BY Price DESC
        ) AS RankNum,
        DENSE_RANK() OVER (
            PARTITION BY Category
            ORDER BY Price DESC
        ) AS DenseRankNum
    FROM Products
) AS RankedProducts
WHERE RowNum <= 3;