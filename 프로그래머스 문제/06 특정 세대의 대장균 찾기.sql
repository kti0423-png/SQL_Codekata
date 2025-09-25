select d1.id
from ecoli_data as d1
left join ecoli_data as d2 on d1.parent_id = d2.id
left join ecoli_data as d3 on d2.parent_id = d3.id
where
    d2.parent_id is not null
    and d3.parent_id is null
order by 1 asc;