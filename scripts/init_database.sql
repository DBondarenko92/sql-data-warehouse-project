/*
================================================================================
Create Database and Schemas
================================================================================
Script Purpose:
  This script creates a new database 'DataWarehouse' after checking if it already exists.
  If it exists, we drop and recreate it. Additionally, the script sets up three schemas
  within the database: 'bronze', 'silver' and 'gold'.

Warning:
  Running this script will drop the entire 'DataWarehouse' database if it exists.
  All data in the database will be permanently deleted. Proceed with cautiom 
  and ensure you have proper backups before running this script.
/*

USE master;
GO

-- Drop and recreate "DataWarehouse" database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
  ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
  DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO 

-- Create Schemas
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
