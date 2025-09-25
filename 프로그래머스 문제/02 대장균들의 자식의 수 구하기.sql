select
    id, sum(parent_id) as child_count
from
(
select d1.id,
    case
        when d2.parent_id is not null then 1
        when d2.parent_id is null then 0
        end as parent_id
from ecoli_data as d1
left join ecoli_data as d2 on d1.id = d2.parent_id
) a
group by id, parent_id