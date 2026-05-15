with region_cte as (
SELECT 
        R_REGIONKEY AS region_id,
        R_NAME AS name,
        R_COMMENT AS comment
    FROM SOURCEDB.MK_MALL.REGIONS
)

SELECT *
FROM region_cte