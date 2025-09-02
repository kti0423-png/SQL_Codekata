select
    department, employee, salary
from
(
select
    e.name as employee, e.salary, d.name as department,
    Dense_Rank() over (partition by e.departmentid order by e.salary desc) as Rank_sal
from employee as e
inner join department as d on e.departmentid=d.id
) a
where Rank_sal <= 3