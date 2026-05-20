select * from ref('int_part_supps_statistics')
where
ROUND(inventory_value_usd,0) != ROUND(inventory_value_eur/0.86,0)