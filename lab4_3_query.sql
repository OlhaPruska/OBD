CREATE TRIGGER trg_CheckExcursionCapacity
ON Excursion
AFTER INSERT, UPDATE
AS
BEGIN
    -- Перевірка для кожного вставленого або оновленого рядка в таблиці Excursion
    IF EXISTS (
        SELECT 1
        FROM inserted i
        INNER JOIN ExcursionType et ON i.Excursion_Type = et.ExcursionTypeID
        INNER JOIN Bus b ON et.ExcursionTypeID = b.Excursion_Type
        INNER JOIN BusDriver bd ON b.BusID = bd.Bus_ID
        INNER JOIN Driver d ON bd.Driver_ID = d.DriverID
        INNER JOIN Excursion e ON e.Excursion_Type = i.Excursion_Type AND e.ExcursionID <> i.ExcursionID
        WHERE i.Excursion_Type = et.ExcursionTypeID
          AND i.ExcursionID = e.ExcursionID
    )
    BEGIN
        RAISERROR ('Bus and driver cannot serve 2 excursions at once', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    -- Перевірка, чи є достатня місткість автобуса для екскурсії
    IF EXISTS (
        SELECT 1
        FROM inserted i
        INNER JOIN ExcursionType et ON i.Excursion_Type = et.ExcursionTypeID
        INNER JOIN Bus b ON et.ExcursionTypeID = b.Excursion_Type
        WHERE i.Excursion_Type = et.ExcursionTypeID
          AND i.ExcursionID = et.ExcursionTypeID
          AND i.TotalOfParticipants > b.Capacity
    )
    BEGIN
        RAISERROR ('Capacity of the bus is not big enough', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;
END;