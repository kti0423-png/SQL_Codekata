with A as (
select
    requester_id
from requestaccepted
Union all
select
    accepter_id
from requestaccepted
)

select
    A.requester_id as id,
    count(1) as num
from A
group by 1
order by 2 desc limit 1