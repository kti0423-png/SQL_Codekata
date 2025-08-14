select
	a.name as '사람 이름',
	a.age as '나이',
	b.goods_nm as '상품 이름',
	b.goods_pay_date as '결제 날짜'
from class.s1 as a
inner join
(
select
	*
from class.s2
order by s2.goods_pay_date desc limit 1
) as b
on a.name=b.name

select
	a.name as '사람 이름',
	a.age as '나이',
	b.goods_nm as '상품 이름',
	b.goods_pay_date as '결제 날짜'
from class.s1 as a
inner join class.s2 as b
on a.name=b.name
where b.goods_pay_date = (select max(goods_pay_date)
						from class.s2)
						
select
	case
		when a.pay_amount is null then '결제안함'
		else '결제함'
	end as gb,
	count(distinct a.game_account_id) as usercnt
from
(
select
	u.game_account_id,
	p.pay_amount,
	p.pay_type,
	p.approved_at
from class.users as u
left join class.payment as p
on u.game_account_id=p.game_account_id
) as a
group by 1;