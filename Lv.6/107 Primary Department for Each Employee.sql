with A as (
select employee_id
from employee
group by employee_id
having count(department_id) = 1
)

select
    e.employee_id,
    case
        when e.employee_id = A.employee_id then e.department_id
        when e.primary_flag = 'Y' then e.department_id
        end as department_id
from employee as e
left join A on e.employee_id=A.employee_id
where
    e.employee_id = A.employee_id
    or e.primary_flag = 'Y'