{{ config(materialized='table') }}

SELECT * 
FROM `bigquery-public-data`.san_francisco.bikeshare_trips
LIMIT 100