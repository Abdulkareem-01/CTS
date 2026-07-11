CREATE DATABASE IF NOT EXISTS EmployeeManagement;
USE EmployeeManagement;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10,2),
    JoinDate DATE,
    FOREIGN KEY (DepartmentID)
        REFERENCES Departments(DepartmentID)
);
INSERT INTO Departments VALUES
(1,'HR'),
(2,'Finance'),
(3,'IT'),
(4,'Marketing');
INSERT INTO Employees
(EmployeeID, FirstName, LastName, DepartmentID, Salary, JoinDate)
VALUES
(1,'John','Doe',1,5000.00,'2020-01-15'),
(2,'Jane','Smith',2,6000.00,'2019-03-22'),
(3,'Michael','Johnson',3,7000.00,'2018-07-30'),
(4,'Emily','Davis',4,5500.00,'2021-11-05');
SELECT * FROM Departments;

SELECT * FROM Employees;
DELIMITER $$

CREATE PROCEDURE GetEmployeesByDepartment
(
    IN p_DepartmentID INT
)
BEGIN
    SELECT
        EmployeeID,
        FirstName,
        LastName,
        DepartmentID,
        Salary,
        JoinDate
    FROM Employees
    WHERE DepartmentID = p_DepartmentID;
END $$

DELIMITER ;
CALL GetEmployeesByDepartment(3);
DELIMITER $$

CREATE PROCEDURE sp_InsertEmployee
(
    IN p_FirstName VARCHAR(50),
    IN p_LastName VARCHAR(50),
    IN p_DepartmentID INT,
    IN p_Salary DECIMAL(10,2),
    IN p_JoinDate DATE
)
BEGIN

INSERT INTO Employees
(
    FirstName,
    LastName,
    DepartmentID,
    Salary,
    JoinDate
)
VALUES
(
    p_FirstName,
    p_LastName,
    p_DepartmentID,
    p_Salary,
    p_JoinDate
);

END $$

DELIMITER ;
CALL sp_InsertEmployee(
'Robert',
'Brown',
2,
6500.00,
'2024-06-15'
);
SELECT * FROM Employees;

CALL GetEmployeesByDepartment(1);
CALL GetEmployeesByDepartment(2);
CALL GetEmployeesByDepartment(3);
CALL GetEmployeesByDepartment(4);