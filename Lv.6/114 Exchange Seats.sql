select
    id,
    case
        when id % 2 <> 0 and lead_id is null then student
        when id % 2 <> 0 then lead_id
        when id % 2 = 0 then lag_id
        end as student
from
(
select
    id,
    student,
    lag(student,1) over (order by id) as lag_id,
    lead(student,1) over (order by id) as lead_id
from seat
) a
order by id asc;