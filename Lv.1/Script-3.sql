select
	serverno,
	date_format(first_login_date, '%Y-%m') as m,
	count(distinct game_account_id) as cnt_account
from class.users
group by 1, 2;

select
	first_login_date,
	count(distinct game_actor_id) as cnt_actor
from class.users
group by 1
having cnt_actor > 10;

SELECT 
	serverno,
	case
		when first_login_date < '2024-01-01' then '기존유저'
		when first_login_date >= '2024-01-01' then '신규유저'
		end '유저구분',
	count(distinct game_actor_id) as cnt_actor,
	AVG(`level`) as avg_level
from class.users
group by 1, 2;

select
	a.first_login_date,
	a.cnt_actor
from
(
select
	first_login_date,
	count(distinct game_actor_id) as cnt_actor
from class.users
group by 1
) a
where cnt_actor > 10;

select
	a.cnt_actor,
	count(distinct game_account_id) as cnt_account
from
(
select
	game_account_id,
	count(distinct game_actor_id) as cnt_actor
from class.users
where `level`>=30
group by 1
having cnt_actor>=2
) a
group by 1