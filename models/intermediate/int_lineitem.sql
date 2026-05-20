-- SELECT *
-- FROM {{ ref('stg_line_items') }}

WITH stg_line_items AS (

    SELECT
        L_ORDERKEY AS order_id,
        L_PARTKEY AS part_id,
        L_SUPPKEY AS supplier_id,
        L_LINENUMBER AS line_number,
        L_COMMENT AS comment,
        L_SHIPMODE AS ship_mode,
        L_SHIPINSTRUCT AS ship_instructions,
        L_QUANTITY AS quantity,

        -- USD
        L_EXTENDEDPRICE AS extended_price_usd,

        -- EUR
        {{ usd_eur('L_EXTENDEDPRICE') }}
            AS extended_price_eur,

        L_DISCOUNT AS discount_percentage,
        L_TAX AS tax_rate,
        L_LINESTATUS AS status_code,
        L_RETURNFLAG AS return_flag,
        L_SHIPDATE AS ship_date,
        L_COMMITDATE AS commit_date,
        L_RECEIPTDATE AS receipt_date

    FROM {{ source('src', 'lineitems') }}

)

SELECT *
FROM stg_line_items