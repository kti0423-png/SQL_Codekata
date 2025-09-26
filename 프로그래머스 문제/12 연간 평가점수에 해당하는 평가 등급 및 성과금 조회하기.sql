with hr_grade as (
select emp_no, year, avg(score) as score
from hr_grade
group by 1,2)

select
    e.emp_no, e.emp_name,
    case
        when g.score >= 96 then 'S'
        when g.score >= 90 then 'A'
        when g.score >= 80 then 'B'
        else 'C' end as grade,
    case
        when g.score >= 96 then e.sal*0.2
        when g.score >= 90 then e.sal*0.15
        when g.score >= 80 then e.sal*0.1
        else 0 end as bonus
from hr_employees as e
left join hr_grade as g on e.emp_no = g.emp_no
order by e.emp_no asc;