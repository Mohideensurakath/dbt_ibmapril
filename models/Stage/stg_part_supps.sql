WITH stg_part_supps AS (

    SELECT
        PS_PARTKEY AS part_id,
        PS_SUPPKEY AS supplier_id,
        PS_COMMENT AS comment,
        PS_AVAILQTY AS available_quantity,
        PS_SUPPLYCOST AS cost
        

    FROM {{ source('src', 'partsupps') }}

)

SELECT *
FROM stg_part_supps