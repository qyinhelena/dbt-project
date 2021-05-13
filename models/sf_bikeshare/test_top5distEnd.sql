-- make sure no rank is above 5 from the model
SELECT *
FROM {{ ref('top5distEnd') }}
WHERE distance_rank > 5
LIMIT 10