CREATE PROCEDURE CalculatePaymentForCustomer (
  @customerID INT,
  @month INT,
  @year INT
)
AS
BEGIN
  -- ���������� ������
  DECLARE @paymentAmount DECIMAL(10, 2);

  -- ���������� ���� ������� �� ������� �����
  SELECT @paymentAmount = COALESCE(SUM(DR.PaymentAmount), 0)
  FROM DefraymentReckoning DR
  WHERE DR.Customer_ID = @customerID
    AND MONTH(DR.DateOfPayment) = @month
    AND YEAR(DR.DateOfPayment) = @year;

  -- ��������� ���� PaymentAmount � ������� DefraymentReckoning
  UPDATE DefraymentReckoning
  SET PaymentAmount = @paymentAmount
  WHERE Customer_ID = @customerID
    AND MONTH(DateOfPayment) = @month
    AND YEAR(DateOfPayment) = @year;
END;

DECLARE @customer_1 INT = 500; 
DECLARE @month_1 INT = 5; 
DECLARE @year_1 INT = 2023; 

EXEC CalculatePaymentForCustomer @customerID, @month, @year;




