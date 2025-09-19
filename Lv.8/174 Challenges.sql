select h.hacker_id, h.name, count(*) as challenges_created
from hackers as h
left join challenges as c on h.hacker_id=c.hacker_id
group by h.hacker_id, h.name
having
    challenges_created in (
                        select a.cnt
                        from(
                            select hacker_id, count(*) as cnt
                            from challenges
                            group by hacker_id) as a
                        group by a.cnt
                        having count(*) = 1)
    or challenges_created = (
                            select max(b.cnt)
                            from (
                                select hacker_id, count(*) as cnt
                                from challenges
                                group by hacker_id) as b)
order by challenges_created desc, h.hacker_id asc;