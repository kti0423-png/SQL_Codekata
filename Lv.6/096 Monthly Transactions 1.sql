select
    date_format(trans_date,'%Y-%m') as month,
    country,
    count(id) as trans_count,
    sum(state = 'approved') as approved_count,
    sum(amount) as trans_total_amount,
    sum((state = 'approved') * amount) as approved_total_amount
from transactions
group by 1, 2