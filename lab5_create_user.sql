/*CREATE LOGIN admin WITH PASSWORD = 'admin12345678';
CREATE USER Admin FOR LOGIN admin;

CREATE LOGIN manager WITH PASSWORD = 'manager12345678';
CREATE USER Manager FOR LOGIN manager;

CREATE LOGIN driver WITH PASSWORD = 'driver12345678';
CREATE USER Driver FOR LOGIN driver;
*/
IF NOT EXISTS (SELECT * FROM sys.sysusers WHERE name = 'user1')
BEGIN
    USE [Excursion];
    CREATE USER user1 FOR LOGIN user1;
    
END;

IF NOT EXISTS (SELECT * FROM sys.sysusers WHERE name = 'user2')
BEGIN
    USE [Excursion];
    CREATE USER user2 FOR LOGIN user2;
    GRANT SELECT, INSERT, UPDATE, DELETE ON Customer TO user2;
GRANT SELECT, INSERT, UPDATE, DELETE ON Excursion TO user2;

END;

IF NOT EXISTS (SELECT * FROM sys.sysusers WHERE name = 'user3')
BEGIN
    USE [Excursion];
    CREATE USER user3 FOR LOGIN user3;
    GRANT SELECT ON Driver TO user3;
GRANT SELECT ON Bus TO user3;

END;
