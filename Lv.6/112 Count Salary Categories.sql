with A as (
select 'Low Salary' as category
union select 'Average Salary'
union select 'High Salary'
),
B as (
select
    case
        when income < 20000 then 'Low Salary'
        when income between 20000 and 50000 then 'Average Salary'
        when income > 50000 then 'High Salary'
        end as category,
    count(1) as cnt
from accounts
group by category
)

select
    A.category,
    coalesce(cnt,0) as accounts_count
from A
left join B on A.category=B.category