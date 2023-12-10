CREATE TRIGGER tr_Employee_ForInsert
ON Employee
AFTER INSERT
AS
BEGIN
    IF ((SELECT TRIGGER_NESTLEVEL()) > 1) RETURN;

    INSERT INTO Company(Name, AddressId)
    SELECT i.CompanyName, i.AddressId FROM inserted i
END;