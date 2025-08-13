select
	substr(product_code,1,2) as 'CATEGORY',
	count(1) as count
from product
group by 1
order by 1 asc;
	