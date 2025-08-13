select
	animal_type,
	count(animal_id) as count
from animal_ins
where animal_type in ('Cat','Dog') and animal_type is not null
group by 1
order by animal_type asc;