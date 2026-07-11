USE EmployeeDB;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10,2),
    JoinDate DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Departments VALUES
(1,'HR'),
(2,'IT'),
(3,'Finance');

INSERT INTO Employees VALUES
(101,'John','Doe',1,50000,'2022-01-10'),
(102,'Jane','Smith',2,60000,'2021-05-15'),
(103,'David','Lee',3,55000,'2023-02-20');

CREATE VIEW vw_EmployeeBasicInfo AS
SELECT
    E.EmployeeID,
    E.FirstName,
    E.LastName,
    D.DepartmentName
FROM Employees E
JOIN Departments D
ON E.DepartmentID = D.DepartmentID;

SELECT * FROM vw_EmployeeBasicInfo;

CREATE VIEW vw_EmployeeFullName AS
SELECT
    E.EmployeeID,
    CONCAT(E.FirstName, ' ', E.LastName) AS FullName,
    D.DepartmentName
FROM Employees E
JOIN Departments D
ON E.DepartmentID = D.DepartmentID;

SELECT * FROM vw_EmployeeFullName;

CREATE VIEW vw_EmployeeAnnualSalary AS
SELECT
    E.EmployeeID,
    CONCAT(E.FirstName,' ',E.LastName) AS FullName,
    D.DepartmentName,
    E.Salary,
    (E.Salary * 12) AS AnnualSalary
FROM Employees E
JOIN Departments D
ON E.DepartmentID = D.DepartmentID;

SELECT * FROM vw_EmployeeAnnualSalary;

CREATE VIEW vw_EmployeeReport AS
SELECT
    E.EmployeeID,
    CONCAT(E.FirstName,' ',E.LastName) AS FullName,
    D.DepartmentName,
    (E.Salary * 12) AS AnnualSalary,
    (E.Salary * 12 * 0.10) AS Bonus
FROM Employees E
JOIN Departments D
ON E.DepartmentID = D.DepartmentID;

SELECT * FROM vw_EmployeeReport;