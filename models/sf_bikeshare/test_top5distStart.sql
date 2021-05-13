-- make sure no rank is above 5 from the model
SELECT *
FROM {{ ref('top5distStart') }}
WHERE distance_rank > 5
LIMIT 10