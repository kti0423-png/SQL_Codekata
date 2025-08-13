SELECT
    i.animal_id,
    i.name
from animal_ins i
inner join animal_outs o
on i.animal_id=o.animal_id
where o.animal_id is not null
order by datediff(o.datetime,i.datetime) desc limit 2