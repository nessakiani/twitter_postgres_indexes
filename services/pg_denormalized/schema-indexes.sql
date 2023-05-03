create index txtidx4 on tweets_jsonb using gin(to_tsvector('english', coalesce(data->'extended_tweet'->>'full_text', data->>'text')));
create index tweets_jsonb_expr_idx2 on public.tweets_jsonb using gin ((data -> 'lang'::text));

create index tagidx3 on tweets_jsonb using gin((data->'entities'->'hashtags'));
create index tagidx4 on tweets_jsonb using gin((data->'extended_tweet'->'entities'->'hashtags'));
