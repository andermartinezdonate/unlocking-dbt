-- =========================================
-- EDA: Schema + sample data (DuckDB / dbt)
-- =========================================

-- ---------- raw_customers ----------
SELECT 
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns
WHERE table_name = 'raw_customers'
ORDER BY ordinal_position;

SELECT * 
FROM raw_customers 
LIMIT 10;

-- ---------- raw_orderitems ----------
SELECT 
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns
WHERE table_name = 'raw_orderitems'
ORDER BY ordinal_position;

SELECT * 
FROM raw_orderitems 
LIMIT 10;

-- ---------- raw_orders ----------
SELECT 
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns
WHERE table_name = 'raw_orders'
ORDER BY ordinal_position;

SELECT * 
FROM raw_orders 
LIMIT 10;

-- ---------- raw_products ----------
SELECT 
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns
WHERE table_name = 'raw_products'
ORDER BY ordinal_position;

SELECT * 
FROM raw_products 
LIMIT 10;
