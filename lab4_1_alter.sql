-- ������ ������� �� ������� Customer
ALTER TABLE Customer
ADD UCR VARCHAR(50),
    DCR DATETIME,
    ULC VARCHAR(50),
    DLC DATETIME;



-- ������ ������� �� ������� Excursion
ALTER TABLE Excursion
ADD UCR VARCHAR(50),
    DCR DATETIME,
    ULC VARCHAR(50),
    DLC DATETIME;

-- ������ ������� �� ������� Invoice
ALTER TABLE Invoice
ADD UCR VARCHAR(50),
    DCR DATETIME,
    ULC VARCHAR(50),
    DLC DATETIME;
-- ������ ������� �� ������� Debt
ALTER TABLE Debt
ADD UCR VARCHAR(50),
    DCR DATETIME,
    ULC VARCHAR(50),
    DLC DATETIME;

-- ������ ������� �� ������� Driver
ALTER TABLE Driver
ADD UCR VARCHAR(50),
    DCR DATETIME,
    ULC VARCHAR(50),
    DLC DATETIME;
