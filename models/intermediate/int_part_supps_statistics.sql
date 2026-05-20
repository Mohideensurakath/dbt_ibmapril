WITH int_part_supps_statistics AS (

    SELECT
        sup.supplier_id,
        p.part_id,
        sup.supplier_name,
        p.name AS part_name,

        -- 1 Inventory Value USD
        available_quantity * cost AS inventory_value_usd,

        -- Inventory Value EUR
        {{ usd_eur('ps.available_quantity * ps.cost', 2) }}
            AS inventory_value_eur,

        -- 2 Unit Margin
        retail_price - cost AS unit_margin,

        -- 3 Margin Percent
        ROUND(
            (
                (retail_price - cost)
                / NULLIF(retail_price,0)
            ) * 100,
            2
        ) AS margin_percent,

        -- 4 Inventory Level
        CASE
            WHEN available_quantity >= 8000 THEN 'HIGH'
            WHEN available_quantity >= 3000 THEN 'MEDIUM'
            ELSE 'LOW'
        END AS inventory_level,

        -- 5 Supplier Financial Health
        CASE
            WHEN account_balance > 5000 THEN 'PREMIUM'
            WHEN account_balance <= 5000
                 AND account_balance > 0 THEN 'STANDARD'
            ELSE 'RISK'
        END AS supplier_financial_health,

        -- 6 Supplier Data Status
        CASE
            WHEN phone_number IS NULL
                 OR supplier_address IS NULL
            THEN FALSE
            ELSE TRUE
        END AS supplier_data_status,

        -- 7 Margin Status Normal
        CASE
            WHEN cost > retail_price THEN FALSE
            ELSE TRUE
        END AS margin_status_normal

    FROM {{ ref('stg_parts') }} p

    JOIN {{ ref('stg_part_supps') }} ps
        ON p.part_id = ps.part_id

    JOIN {{ ref('stg_suppliers') }} sup
        ON ps.supplier_id = sup.supplier_id

)

SELECT *
FROM int_part_supps_statistics