with A as(
    select id, name
    from employee
),
B as(
    select id,managerid
    from employee
)
select
    A.name
from A
inner join B on B.managerid=A.id
group by B.managerid
having count(1) >= 5