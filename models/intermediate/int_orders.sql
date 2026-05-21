-- SELECT *
-- FROM {{ ref('stg_orders') }}

{{ config(materialized='table') }}
SELECT
    order_id,
    customer_id,
    comment,
    clerk_name,

    -- USD
    total_price AS inventory_value_usd,

    -- EUR
    {{ usd_eur('total_price') }}
        AS inventory_value_eur,

    status_code,
    priority_code,
    ship_priority,
    order_date

FROM {{ ref('stg_orders') }}