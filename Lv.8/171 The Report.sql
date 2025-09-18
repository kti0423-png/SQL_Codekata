select
    s.name,
    g.grade,
    s.marks
from students as s
inner join grades as g on s.marks between g.min_mark and g.max_mark
where g.grade >= 8
order by g.grade desc, name asc;

select
    Null,
    g.grade,
    s.marks
from students as s
inner join grades as g on s.marks between g.min_mark and g.max_mark
where g.grade < 8
order by g.grade desc, s.marks asc;