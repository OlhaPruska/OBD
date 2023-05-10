CREATE PROCEDURE CalculatePaymentForAllCustomers(
  @month INT,
  @year INT
)
AS
BEGIN
  -- ���������� ������
  DECLARE @customerID INT;
  
  -- ���������� �� �������� �������
  DECLARE customerCursor CURSOR FOR SELECT CustomerID FROM Customer;
  OPEN customerCursor;
  
  -- ��������� ������� ���������
  FETCH NEXT FROM customerCursor INTO @customerID;
  
  -- ���� ������ �� ����� �� ����
  WHILE @@FETCH_STATUS = 0
  BEGIN
    -- ������ ��������� CalculatePaymentForCustomer ��� ��������� ���������
    EXEC CalculatePaymentForCustomer @customerID, @month, @year;
    
    -- ��������� ���������� ���������
    FETCH NEXT FROM customerCursor INTO @customerID;
  END;
  
  -- �������� �� ��������� �������
  CLOSE customerCursor;
  DEALLOCATE customerCursor;
END;


DECLARE @month_2 INT = 6; 
DECLARE @year_2 INT = 2023; 

EXEC CalculatePaymentForAllCustomers @month, @year;