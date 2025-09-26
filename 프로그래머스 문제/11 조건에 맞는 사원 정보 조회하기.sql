with hr_grade as (
select emp_no, year, sum(score) as score
from hr_grade
group by emp_no, year)

select
    g.score, e.emp_no, e.emp_name, e.position, e.email
from hr_employees as e
left join hr_grade as g on e.emp_no = g.emp_no
left join hr_department as d on e.dept_id = d.dept_id
order by g.score desc
limit 1