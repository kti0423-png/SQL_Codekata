select lat_n
from
(
select
    round(lat_n,4) as lat_n,
    percent_rank() over (order by lat_n) as per_lat_n
from station
) a
where per_lat_n = 0.5;