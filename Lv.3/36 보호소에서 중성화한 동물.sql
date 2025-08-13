select
    animal_id,
    animal_type,
    name
from
(
SELECT
    i.animal_id,
    i.animal_type,
    i.name,
    i.sex_upon_intake,
    o.sex_upon_outcome
from animal_ins i
inner join animal_outs o
on i.animal_id=o.animal_id
where i.sex_upon_intake like ('Intact%')
) a
where
    sex_upon_outcome like ('Neutered%')
    or sex_upon_outcome like ('Spayed%')
order by animal_id