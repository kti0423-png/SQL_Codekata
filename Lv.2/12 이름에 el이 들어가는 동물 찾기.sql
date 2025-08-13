select
	animal_id,
	name
from
(
select
	animal_id,
	name,
	animal_type
from animal_ins
where animal_type = 'Dog'
) a
where
	name like ('%el')
	or name like ('el%')
	or name like ('%el%')
order by name