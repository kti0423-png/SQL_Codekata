with A as (
select *
from products
where (product_id, change_date) in (
    select product_id, max(change_date)
    from products
    where change_date <= '2019-08-16'
    group by product_id)
)

select
    p.product_id,
    case
        when A.product_id is null then 10
        when A.product_id is not null then A.new_price
        end as price
from products as p
left join A on p.product_id=A.product_id
group by p.product_id