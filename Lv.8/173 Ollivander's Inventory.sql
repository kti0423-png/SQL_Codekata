SELECT w.id, p.age, w.coins_needed, w.power
from wands as w
inner join wands_property as p on w.code=p.code
where
    p.is_evil = 0
    and w.coins_needed = (
    select min(w1.coins_needed)
    from wands as w1
    inner join wands_property as p1 on w1.code=p1.code
    where
        p1.is_evil = 0
        and w.power=w1.power
        and p.age=p1.age)
order by w.power desc, p.age desc;