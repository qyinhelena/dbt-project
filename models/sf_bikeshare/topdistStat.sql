SELECT start_landmark, end_landmark, MAX(distance_meters) AS longest_distance
FROM {{ ref('top5distStart') }}
GROUP BY start_landmark, end_landmark