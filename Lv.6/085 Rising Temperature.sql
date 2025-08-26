select
    id
from
(
select
    id,
    temperature,
    recorddate,
    lag(temperature,1) over (order by recorddate) as lag_tem,
    lag(recorddate,1) over (order by recorddate) as lag_date
from weather
) a
where
    temperature > lag_tem
    and recorddate = date_add(lag_date, interval 1 day);