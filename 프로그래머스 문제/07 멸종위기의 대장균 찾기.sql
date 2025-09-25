WITH RECURSIVE generations as (
    select id, parent_id, 1 as generation
    from ecoli_data
    where parent_id is null
    union all
    select e.id, e.parent_id, g.generation+1
    from ecoli_data as e
    inner join generations as g on e.parent_id = g.id
)

select
    count(*) as count, generation
from generations
where id not in (
    select distinct parent_id
    from generations
    where parent_id is not null)
group by generation
order by generation asc;