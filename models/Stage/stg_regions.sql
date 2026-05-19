with region_cte as (
SELECT 
        R_REGIONKEY AS region_id,
        R_NAME AS name,
        R_COMMENT AS comment
    from {{source('src','regions')}}
)
SELECT *
FROM region_cte