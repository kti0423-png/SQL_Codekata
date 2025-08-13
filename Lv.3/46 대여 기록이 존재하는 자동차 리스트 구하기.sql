SELECT
    distinct c.car_id
from car_rental_company_car c
left join car_rental_company_rental_history h
on c.car_id=h.car_id
where
    c.car_type = '세단'
    and h.start_date like ('%-10-%')
order by 1 desc;