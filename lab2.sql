/*1*/
SELECT ExcursionDate, TotalOfParticipants
FROM Excursion
WHERE ExcursionDate > '2022-01-01' AND TotalOfParticipants > 20
ORDER BY ExcursionDate ASC;
 

/*2*/
SELECT 
    CustomerName, 
    CustomerSurname, 
    ExcursionType.Destination, 
    ExcursionDate, 
    Excursion.TotalOfParticipants, 
    Bus.Capacity, 
    Excursion.TotalOfParticipants * ExcursionType.Duration AS TotalDuration, 
    Invoice.TotalSum * 0.2 AS VAT
FROM 
    Customer 
    JOIN Excursion ON Customer.CustomerID = Excursion.Customer_ID 
    JOIN ExcursionType ON Excursion.Excursion_Type = ExcursionType.ExcursionTypeID 
    JOIN ExcursionBus ON ExcursionType.ExcursionTypeID = ExcursionBus.Excursion_Type 
    JOIN Bus ON ExcursionBus.Bus_ID = Bus.BusID 
    JOIN Invoice ON Excursion.ExcursionID = Invoice.InvoiceID;

/*3*/
SELECT c.CustomerName, c.CustomerSurname, e.ExcursionDate, et.Destination
FROM Customer c
LEFT JOIN Excursion e ON c.CustomerID = e.Customer_ID
LEFT JOIN ExcursionType et ON e.Excursion_Type = et.ExcursionTypeID
WHERE (c.CustomerName = 'Olena' AND c.CustomerSurname = 'Yashchuk')
OR (et.Destination = 'ODESA-KYIV' AND et.Duration > 5)
ORDER BY e.ExcursionDate DESC;
 
/*4*/
SELECT 
  Customer.CustomerName, 
  Customer.CustomerSurname, 
  Excursion.ExcursionDate, 
  ExcursionType.Destination,
  Bus.Driver_ID
FROM 
  Customer 
  LEFT OUTER JOIN Excursion 
    ON Customer.CustomerID = Excursion.Customer_ID 
  LEFT OUTER JOIN ExcursionType 
    ON Excursion.Excursion_Type = ExcursionType.ExcursionTypeID
  LEFT OUTER JOIN ExcursionBus 
    ON ExcursionType.ExcursionTypeID = ExcursionBus.Excursion_Type 
  LEFT OUTER JOIN Bus 
    ON ExcursionBus.Bus_ID = Bus.BusID 
WHERE 
  Excursion.ExcursionDate >= '2023-01-01'
 

/*5*/
SELECT * FROM Excursion
WHERE ExcursionDate BETWEEN '2022-01-01' AND '2023-12-31'
AND TotalOfParticipants > 20;
 
/*6*/
SELECT Customer.CustomerID, Customer.CustomerName, SUM(Debt.DebtSize) AS TotalDebt
FROM Customer
LEFT JOIN Debt ON Customer.Debt_ID = Debt.DebtID
GROUP BY Customer.CustomerID, Customer.CustomerName;
	 
/*7*/
SELECT *
FROM Excursion
WHERE Excursion_Type IN (
	SELECT Excursion_Type
	FROM ExcursionBus
	WHERE Bus_ID IN (
		SELECT Bus_ID
		FROM ExcursionBusDriver
		WHERE Driver_ID = 302
	)
)
	 
/*8*/
	SELECT e.ExcursionID, e.ExcursionDate, c.CustomerName, c.CustomerSurname
FROM (
  SELECT ExcursionID, ExcursionDate, Customer_ID
  FROM Excursion
  WHERE Excursion_Type = (
    SELECT ExcursionTypeID
    FROM ExcursionType
    WHERE Destination = 'KYIV-LVIV'
  )
) e
INNER JOIN Customer c ON e.Customer_ID = c.CustomerID;
 
/*9*/
SELECT ExcursionDate, DriverName, DriverSurname, Capacity, GasConsumption
FROM Excursion
JOIN ExcursionBus ON Excursion.Excursion_Type = ExcursionBus.Excursion_Type
JOIN Bus ON ExcursionBus.Bus_ID = Bus.BusID
JOIN BusDriver ON Bus.BusID = BusDriver.Bus_ID
JOIN Driver ON BusDriver.Driver_ID = Driver.DriverID
ORDER BY ExcursionDate ASC;

/*10*/
SELECT c.CustomerID, c.CustomerName, c.CustomerSurname, SUM(d.DebtSize) AS TotalDebt
FROM Customer c
LEFT JOIN Debt d ON c.Debt_ID = d.DebtID
WHERE d.DebtSize > 1000
GROUP BY c.CustomerID, c.CustomerName, c.CustomerSurname;

/*11*/
UPDATE Debt
SET DebtDuration = 12
WHERE DebtID = 600;

/*12*/
UPDATE Debt
SET DebtSize = 5000.00
WHERE DebtID = (
	SELECT c.Debt_ID
	FROM Customer c
	WHERE c.CustomerID = 500
);

/*13*/
INSERT INTO Debt (DebtID, DebtDuration, DebtSize)
VALUES (606, 12, 12000.00);

/*14*/
INSERT INTO Excursion (ExcursionID, ExcursionDate, Excursion_Type, TotalOfParticipants, Customer_ID)
SELECT 1, '2023-05-01', ExcursionTypeID, 25, CustomerID
FROM ExcursionType
CROSS JOIN Customer
WHERE ExcursionTypeID = 3 AND CustomerID = 10;
/*15*/
DELETE FROM Debt; 
DELETE FROM Customer; 
DELETE FROM Driver; 
DELETE FROM ExcursionType;
DELETE FROM Bus; 
DELETE FROM BusDriver; 
DELETE FROM ExcursionBus; 
DELETE FROM Excursion; 
DELETE FROM Invoice; 
DELETE FROM ExcursionCustomer; 
DELETE FROM DefraymentReckoning; 
DELETE FROM ExcursionBusDriver;

/*16*/
DELETE FROM ExcursionCustomer WHERE ExcursionCustomerID IN (800, 802);

