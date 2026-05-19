select * from {{ ref('int_customers') }} 
where account_balance between -10 and 0
