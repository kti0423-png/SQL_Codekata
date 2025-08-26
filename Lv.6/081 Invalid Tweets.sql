select
    tweet_id
from tweets
where char_length(replace(content,' ','')) > 15