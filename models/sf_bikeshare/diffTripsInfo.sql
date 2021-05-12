WITH add_start_loc AS (
    SELECT d.*, s.latitude AS start_lat, s.longitude AS start_lon, s.landmark AS start_landmark
    FROM {{ ref('diffStartEndTrips') }} AS d, {{ ref('bikeshare_stations')}} AS s
    WHERE s.station_id = d.start_station_id
),

add_end_loc AS (
    SELECT a.*, s.latitude AS end_lat, s.longitude AS end_lon, s.landmark AS end_landmark
    FROM add_start_loc AS a, {{ ref('bikeshare_stations')}} AS s
    WHERE s.station_id = a.end_station_id
)

SELECT *,
       ST_GeogPoint(start_lon, start_lat) AS geo_start,
       ST_GeogPoint(end_lon, end_lat) AS geo_end,
       ST_Distance(ST_GeogPoint(start_lon, start_lat), ST_GeogPoint(end_lon, end_lat)) AS distance_meters
FROM add_end_loc
