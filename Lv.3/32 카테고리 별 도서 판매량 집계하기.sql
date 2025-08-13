SELECT
    b.category,
    sum(s.sales) as total_sales
from book b
left join book_sales s
on b.book_id=s.book_id
where s.sales_date like ('2022-01%')
group by 1
order by b.category asc;