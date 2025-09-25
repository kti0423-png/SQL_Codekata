select
    id,
    case
        when size_of_colony <= 100 then 'LOW'
        when size_of_colony > 1000 then 'HIGH'
        else 'MEDIUM' end as SIZE
from ecoli_data
order by 1 asc;