﻿CREATE TABLE [dbo].[Company]
(
    [Id] INT NOT NULL PRIMARY KEY, 
    [Name] NVARCHAR(20) NOT NULL, 
    [AddressId] INT NOT NULL FOREIGN KEY REFERENCES [Address](Id)
)
