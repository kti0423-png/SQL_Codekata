select
    distinct b1.N,
    case
        when b1.P is null then 'Root'
        when b2.P is null then 'Leaf'
        else 'Inner'
    end as result
from bst as b1
left join bst as b2 on b1.N=b2.P
order by b1.N;