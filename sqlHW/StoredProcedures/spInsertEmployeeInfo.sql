CREATE PROCEDURE spInsertEmployeeInfo
    @EmployeeName nvarchar(100),
    @FirstName nvarchar(100),
    @LastName nvarchar(100),
    @CompanyName nvarchar(100),
    @Position nvarchar(100),
    @Street nvarchar(100),
    @City nvarchar(50),
    @State nvarchar(50),
    @ZipCode nvarchar(20)
AS
BEGIN
    DECLARE @PersonId INT, @AddressId INT;
    
    IF (COALESCE(@EmployeeName, @FirstName, @LastName) IS NULL) OR
       ((@EmployeeName IS NOT NULL AND LTRIM(@EmployeeName) = '') OR
       (@FirstName IS NOT NULL AND LTRIM(@FirstName) = '') OR
       (@LastName IS NOT NULL AND LTRIM(@LastName) = ''))
    BEGIN
        RAISERROR('At least one of the fields EmployeeName, FirstName or LastName must be non-empty and non-null', 16, 1);
        RETURN;
    END

    IF (LEN(@CompanyName) > 20)
    BEGIN
        SET @CompanyName = LEFT(@CompanyName, 20);
    END

    INSERT INTO [dbo].[Address] (Street, City, State, ZipCode)
    VALUES (@Street, @City, @State, @ZipCode);

    SET @AddressId = SCOPE_IDENTITY();

    INSERT INTO [dbo].[Person] (FirstName, LastName)
    VALUES (@FirstName, @LastName);

    SET @PersonId = SCOPE_IDENTITY();

    INSERT INTO [dbo].[Employee] (AddressId, PersonId, CompanyName, Position, EmployeeName) 
    VALUES (@AddressId, @PersonId, @CompanyName, @Position, @EmployeeName);
END;