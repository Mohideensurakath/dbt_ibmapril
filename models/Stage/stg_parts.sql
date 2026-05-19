WITH stg_parts AS (

    SELECT
        P_PARTKEY AS part_id,
        P_NAME AS name,
        P_TYPE AS type,
        P_SIZE AS size,
        P_MFGR AS manufacturer,
        P_BRAND AS brand,
        P_COMMENT AS comment,
        P_CONTAINER AS container,
        P_RETAILPRICE AS retail_price
        

    FROM {{ source('src', 'parts') }}

)


SELECT *
FROM stg_parts