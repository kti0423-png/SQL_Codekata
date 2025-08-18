with a as (select member_id
            from rest_review
            group by 1
            order by count(1) desc limit 1)
SELECT
    m.member_name,
    r.review_text,
    date_format(r.review_date,'%Y-%m-%d') as review_date
from a, member_profile as m
left join rest_review as r
on m.member_id=r.member_id
where r.member_id = a.member_id
order by r.review_date asc, r.review_text asc;