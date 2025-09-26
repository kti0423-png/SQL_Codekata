with fish_info as (
select id, fish_type, coalesce(length,10) as length
from fish_info
)

select
    count(*) as FISH_COUNT, max(length) as MAX_LENGTH, fish_type
from fish_info
where fish_type in (
    select fish_type
    from fish_info
    group by 1
    having avg(length) >= 33)
group by 3
order by 3 asc;