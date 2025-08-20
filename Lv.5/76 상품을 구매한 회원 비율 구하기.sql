with A as
(
SELECT
    count(distinct user_id) as cnt_user
from user_info
where
    joined like '2021-%'
),
B as
(
SELECT
    year(o.sales_date) as year,
    month(o.sales_date) as month,
    count(distinct o.user_id) as purchased_users
from user_info i
join online_sale o on i.user_id=o.user_id
where
    i.joined like '2021-%'
group by 1,2
)

select
    B.year,
    B.month,
    B.purchased_users,
    Round(B.purchased_users/A.cnt_user,1) as purchased_ratio
from A, B
group by 1,2
order by 1 asc, 2 asc;