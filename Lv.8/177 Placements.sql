select s.name
from students as s
inner join friends as f on s.id=f.id
inner join packages as student on s.id=student.id
inner join packages as friend on f.friend_id=friend.id
where friend.salary > student.salary
order by friend.salary