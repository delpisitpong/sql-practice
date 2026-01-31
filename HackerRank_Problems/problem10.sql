-- Weather Observation Station 2
SELECT round(sum(lat_n), 2), 
       round(sum(long_w), 2)
FROM station;