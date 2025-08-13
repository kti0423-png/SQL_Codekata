select
	mcdp_cd as '진료과 코드',
	count(1) as '5월예약건수'
from appointment
where apnt_ymd like ('2022-05%')
group by 1
order by 2 asc, 1 asc;