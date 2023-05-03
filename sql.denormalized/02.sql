select '#' || (jsonb_array_elements(
                coalesce(data->'entities'->'hashtags','[]') ||
                coalesce(data->'extended_tweet'->'entities'->'hashtags','[]')
            )->>'text'::text) as tag, count(distinct data->>'id')
        from tweets_jsonb
        where data->'entities'->'hashtags' @> '[{"text": "coronavirus"}]' or data->'extended_tweet'->'entities'->'hashtags' @> '[{"text": "coronavirus"}]'
        group by tag 
        order by count desc, tag 
        limit 1000;

