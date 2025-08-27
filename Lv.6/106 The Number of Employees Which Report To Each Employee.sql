select
    A.employee_id,
    A.name,
    count(B.reports_to) as reports_count,
    Round(avg(B.age)) as average_age
from employees as A
join employees as B on A.employee_id=B.reports_to
group by A.employee_id
order by A.employee_id