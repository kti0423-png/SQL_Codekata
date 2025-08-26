select
    p.project_id,
    Round(avg(e.experience_years),2) as average_years
from project p
inner join employee e on p.employee_id=e.employee_id
group by 1