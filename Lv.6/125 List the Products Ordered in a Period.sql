select
    p.product_name,
    sum(o.unit) as unit
from orders as o
left join products as p on o.product_id=p.product_id
where o.order_date like '2020-02%'
group by o.product_id
having unit >= 100