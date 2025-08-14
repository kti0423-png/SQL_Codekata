select
    h.flavor
from first_half h
left join icecream_info i
on h.flavor=i.flavor
where
    i.ingredient_type = 'fruit_based'
    and h.total_order > 3000
order by h.total_order desc