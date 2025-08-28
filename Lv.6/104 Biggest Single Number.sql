select
    if(count(1)<>0,max(num),null) as num
from mynumbers
where num in (
    select num
    from mynumbers
    group by num
    having count(num) = 1)