select
    c.car_id,
    c.car_type,
    Round(c.daily_fee*30*(100-p.discount_rate)/100) as fee
from car_rental_company_car c
inner join car_rental_company_rental_history h on c.car_id=h.car_id
inner join car_rental_company_discount_plan p on c.car_type=p.car_type
where
    c.car_id not in (select car_id
                    from car_rental_company_rental_history
                    where start_date < '2022-12-01' and end_date > '2022-10-31')
    and p.duration_type = '30일 이상'
group by c.car_id
having
    c.car_type in ('세단','SUV')
    and fee >= 500000 and fee < 2000000
order by fee desc, c.car_type asc, c.car_id desc;