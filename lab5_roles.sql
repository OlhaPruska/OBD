-- create role
--CREATE ROLE AdminR;
--CREATE ROLE ManagerR;
--CREATE ROLE DriverR;
--SELECT name FROM sys.database_principals WHERE type = 'R';

-- give privilege to role
GRANT SELECT, INSERT, UPDATE, DELETE ON Customer TO ManagerR;
GRANT SELECT, INSERT, UPDATE, DELETE ON Excursion TO ManagerR;

GRANT SELECT ON Driver TO DriverR;
GRANT SELECT ON Bus TO DriverR;
--give role to users
EXEC sp_addrolemember 'AdminR','user1';
EXEC sp_addrolemember 'ManagerR','user2';
EXEC sp_addrolemember 'DriverR','user3';


select * from sys.database_principals