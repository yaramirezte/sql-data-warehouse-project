/*
===============================================================================
DDL Script: Create Bronze Tables (PostgreSQL Version)
===============================================================================
Script Purpose:
    This script creates tables in the 'bronze' schema, dropping existing tables 
    if they already exist.
    Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================
*/

-- Drop tables if they exist
DROP TABLE IF EXISTS bronze.crm_cust_info CASCADE;
DROP TABLE IF EXISTS bronze.crm_prd_info CASCADE;
DROP TABLE IF EXISTS bronze.crm_sales_details CASCADE;
DROP TABLE IF EXISTS bronze.erp_loc_a101 CASCADE;
DROP TABLE IF EXISTS bronze.erp_cust_az12 CASCADE;
DROP TABLE IF EXISTS bronze.erp_px_cat_g1v2 CASCADE;

-- Create bronze.crm_cust_info
CREATE TABLE bronze.crm_cust_info (
    cst_id             INTEGER,
    cst_key            VARCHAR(50),
    cst_firstname      VARCHAR(50),
    cst_lastname       VARCHAR(50),
    cst_marital_status VARCHAR(50),
    cst_gndr           VARCHAR(50),
    cst_create_date    TIMESTAMP
);

-- Create bronze.crm_prd_info
CREATE TABLE bronze.crm_prd_info (
    prd_id       INTEGER,
    prd_key      VARCHAR(50),
    prd_nm       VARCHAR(50),
    prd_cost     INTEGER,
    prd_line     VARCHAR(50),
    prd_start_dt TIMESTAMP,
    prd_end_dt   TIMESTAMP
);

-- Create bronze.crm_sales_details
CREATE TABLE bronze.crm_sales_details (
    sls_ord_num  VARCHAR(50),
    sls_prd_key  VARCHAR(50),
    sls_cust_id  INTEGER,
    sls_order_dt TIMESTAMP,
    sls_ship_dt  TIMESTAMP,
    sls_due_dt   TIMESTAMP,
    sls_sales    INTEGER,
    sls_quantity INTEGER,
    sls_price    INTEGER
);

-- Create bronze.erp_loc_a101
CREATE TABLE bronze.erp_loc_a101 (
    cid   VARCHAR(50),
    cntry VARCHAR(50)
);

-- Create bronze.erp_cust_az12
CREATE TABLE bronze.erp_cust_az12 (
    cid   VARCHAR(50),
    bdate TIMESTAMP,
    gen   VARCHAR(50)
);

-- Create bronze.erp_px_cat_g1v2
CREATE TABLE bronze.erp_px_cat_g1v2 (
    id          VARCHAR(50),
    cat         VARCHAR(50),
    subcat      VARCHAR(50),
    maintenance VARCHAR(50)
);
