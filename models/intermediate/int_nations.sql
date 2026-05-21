{{ config(
    materialized='incremental',
    unique_key='nation_id'
) }}

SELECT *
FROM {{ ref('stg_nations') }}