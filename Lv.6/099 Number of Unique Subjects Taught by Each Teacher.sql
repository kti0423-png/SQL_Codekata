select
    teacher_id,
    count(subject_id) as cnt
from
(
select
    teacher_id,
    subject_id
from teacher
group by 1, 2
) a
group by 1