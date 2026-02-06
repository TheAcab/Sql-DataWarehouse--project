/* 
===========================================================
DDL scripts: Create silver tables
===========================================================
Script purpose:
This script creates tables in the silver schema, dropping existing tables if they already exist.
Run this script to re define the DDL sctructure of the Bronze tables
===========================================================
*/


if object_id ('silver.crm_cust_info' , 'U') is not null --this checks if the table exists, if it does, it will be removed and the new script will be put in its place
drop table silver.crm_cust_info; --run this script prior to all table creations!!!!


Create Table	silver.crm_cust_info(
	cst_id int, --this header infor much match 100% with the sources (excel file headers)
	cst_key nvarchar(50),
	cst_firstname nvarchar(50),
	cst_lastname nvarchar (50),
	cst_material_status nvarchar (50),
	cst_gndr nvarchar (50),
	cst_create_date date,
	dwh_create_date datetime default getdate()); --added metadata

if object_id ('silver.crm_prd_info' , 'U') is not null
drop table silver.crm_prd_info;
Create Table silver.crm_prd_info(
	prd_id int,
	cat_id nvarchar (50),
	prd_key nvarchar (50),
	prd_nm nvarchar (50),
	prd_cost int,
	prd_line nvarchar(50),
	prd_start_dt date,
	prd_end_dt date,
	dwh_create_date datetime default getdate())

if object_id ('silver.crm_sales_details' , 'U') is not null
drop table silver.crm_sales_details;

create table silver.crm_sales_details(
sls_ord_num nvarchar (50),
sls_prd_key nvarchar (50),
sls_cust_id int,
sls_order_dt date,
sls_ship_dt date,
sls_due_dt date,
sls_sales int,
sls_quantity int,
sls_price int,
	dwh_create_date datetime default getdate())


if object_id ('silver.erp_cust_az12' , 'U') is not null
drop table silver.erp_cust_az12;
create table silver.erp_cust_az12(
cid nvarchar (50),
bdate date,
gen nvarchar(50),
	dwh_create_date datetime default getdate())


if object_id ('silver.erp_loc_a101' , 'U') is not null
drop table silver.erp_loc_a101;
create table silver.erp_loc_a101(
cid nvarchar (50),
cntry nvarchar (50),
	dwh_create_date datetime default getdate())


if object_id ('silver.erp_px_cat_g1v2' , 'U') is not null
drop table silver.erp_px_cat_g1v2;
create table silver.erp_px_cat_g1v2(
id nvarchar(50),
cat nvarchar (50),
subcat nvarchar(50),
maintenance nvarchar (50),
	dwh_create_date datetime default getdate())
