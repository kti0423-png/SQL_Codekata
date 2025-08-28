select
    e.employee_id
from employees e
left join employees p on e.manager_id=p.employee_id
where
    e.manager_id is not null
    and p.employee_id is null
    and e.salary < 30000
order by 1