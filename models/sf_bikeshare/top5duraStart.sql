SELECT * FROM (
    SELECT start_landmark, start_station_id, duration_sec,
       DENSE_RANK() OVER (PARTITION BY start_station_id ORDER BY duration_sec DESC) AS duration_rank
    FROM {{ ref('diffTripsInfo') }}
) AS sub
WHERE sub.duration_rank <= 5