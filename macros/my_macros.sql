-- {% macro usd_eur(amount, decimals) %}

--     CAST(
--         ROUND(({{ amount }} * 0.86), {{ decimals }})
--         AS NUMBER(20,2)
--     )

-- {% endmacro %}

{% macro usd_eur(col, scale=2) -%}

    ({{ col }} * 0.86)::number(18, {{ scale }})

{%- endmacro %}