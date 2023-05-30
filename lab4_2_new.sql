/*CREATE SEQUENCE customer_id_sequence START WITH 510 INCREMENT BY 1;

-- Створення тригера для заповнення customer_id
CREATE TRIGGER trg_Customer_Insert
ON Customer
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Вставка даних з вказаною послідовністю значень customer_id
    INSERT INTO Customer(CustomerID, CustomerName,CustomerSurname, Debt_ID)
    SELECT NEXT VALUE FOR customer_id_sequence, CustomerName,CustomerSurname, Debt_ID
    FROM inserted;
END;*/

INSERT INTO Customer(CustomerID, CustomerName, CustomerSurname, Debt_ID) VALUES
(500,'Yaroslav', 'Yashchuk',NULL);
select * from Customer;











/*
IF NOT EXISTS (SELECT * FROM sys.sysusers WHERE name = 'user1')
BEGIN
    USE [Excursion];
    CREATE USER user1 FOR LOGIN user1;
    
END;

IF NOT EXISTS (SELECT * FROM sys.sysusers WHERE name = 'user2')
BEGIN
    USE [Excursion];
    CREATE USER user2 FOR LOGIN user2;
    GRANT SELECT, INSERT, UPDATE, DELETE ON Customer TO user2;
GRANT SELECT, INSERT, UPDATE, DELETE ON Excursion TO user2;

END;

IF NOT EXISTS (SELECT * FROM sys.sysusers WHERE name = 'user3')
BEGIN
    USE [Excursion];
    CREATE USER user3 FOR LOGIN user3;
    GRANT SELECT ON Driver TO user3;
GRANT SELECT ON Bus TO user3;

END;
*/

--CREATE ROLE AdminR;
--CREATE ROLE ManagerR;
--CREATE ROLE DriverR;
--SELECT name FROM sys.database_principals WHERE type = 'R';
