select
    x, y, z,
    case
        when x+y>z and y+z>x and x+z>y then 'Yes'
        when x<=0 or y<=0 or z<=0 then 'No'
        else 'No' end as triangle
from triangle