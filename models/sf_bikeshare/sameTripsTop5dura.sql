WITH temp1 AS (
    SELECT sa.*, st.landmark AS start_landmark
    FROM {{ ref('sameStartEndTrips') }} AS sa LEFT JOIN {{ ref('bikeshare_stations')}} AS st
    ON st.station_id = sa.start_station_id

),

temp2 AS (
    SELECT start_landmark, start_station_id, duration_sec,
       DENSE_RANK() OVER (PARTITION BY start_station_id ORDER BY duration_sec DESC) AS duration_rank
    FROM temp1
)

SELECT * FROM temp2
WHERE temp2.duration_rank <= 5