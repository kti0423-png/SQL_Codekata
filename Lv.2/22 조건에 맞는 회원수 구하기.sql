select
	count(1) as USERS
from user_info
where
	joined like ('2021%')
	and age between 20 and 29