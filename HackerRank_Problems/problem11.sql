-- Weather Observation Station 3
SELECT distinct(city)
FROM station
WHERE (id % 2) = 0;