(
select x, y
from
(
select x, y,
    if(concat(x,',',y)in(
        select concat(y,',',x)
        from functions),1,0) as sym
from functions
where x <> y
) a
where sym = 1 and x <= y
)
union
(
select x, y
from functions
where x = y
group by x, y
having count(*) > 1
)
order by x