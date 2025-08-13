select
    b.hour,
    count(animal_id) as count
from
(
select
    a.animal_id,
    case
        when a.datetime between '09:00' and '09:59' then 9
        when a.datetime between '10:00' and '10:59' then 10
        when a.datetime between '11:00' and '11:59' then 11
        when a.datetime between '12:00' and '12:59' then 12
        when a.datetime between '13:00' and '13:59' then 13
        when a.datetime between '14:00' and '14:59' then 14
        when a.datetime between '15:00' and '15:59' then 15
        when a.datetime between '16:00' and '16:59' then 16
        when a.datetime between '17:00' and '17:59' then 17
        when a.datetime between '18:00' and '18:59' then 18
        when a.datetime between '19:00' and '19:59' then 19
        end as hour
from
(
select
    animal_id,
    date_format(datetime, '%H:%m') as datetime
from animal_outs
where date_format(datetime, '%H:%m') between '09:00' and '19:59'
) a
) b
group by 1
order by 1 asc;