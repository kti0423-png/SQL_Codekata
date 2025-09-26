select
    year, (max_year-size_of_colony) as year_dev, id
from
(
select
    id, size_of_colony, year(differentiation_date) as year,
    max(size_of_colony) over (partition by year(differentiation_date)) as max_year
from ecoli_data
) a
order by year, year_dev