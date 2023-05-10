CREATE PROCEDURE CalculatePaymentForAllCustomers(
  @month INT,
  @year INT
)
AS
BEGIN
  -- Оголошення змінних
  DECLARE @customerID INT;
  
  -- Оголошення та відкриття курсора
  DECLARE customerCursor CURSOR FOR SELECT CustomerID FROM Customer;
  OPEN customerCursor;
  
  -- Отримання першого замовника
  FETCH NEXT FROM customerCursor INTO @customerID;
  
  -- Поки курсор не дійшов до кінця
  WHILE @@FETCH_STATUS = 0
  BEGIN
    -- Виклик процедури CalculatePaymentForCustomer для поточного замовника
    EXEC CalculatePaymentForCustomer @customerID, @month, @year;
    
    -- Отримання наступного замовника
    FETCH NEXT FROM customerCursor INTO @customerID;
  END;
  
  -- Закриття та видалення курсора
  CLOSE customerCursor;
  DEALLOCATE customerCursor;
END;


DECLARE @month_2 INT = 6; 
DECLARE @year_2 INT = 2023; 

EXEC CalculatePaymentForAllCustomers @month, @year;