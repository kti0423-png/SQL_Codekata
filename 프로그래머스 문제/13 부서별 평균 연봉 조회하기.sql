select
    d.dept_id, d.dept_name_en, round(avg(e.sal),0) as avg_sal
from hr_employees as e
left join hr_department as d on e.dept_id = d.dept_id
group by 1, 2
order by avg_sal desc;