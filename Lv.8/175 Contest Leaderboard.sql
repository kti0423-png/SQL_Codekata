select h.hacker_id, h.name, sum(max_score) as sum_score
from (
select hacker_id, challenge_id, max(score) as max_score
from submissions
group by hacker_id, challenge_id) as a
inner join hackers as h on a.hacker_id=h.hacker_id
group by h.hacker_id, h.name
having sum_score <> 0
order by sum_score desc, h.hacker_id asc;