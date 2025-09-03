/*
=============================================================
Init Database Script for PostgreSQL
=============================================================
Purpose:
    This script initializes a new database named 'datawarehouse' 
    and sets up three schemas: 'bronze', 'silver', and 'gold'.
    
WARNING:
    Running this script will DROP the existing 'datawarehouse' database
    if it exists. All data in that database will be permanently deleted.
    Make sure you have proper backups before executing.
=============================================================
*/

-- =============================================================
-- STEP 1: Run this section while connected to the 'postgres' database
-- =============================================================

-- Drop the database if it exists
DROP DATABASE IF EXISTS datawarehouse;

-- Create a fresh 'datawarehouse' database
CREATE DATABASE datawarehouse;

-- =============================================================
-- STEP 2: Connect manually to the new 'datawarehouse' database
-- =============================================================
-- In pgAdmin: right-click on 'datawarehouse' → Connect → Query Tool
-- In psql:   \c datawarehouse
-- =============================================================

-- =============================================================
-- STEP 3: Create Schemas inside 'datawarehouse'
-- =============================================================
CREATE SCHEMA IF NOT EXISTS bronze;
CREATE SCHEMA IF NOT EXISTS silver;
CREATE SCHEMA IF NOT EXISTS gold;


-- =============================================================
-- Script completed
-- =============================================================
