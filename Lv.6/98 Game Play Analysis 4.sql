with A as (
select
    player_id,
    min(event_date) as first_login
from activity
group by 1
),
B as (
select
    count(A.player_id) as re_logins
from A
inner join activity as t
on
    A.player_id = t.player_id
    and A.first_login = date_sub(t.event_date, interval 1 day)
)

select
    Round(B.re_logins/count(A.player_id),2) as fraction
from A, B