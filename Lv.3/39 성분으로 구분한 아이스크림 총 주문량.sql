select
    i.ingredient_type,
    sum(f.total_order) as TOTAL_ORDER
from first_half f
left join icecream_info i
on f.flavor=i.flavor
group by 1
order by 2 asc;