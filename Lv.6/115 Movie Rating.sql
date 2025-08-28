(
select
    u.name as results
from movierating e
left join users u on e.user_id=u.user_id
group by u.name
order by count(e.rating) desc, u.name asc limit 1
)
union all
(
select
    m.title as results
from movierating e
left join movies m on e.movie_id=m.movie_id
where e.created_at like ('2020-02%')
group by e.movie_id
order by avg(e.rating) desc, m.title limit 1
)