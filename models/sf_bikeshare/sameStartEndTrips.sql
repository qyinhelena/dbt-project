SELECT *, EXTRACT(YEAR FROM start_date) AS year,
       EXTRACT(MONTH FROM start_date) AS month,
       EXTRACT(DAYOFWEEK FROM start_date) AS weekofday,
       DATE_DIFF(DATE(end_date), DATE(start_date), DAY) AS date_diff
FROM {{ ref('bikeshare_trips') }} AS t
WHERE t.start_station_id = t.end_station_id