SELECT *
FROM {{ ref('bikeshare_trips') }} AS t
WHERE t.start_station_id = t.end_station_id