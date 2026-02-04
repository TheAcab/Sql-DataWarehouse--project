/*Create Database and Schemas
==================================
Script purpose:
  this script creates a new database name 'Datawarehouse' after checking if it already exists.
  if the databse exists, it is dropped and recreated. 
  additionally, the script sets up three schemas: bronze, silver and gold

Warning:
  running this script will drop the entire 'Datawarehouse' database if it exists.
  all data in the database will be permanently deleted
  process with caution and ensure you have back ups */
====================================
use master;
go

if exists(select 1 from sys.database where name = 'datawarehouse')
begin
alter database Datawarehouse
set single_user with rollback immediate;
drop databse Datawarehouse;
end;
go

--Create the Datawarehouse database
create databse datawarehouse
go

use datawarehouse
go

--create schema
create schema Bronze

create schema Gold

create schema Silver


