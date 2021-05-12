WITH temp AS (
SELECT zip_code, 
       COUNT(DISTINCT trip_id) AS num_trips,
       COUNT(DISTINCT start_station_id) AS num_stations,
       AVG(duration_sec) AS avg_duration
FROM {{ ref('sameStartEndTrips') }}
GROUP BY zip_code)

SELECT *,
       IFNULL(zip_code, '0') AS filled_zipcode
FROM temp