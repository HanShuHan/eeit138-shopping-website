-- Create webshop database if it doesn't exist
IF NOT EXISTS (
    SELECT name
    FROM master.sys.databases
    WHERE name = N'webshop'
)
BEGIN
    CREATE DATABASE [webshop];
END
GO
