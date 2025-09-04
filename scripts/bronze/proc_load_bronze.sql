/*
===============================================================================
Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `COPY` command to load data from csv files into bronze tables.

Parameters:
    None. 
    This procedure does not accept any parameters or return any values.

Usage Example:
    CALL bronze.load_bronze();
===============================================================================
*/
CREATE OR REPLACE PROCEDURE bronze.load_bronze()
LANGUAGE plpgsql
AS $$
DECLARE
    start_time TIMESTAMP;
    end_time   TIMESTAMP;
    batch_start_time TIMESTAMP;
    batch_end_time   TIMESTAMP;
BEGIN
    batch_start_time := clock_timestamp();
    RAISE NOTICE '================================================';
    RAISE NOTICE 'Loading Bronze Layer';
    RAISE NOTICE '================================================';

    --------------------------------------------------------------------------
    -- CRM TABLES
    --------------------------------------------------------------------------
    RAISE NOTICE '------------------------------------------------';
    RAISE NOTICE 'Loading CRM Tables';
    RAISE NOTICE '------------------------------------------------';

    -- crm_cust_info
    start_time := clock_timestamp();
    RAISE NOTICE '>> Truncating Table: bronze.crm_cust_info';
    TRUNCATE TABLE bronze.crm_cust_info;
    RAISE NOTICE '>> Inserting Data Into: bronze.crm_cust_info';
    COPY bronze.crm_cust_info
    FROM 'C:/Program Files/PostgreSQL/17/data/datasets/source_crm/cust_info.csv'
    WITH (FORMAT csv, HEADER true);
    end_time := clock_timestamp();
    RAISE NOTICE '>> Load Duration: % seconds', EXTRACT(EPOCH FROM end_time - start_time);

    -- crm_prd_info
    start_time := clock_timestamp();
    RAISE NOTICE '>> Truncating Table: bronze.crm_prd_info';
    TRUNCATE TABLE bronze.crm_prd_info;
    RAISE NOTICE '>> Inserting Data Into: bronze.crm_prd_info';
    COPY bronze.crm_prd_info
    FROM 'C:/Program Files/PostgreSQL/17/data/datasets/source_crm/prd_info.csv'
    WITH (FORMAT csv, HEADER true);
    end_time := clock_timestamp();
    RAISE NOTICE '>> Load Duration: % seconds', EXTRACT(EPOCH FROM end_time - start_time);

    -- crm_sales_details
    start_time := clock_timestamp();
    RAISE NOTICE '>> Truncating Table: bronze.crm_sales_details';
    TRUNCATE TABLE bronze.crm_sales_details;
    RAISE NOTICE '>> Inserting Data Into: bronze.crm_sales_details';
    COPY bronze.crm_sales_details
    FROM 'C:/Program Files/PostgreSQL/17/data/datasets/source_crm/sales_details.csv'
    WITH (FORMAT csv, HEADER true, NULL '0', DELIMITER ';');
    end_time := clock_timestamp();
    RAISE NOTICE '>> Load Duration: % seconds', EXTRACT(EPOCH FROM end_time - start_time);

    -------------------------------------------------------------------------- */
    -- ERP TABLES
    --------------------------------------------------------------------------
    RAISE NOTICE '------------------------------------------------';
    RAISE NOTICE 'Loading ERP Tables';
    RAISE NOTICE '------------------------------------------------';

    -- erp_loc_a101
    start_time := clock_timestamp();
    RAISE NOTICE '>> Truncating Table: bronze.erp_loc_a101';
    TRUNCATE TABLE bronze.erp_loc_a101;
    RAISE NOTICE '>> Inserting Data Into: bronze.erp_loc_a101';
    COPY bronze.erp_loc_a101
    FROM 'C:/Program Files/PostgreSQL/17/data/datasets/source_erp/loc_a101.csv'
    WITH (FORMAT csv, HEADER true);
    end_time := clock_timestamp();
    RAISE NOTICE '>> Load Duration: % seconds', EXTRACT(EPOCH FROM end_time - start_time);

    -- erp_cust_az12
    start_time := clock_timestamp();
    RAISE NOTICE '>> Truncating Table: bronze.erp_cust_az12';
    TRUNCATE TABLE bronze.erp_cust_az12;
    RAISE NOTICE '>> Inserting Data Into: bronze.erp_cust_az12';
    COPY bronze.erp_cust_az12
    FROM 'C:/Program Files/PostgreSQL/17/data/datasets/source_erp/cust_az12.csv'
    WITH (FORMAT csv, HEADER true, NULL '0', DELIMITER ';');
    end_time := clock_timestamp();
    RAISE NOTICE '>> Load Duration: % seconds', EXTRACT(EPOCH FROM end_time - start_time);

    -- erp_px_cat_g1v2
    start_time := clock_timestamp();
    RAISE NOTICE '>> Truncating Table: bronze.erp_px_cat_g1v2';
    TRUNCATE TABLE bronze.erp_px_cat_g1v2;
    RAISE NOTICE '>> Inserting Data Into: bronze.erp_px_cat_g1v2';
    COPY bronze.erp_px_cat_g1v2
    FROM 'C:/Program Files/PostgreSQL/17/data/datasets/source_erp/px_cat_g1v2.csv'
    WITH (FORMAT csv, HEADER true);
    end_time := clock_timestamp();
    RAISE NOTICE '>> Load Duration: % seconds', EXTRACT(EPOCH FROM end_time - start_time);

    --------------------------------------------------------------------------
    -- END
    --------------------------------------------------------------------------
    batch_end_time := clock_timestamp();
    RAISE NOTICE '==========================================';
    RAISE NOTICE 'Loading Bronze Layer is Completed';
    RAISE NOTICE '   - Total Load Duration: % seconds', EXTRACT(EPOCH FROM batch_end_time - batch_start_time);
    RAISE NOTICE '==========================================';

EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE '==========================================';
        RAISE NOTICE 'ERROR OCCURRED DURING LOADING BRONZE LAYER';
        RAISE NOTICE 'Error Message: %', SQLERRM;
        RAISE NOTICE '==========================================';
END;
$$;
