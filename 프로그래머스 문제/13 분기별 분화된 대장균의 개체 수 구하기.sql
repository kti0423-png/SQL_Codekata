select
    case
        when quarter(DIFFERENTIATION_DATE) = 1 then '1Q'
        when quarter(DIFFERENTIATION_DATE) = 2 then '2Q'
        when quarter(DIFFERENTIATION_DATE) = 3 then '3Q'
        when quarter(DIFFERENTIATION_DATE) = 4 then '4Q'
        end as QUARTER,
    count(*) as ECOLI_COUNT
from ecoli_data
group by 1
order by 1