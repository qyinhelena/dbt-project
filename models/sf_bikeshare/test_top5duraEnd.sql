-- make sure no rank is above 5 from the model
SELECT *
FROM {{ ref('top5duraEnd') }}
WHERE duration_rank > 5
LIMIT 10