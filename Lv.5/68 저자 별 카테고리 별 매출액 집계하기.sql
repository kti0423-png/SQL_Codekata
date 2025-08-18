SELECT
    a.author_id,
    a.author_name,
    b.category,
    sum(b.price*s.sales) as total_sales
from author a
inner join book b
on a.author_id=b.author_id
inner join book_sales s
on b.book_id=s.book_id
where s.sales_date like ('2022-01%')
group by a.author_id, b.category
order by a.author_id asc, b.category desc;