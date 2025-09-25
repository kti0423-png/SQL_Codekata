select
    id,
    case
        when PERCENT_RANK() over (order by size_of_colony desc) <= 0.25 then 'CRITICAL'
        when PERCENT_RANK() over (order by size_of_colony desc) <= 0.5 then 'HIGH'
        when PERCENT_RANK() over (order by size_of_colony desc) <= 0.75 then 'MEDIUM'
        else 'LOW' end as COLONY_NAME
from ecoli_data
order by id