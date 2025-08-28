select
    PRICE_GROUP,
    count(PRICE_GROUP) as PRODUCTS
from
(
select
    case
        when price < 10000 then 0
        when price between 10000 and 19999 then 10000
        when price between 20000 and 29999 then 20000
        when price between 30000 and 39999 then 30000
        when price between 40000 and 49999 then 40000
        when price between 50000 and 59999 then 50000
        when price between 60000 and 69999 then 60000
        when price between 70000 and 79999 then 70000
        when price between 80000 and 89999 then 80000
        when price between 90000 and 99999 then 90000
        end as PRICE_GROUP
from product
) a
group by 1
order by 1 asc;


set @price = 0;
select
    @price := @price + 10000 as price_group,
    (select count(1)
    from product
    where price between @price and @price + 9999) as products
from product
where @price < 80000
order by 1 asc;

select
    floor(price/10000)*10000 as price_group,
    count(1) as products
from product
group by 1
order by 1 asc;