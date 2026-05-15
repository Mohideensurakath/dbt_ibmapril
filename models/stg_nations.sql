with nations as(
    SELECT
        n_nationkey as nation_id,
        n_regionkey as region_id,
        n_name as name,
        n_comment as comments
        from SOURCEDB.MK_MALL.nations
)
SELECT * from nations