{% macro usd_to_eur(amount) %}

    ROUND(({{ amount }} * 0.86))

{% endmacro %}