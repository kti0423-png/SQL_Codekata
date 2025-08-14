select
    a.cart_id
from
(
select
    cart_id,
    name
from cart_products
where name = 'Milk'
) as a
inner join
(
select
    cart_id,
    name
from cart_products
where name = 'Yogurt'
) as b
on a.cart_id=b.cart_id
order by 1