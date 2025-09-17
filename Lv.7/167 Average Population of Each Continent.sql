select
    co.continent,
    floor(avg(c.population))
from city as c
inner join country as co on c.countrycode=co.code
group by co.continent;