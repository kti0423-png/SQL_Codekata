with A as (
select
    *, sum(weight) over (order by turn) as acc_weight
from queue
)

select
    person_name
from A
where acc_weight <= 1000
order by acc_weight desc limit 1;