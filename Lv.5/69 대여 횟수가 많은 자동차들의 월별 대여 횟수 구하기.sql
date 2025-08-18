select
    month(start_date) as month,
    car_id,
    count(history_id) as records
from car_rental_company_rental_history
where
    start_date between '2022-08-01' and '2022-10-31'
    and car_id in (SELECT car_id
                    from car_rental_company_rental_history
                    where
                    start_date between '2022-08-01' and '2022-10-31'
                    group by car_id
                    having count(history_id)>=5
                    )
group by 1, 2
having count(history_id) <> 0
order by 1 asc, 2 desc;