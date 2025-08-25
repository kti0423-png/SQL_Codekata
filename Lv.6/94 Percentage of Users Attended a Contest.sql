with A as(
    select count(1) as cnt
    from users
)

select
    contest_id,
    Round((count(distinct user_id)/A.cnt*100),2) as percentage
from register, A
group by 1
order by 2 desc, 1 asc;