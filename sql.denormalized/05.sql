select '#' || (jsonb_array_elements(
        coalesce(data->'entities'->'hashtags','[]') ||
        coalesce(data->'extended_tweet'->'entities'->'hashtags','[]')
        )->>'text'::text) as tag, count(distinct data->>'id')
from tweets_jsonb
where data->'lang' = '"en"'::jsonb and to_tsvector('english', coalesce(data->'extended_tweet'->>'full_text', data->>'text'))@@to_tsquery('english', 'coronavirus')
group by tag
order by count desc, tag
limit 1000;

