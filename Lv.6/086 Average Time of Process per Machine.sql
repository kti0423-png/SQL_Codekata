with A as(
select
    machine_id,
    process_id,
    timestamp as start_time
from activity
where activity_type = 'start'
),
B as (
select
    machine_id,
    process_id,
    timestamp as end_time
from activity
where activity_type = 'end'
),
C as(
select
    machine_id,
    count(distinct process_id) as cnt
from activity
group by machine_id
)

select
    A.machine_id,
    Round((sum(B.end_time-A.start_time)/C.cnt),3) as processing_time
from A
inner join B
on
    A.process_id=B.process_id
    and A.machine_id=B.machine_id
inner join C
on A.machine_id=C.machine_id
group by A.machine_id