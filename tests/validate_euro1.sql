select * from ref('int_orders')
where
ROUND(inventory_value_usd,0) != ROUND(inventory_value_eur/0.86,0)