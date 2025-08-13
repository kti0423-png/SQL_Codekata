select
    p.product_code,
    sum(p.price*s.sales_amount) as sales
from product p
left join offline_sale s
on p.product_id=s.product_id
group by 1
order by 2 desc, 1 asc;