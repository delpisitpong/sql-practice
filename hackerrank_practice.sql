-- These queries are from HackerRank Practice Problems
-- Link: https://www.hackerrank.com/domains/sql


-- Revising the Select Query I
SELECT *
FROM city
WHERE countrycode = 'USA' AND population > 100000;


-- Revising the Select Query II
SELECT name
FROM city
WHERE countrycode = 'USA' AND population > 120000;


-- Select All
SELECT *
FROM city;


-- Select By ID
SELECT *
FROM city
WHERE id = '1661';


-- Japanese Cities' Attributes
SELECT *
FROM city
WHERE countrycode = 'JPN';


-- Japanese Cities' Names
SELECT name
FROM city
WHERE countrycode = 'JPN';


-- African Cities
SELECT city.name
FROM city INNER JOIN country ON city.countrycode = country.code
WHERE country.continent = 'Africa';


-- Population Census
SELECT sum(city.population)
FROM city INNER JOIN country ON city.countrycode = country.code
WHERE country.continent = 'Asia';