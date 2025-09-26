select i.id, n.fish_name, i.length
from fish_info as i
inner join fish_name_info as n on i.fish_type=n.fish_type
where (i.fish_type, i.length) in(select
                                    fish_type,
                                    max(length) over (partition by fish_type order by length desc)
                                from fish_info
                                )
order by 1 asc;