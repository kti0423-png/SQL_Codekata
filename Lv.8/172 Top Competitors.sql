select
    s.hacker_id, h.name
from submissions as s
left join challenges as c on s.challenge_id=c.challenge_id
left join difficulty as d on c.difficulty_level=d.difficulty_level
left join hackers as h on s.hacker_id=h.hacker_id
where
    s.score=d.score
    and c.difficulty_level=d.difficulty_level
group by s.hacker_id, h.name
having count(h.hacker_id) > 1
order by count(h.hacker_id) desc, s.hacker_id asc;