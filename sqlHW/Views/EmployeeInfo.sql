CREATE VIEW [dbo].[EmployeeInfo]
AS
SELECT 
    Employee.Id AS EmployeeId,
    ISNULL(EmployeeName, (FirstName + ' ' + LastName)) AS EmployeeFullName,
    (ZipCode + ' ' + ISNULL(State, '') + ', ' + City + ' - ' + Street) AS EmployeeFullAddress,
    (CompanyName + ' (' + Position + ')') AS EmployeeCompanyInfo
FROM 
    Employee
INNER JOIN 
    Person ON Employee.PersonId = Person.Id
INNER JOIN 
    Address ON Employee.AddressId = Address.Id;