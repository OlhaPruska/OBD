-- Додати стовпці до таблиці Customer
ALTER TABLE Customer
ADD UCR VARCHAR(50),
    DCR DATETIME,
    ULC VARCHAR(50),
    DLC DATETIME;



-- Додати стовпці до таблиці Excursion
ALTER TABLE Excursion
ADD UCR VARCHAR(50),
    DCR DATETIME,
    ULC VARCHAR(50),
    DLC DATETIME;

-- Додати стовпці до таблиці Invoice
ALTER TABLE Invoice
ADD UCR VARCHAR(50),
    DCR DATETIME,
    ULC VARCHAR(50),
    DLC DATETIME;
-- Додати стовпці до таблиці Debt
ALTER TABLE Debt
ADD UCR VARCHAR(50),
    DCR DATETIME,
    ULC VARCHAR(50),
    DLC DATETIME;

-- Додати стовпці до таблиці Driver
ALTER TABLE Driver
ADD UCR VARCHAR(50),
    DCR DATETIME,
    ULC VARCHAR(50),
    DLC DATETIME;
