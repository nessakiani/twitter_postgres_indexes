select data->>'lang' as lang, count(distinct data->>'id')
from tweets_jsonb
where data->'entities'->'hashtags' @> '[{"text": "coronavirus"}]' or data->'extended_tweet'->'entities'->'hashtags' @> '[{"text": "coronavirus"}]'
group by data->>'lang'
order by count desc, data->>'lang';
