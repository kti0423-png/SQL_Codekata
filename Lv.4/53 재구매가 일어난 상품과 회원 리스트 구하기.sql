select
    user_id,
    product_id
from online_sale
group by 1, 2
having
    count(user_id) >=2
    and count(product_id) >=2
order by 1 asc, 2 desc;