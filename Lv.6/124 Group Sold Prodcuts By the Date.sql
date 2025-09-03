select
    a.sell_date,
    a.num_sold,
    b.products
from (
    select
        sell_date,
        count(distinct product) as num_sold
    from activities
    group by 1
) as a
inner join (
    select
        sell_date,
        group_concat(distinct product order by product) as products
        from activities
        group by 1
) as b
on a.sell_date=b.sell_date
order by a.sell_date