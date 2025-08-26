with A as (
    select
        query_name,
        count(1) as total_cnt
    from queries
    group by query_name
),
B as (
    select
    query_name,
    count(1) as poor_cnt
    from queries
    where rating < 3
    group by query_name
),
C as (
    select
        query_name,
        sum(rating/position) as ratio
    from queries
    group by query_name
)

select
    A.query_name,
    Round(C.ratio/A.total_cnt,2) as quality,
    coalesce(Round(B.poor_cnt/A.total_cnt*100,2),0) as poor_query_percentage
from A
left join B on A.query_name = B.query_name
left join C on A.query_name = C.query_name