{% test currency_conversion(model) %}

SELECT *
FROM {{ model }}
WHERE
ROUND(inventory_value_usd,0) != ROUND(inventory_value_eur / 0.86,0)

{% endtest %}