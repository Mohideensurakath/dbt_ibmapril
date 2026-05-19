WITH stg_suppliers AS (

    SELECT
        S_SUPPKEY AS supplier_id,
        S_NATIONKEY AS nation_id,
        S_NAME AS supplier_name,
        S_ADDRESS AS supplier_address,
        S_PHONE AS phone_number,
        S_COMMENT AS comment,
        S_ACCTBAL AS account_balance,
        UPDATED_TIME AS updated_time

    FROM {{ source('src', 'suppliers') }}

)

SELECT *
FROM stg_suppliers