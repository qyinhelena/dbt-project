WITH sub AS (
    SELECT start_landmark, start_station_id, distance_meters, end_landmark, end_station_id,
       DENSE_RANK() OVER (PARTITION BY start_station_id ORDER BY distance_meters DESC) AS distance_rank
    FROM {{ ref('diffTripsInfo') }}
)
SELECT DISTINCT *
FROM sub
WHERE distance_rank <= 5