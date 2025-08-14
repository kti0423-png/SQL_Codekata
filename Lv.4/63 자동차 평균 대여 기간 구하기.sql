select
    car_id,
    round(avg(datediff(end_date,start_date)+1),1) as AVERAGE_DURATION
from car_rental_company_rental_history
group by 1
having round(avg(datediff(end_date,start_date)+1),1) >= 7
order by 2 desc, 1 desc;