select distinct city
from station
WHERE
    left(city,1) not in ('a','e','i','o','u')
    and right(city,1) not in ('a','e','i','o','u')