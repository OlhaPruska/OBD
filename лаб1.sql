USE Excursion;
CREATE TABLE Debt (
	DebtID INT NOT NULL PRIMARY KEY,
	DebtDuration INT,
	DebtSize DECIMAL(10,2) 
);
CREATE TABLE Customer (
  CustomerID  INT NOT NULL PRIMARY KEY,
  CustomerName VARCHAR(20) NOT NULL,
  CustomerSurname VARCHAR(30) NOT NULL,
  Debt_ID INT UNIQUE,
  FOREIGN KEY (Debt_ID) REFERENCES Debt(DebtID)
);
 
CREATE TABLE Driver (
  DriverID INT NOT NULL PRIMARY KEY,
  DriverName VARCHAR(20),
  DriverSurname VARCHAR(30)
);

CREATE TABLE ExcursionType (
	ExcursionTypeID INT NOT NULL PRIMARY KEY,
	Duration INT NOT NULL CHECK(Duration>0),
	Destination VARCHAR(50),
	AmountOfParticipants INT NOT NULL CHECK(AmountOfParticipants>0),
	Distance INT NOT NULL CHECK(Distance>0)
);
CREATE TABLE Bus (
  BusID INT NOT NULL PRIMARY KEY,
  Capacity SMALLINT CHECK(Capacity>0),
  Driver_ID INT ,
  GasConsumption DECIMAL(5,2) CHECK(GasConsumption > 0),
  Excursion_Type INT NOT NULL,
  FOREIGN KEY (Excursion_Type) REFERENCES ExcursionType(ExcursionTypeID),
  FOREIGN KEY (Driver_ID) REFERENCES Driver(DriverID)
);
CREATE TABLE BusDriver (
	Driver_ID INT NOT NULL,
	Bus_ID INT NOT NULL,
	FOREIGN KEY (Driver_ID) REFERENCES Driver(DriverID),
	FOREIGN KEY (Bus_ID) REFERENCES Bus(BusID)
);
CREATE TABLE ExcursionBus (
	Excursion_Type INT NOT NULL,
	Bus_ID INT NOT NULL,
	FOREIGN KEY (Excursion_Type) REFERENCES ExcursionType(ExcursionTypeID),
	FOREIGN KEY (Bus_ID) REFERENCES Bus(BusID)
);
CREATE TABLE Excursion (
	ExcursionID INT NOT NULL PRIMARY KEY,
	ExcursionDate DATE NOT NULL,
	Excursion_Type INT NOT NULL,
	TotalOfParticipants INT NOT NULL,
	Customer_ID INT NOT NULL,
	FOREIGN KEY (Excursion_Type) REFERENCES ExcursionType(ExcursionTypeID),
	FOREIGN KEY (Customer_ID) REFERENCES Customer(CustomerID)
);
CREATE TABLE Invoice (
  InvoiceID INT NOT NULL PRIMARY KEY,
  DataOfCreation DATE,
  TotalSum DECIMAL(10,2) NOT NULL CHECK(TotalSum>0)
);
CREATE TABLE ExcursionCustomer (
  ExcursionCustomerID INT NOT NULL PRIMARY KEY,
  Customer_ID INT NOT NULL,
  FOREIGN KEY (Customer_ID) REFERENCES Customer(CustomerID)
);
CREATE TABLE  DefraymentReckoning (
	Customer_ID INT NOT NULL,
	Invoice_ID INT NOT NULL,
	Excursion_ID INT NOT NULL,
	ExcursionCustomer_ID INT NOT NULL,
	PaymentAmount DECIMAL(10,2) NOT NULL CHECK(PaymentAmount > 0),
	DateOfPayment DATE NOT NULL,
	FOREIGN KEY (Customer_ID) REFERENCES Customer(CustomerID),
	FOREIGN KEY (Invoice_ID) REFERENCES Invoice(InvoiceID),
	FOREIGN KEY (Excursion_ID) REFERENCES Excursion(ExcursionID),
	FOREIGN KEY (ExcursionCustomer_ID) REFERENCES ExcursionCustomer(ExcursionCustomerID),
);
CREATE TABLE ExcursionBusDriver (
	ExcursionBusDriverID INT NOT NULL PRIMARY KEY,
	Driver_ID INT NOT NULL,
	Bus_ID INT NOT NULL,
	FOREIGN KEY (Driver_ID) REFERENCES Driver(DriverID),
	FOREIGN KEY (Bus_ID) REFERENCES Bus(BusID)
);
INSERT INTO Debt(DebtID, DebtDuration,DebtSize) VALUES
(600, 23, 30000);
INSERT INTO Customer(CustomerID, CustomerName, CustomerSurname, Debt_ID) VALUES
(500,'Olena', 'Yashchuk',NULL),
(501, 'Volodymyr', 'Konovalets', 600),
(502, 'Kateryna','Kukhar', NULL);
INSERT INTO Driver(DriverID, DriverName, DriverSurname) VALUES
(300, 'John', 'Richardson'),
(301, 'Michael', 'Jordan'),
(302, 'Alex', 'Butterson');
INSERT INTO ExcursionType(ExcursionTypeID, Duration, Destination, AmountOfParticipants, Distance) VALUES
(200, 3, 'KYIV-LVIV', 19, 600),
(201, 2, 'KHMELNYTSKY-LVIV',20, 300),
(202, 7,'ODESA-KYIV', 25, 500);
INSERT INTO Bus(BusID,Capacity, Driver_ID, GasConsumption, Excursion_Type) VALUES
(400,20, 300, 5.5, 200),
(401, 30, 301, 3.2, 201),
(402, 25,302, 4.9, 202);
INSERT INTO BusDriver(Driver_ID, Bus_ID) VALUES
(300,400),
(301,401),
(302,402);
INSERT INTO ExcursionBus(Excursion_Type, Bus_ID) VALUES 
(200,400),
(201,401),
(202,402);
INSERT INTO Excursion(ExcursionID, ExcursionDate, Excursion_Type, TotalOfParticipants ,Customer_ID) VALUES
(100, '2023-01-01', 200, 23, 500),
(101, '2023-01-05', 201, 14,501),
(102,'2023-02-09', 202,21, 502);
INSERT INTO Invoice(InvoiceID, DataOfCreation, TotalSum) VALUES
(700,'2023-01-01', 4000),
(701, '2023-01-05', 3467),
(702, '2023-02-09', 5677);
INSERT INTO ExcursionCustomer(ExcursionCustomerID, Customer_ID) VALUES
(800, 500),
(801, 501),
(802, 502);
INSERT INTO DefraymentReckoning(Customer_ID,Invoice_ID,Excursion_ID, ExcursionCustomer_ID, PaymentAmount, DateOfPayment) VALUES
(500,700, 100, 800, 4000,'2023-01-01' ),
(501,701,101,801,3467, '2023-01-05'),
(502,702,102,802,5677,'2023-02-09');
INSERT INTO ExcursionBusDriver(ExcursionBusDriverID,Driver_ID, Bus_ID) VALUES
(900,300,401),
(901,301,400),
(902,302,402);

