select
    num as consecutivenums
from
(
select
    *,
    lag(num,1) over (order by id) as lag_num,
    lag(num,2) over (order by id) as lag_num2
from logs
) a
where
    num = lag_num
    and lag_num = lag_num2
group by consecutivenums