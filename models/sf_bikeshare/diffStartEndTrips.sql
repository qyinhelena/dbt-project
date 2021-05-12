{{ config(materialized='incremental') }}

WITH temp AS (
    SELECT * FROM {{ ref('bikeshare_trips') }}
    WHERE start_station_id != end_station_id
)
SELECT *, EXTRACT(YEAR FROM start_date) AS year,
       EXTRACT(MONTH FROM start_date) AS month,
       EXTRACT(DAYOFWEEK FROM start_date) AS dayofweek
FROM temp

{% if is_incremental() %}
WHERE start_date > (SELECT MAX(start_date) FROM {{ this }})
{% endif %}