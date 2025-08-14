select
    year(o.sales_date) as YEAR,
    month(o.sales_date) as MONTH,
    i.gender,
    count(distinct o.user_id) as USERS
from user_info i
inner join online_sale o
on i.user_id=o.user_id
group by 1,2,3
having i.gender is not null
order by 1,2,3 asc;