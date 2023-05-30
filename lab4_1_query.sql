-- Тригер для таблиці Customer
/*CREATE TRIGGER trg_trg_Customer_Insert
ON Customer
AFTER INSERT, UPDATE
AS
BEGIN
    -- Оновлення поля UCR (ім'я користувача, що створив запис)
    UPDATE Customer
    SET UCR = SUSER_SNAME()
    WHERE CustomerID IN (SELECT CustomerID FROM inserted);

    -- Оновлення поля DCR (дата та час створення запису)
    UPDATE Customer
    SET DCR = GETDATE()
    WHERE CustomerID IN (SELECT CustomerID FROM inserted);

    -- Оновлення поля ULC (ім'я користувача, що останнім змінив запис)
    UPDATE Customer
    SET ULC = SUSER_SNAME()
    WHERE CustomerID IN (SELECT CustomerID FROM inserted);

    -- Оновлення поля DLC (дата та час останньої модифікації запису)
    UPDATE Customer
    SET DLC = GETDATE()
    WHERE CustomerID IN (SELECT CustomerID FROM inserted);
END;
GO
*/
INSERT INTO Customer(CustomerID, CustomerName, CustomerSurname, Debt_ID) VALUES
(500,'Myroslav', 'Yashchuk',602);
select * from Customer;

