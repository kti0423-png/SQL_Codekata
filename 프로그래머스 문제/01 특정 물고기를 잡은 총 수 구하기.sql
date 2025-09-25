select
    sum(n.fish_name='BASS') + sum(n.fish_name='SNAPPER') as fish_count
from fish_info as i
inner join fish_name_info as n on i.fish_type = n.fish_type