with A as (select c.daily_fee,c.car_type,h.history_id,
                case
                    when datediff(h.end_date,h.start_date)+1 >= 90 then '90일 이상'
                    when datediff(h.end_date,h.start_date)+1 >= 30 then '30일 이상'
                    when datediff(h.end_date,h.start_date)+1 >= 7 then '7일 이상'
                    else 'NONE' end as duration_type,
                    datediff(h.end_date,h.start_date)+1 as period
           from car_rental_company_car as c
           inner join car_rental_company_rental_history as h on c.car_id=h.car_id
           where c.car_type = '트럭'
          )

SELECT
    A.history_id,
    round(A.daily_fee*A.period*(100-coalesce(p.discount_rate,0))/100) as fee
from A
left join car_rental_company_discount_plan p
on
    A.duration_type=p.duration_type
    and A.car_type=p.car_type
order by fee desc, h.history_id desc;