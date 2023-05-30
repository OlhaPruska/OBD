-- ������ ��� ������� Customer
/*CREATE TRIGGER trg_trg_Customer_Insert
ON Customer
AFTER INSERT, UPDATE
AS
BEGIN
    -- ��������� ���� UCR (��'� �����������, �� ������� �����)
    UPDATE Customer
    SET UCR = SUSER_SNAME()
    WHERE CustomerID IN (SELECT CustomerID FROM inserted);

    -- ��������� ���� DCR (���� �� ��� ��������� ������)
    UPDATE Customer
    SET DCR = GETDATE()
    WHERE CustomerID IN (SELECT CustomerID FROM inserted);

    -- ��������� ���� ULC (��'� �����������, �� ������� ����� �����)
    UPDATE Customer
    SET ULC = SUSER_SNAME()
    WHERE CustomerID IN (SELECT CustomerID FROM inserted);

    -- ��������� ���� DLC (���� �� ��� �������� ����������� ������)
    UPDATE Customer
    SET DLC = GETDATE()
    WHERE CustomerID IN (SELECT CustomerID FROM inserted);
END;
GO
*/
INSERT INTO Customer(CustomerID, CustomerName, CustomerSurname, Debt_ID) VALUES
(500,'Myroslav', 'Yashchuk',602);
select * from Customer;

