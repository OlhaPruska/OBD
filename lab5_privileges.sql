GRANT SELECT, INSERT, UPDATE, DELETE ON Customer TO ManagerR;
GRANT SELECT, INSERT, UPDATE, DELETE ON Excursion TO ManagerR;

GRANT SELECT ON Driver TO DriverR;
GRANT SELECT ON Bus TO DriverR;


EXEC sp_addrolemember 'AdminR','user1';
EXEC sp_addrolemember 'ManagerR','user2';
EXEC sp_addrolemember 'DriverR','user3';
