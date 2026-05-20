select * from ref('int_lineitem')
where
ROUND(inventory_value_usd,0) != ROUND(inventory_value_eur/0.86,0)