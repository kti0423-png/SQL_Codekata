select
    user_id, name, mail
from users
where regexp_like(mail,'^[a-zA-Z][a-zA-Z0-9\\.\\-\\_]*@leetcode\\.com$','c')