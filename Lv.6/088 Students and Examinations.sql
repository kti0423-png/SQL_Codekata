select
    s.student_id,
    s.student_name,
    j.subject_name,
    count(e.student_id) as attended_exams
from students s
cross join subjects j
left join examinations e
on
    s.student_id=e.student_id
    and j.subject_name=e.subject_name
group by 1, 3
order by 1, 3