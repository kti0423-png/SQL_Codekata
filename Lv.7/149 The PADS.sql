SELECT
    concat(name,'(',substr(occupation,1,1),')')
from occupations
order by name;

SELECT
    concat('There are a total of ',count(*),' ',lower(occupation),'s.')
from occupations
group by occupation
order by count(*), occupation;