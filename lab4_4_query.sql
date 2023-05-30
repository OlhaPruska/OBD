CREATE TRIGGER trg_CheckDebt
ON Excursion
AFTER INSERT
AS
BEGIN
    DECLARE @CustomerDebt DECIMAL(10,2);
    DECLARE @DebtDuration INT;
    
    SELECT @CustomerDebt = DebtSize, @DebtDuration = DebtDuration
    FROM Customer
    INNER JOIN Debt ON Customer.Debt_ID = Debt.DebtID
    WHERE Customer.CustomerID IN (SELECT Customer_ID FROM inserted);
    
    IF @CustomerDebt IS NOT NULL AND @DebtDuration >= 30
    BEGIN
        RAISERROR ('Excursion cannot be provided to a customer with a debt for 30 days or more.', 16, 1);
        DELETE FROM Excursion WHERE ExcursionID IN (SELECT ExcursionID FROM inserted);
    END;
END;

---------
INSERT INTO Excursion(ExcursionID, ExcursionDate, Excursion_Type, TotalOfParticipants ,Customer_ID) VALUES
(110, '2023-01-01', 200, 23, 508)