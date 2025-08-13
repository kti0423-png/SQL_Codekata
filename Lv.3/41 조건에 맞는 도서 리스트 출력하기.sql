select
    book_id,
    date_format(published_date, '%Y-%m-%d') as published_date
from book
where
    date_format(published_date, '%Y-%m-%d') like ('2021%')
    and category = '인문'
order by 2 asc;