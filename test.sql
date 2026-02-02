SELECT
  *
FROM
  resale_flat_prices_2017
WHERE
  town = 'BUKIT MERAH';

-- 2024-06-10: Query to select all records from resale_flat_prices_2017 where the town is 'BUKIT MERAH'
query to select all records from bukit batok more that 300000
SELECT
  *
FROM
  resale_flat_prices_2017
WHERE
  town = 'BUKIT BATOK'
  AND resale_price > 300000;


  “I want to find a home for my parents. They need something larger than 100sqm, but my budget is strictly under $600,000. How would we write that rule?”
SELECT
  *
FROM
  resale_flat_prices_2017
WHERE
  floor_area_sqm > 100
  AND resale_price < 600000;   


  -- SCALAR

SELECT UPPER(town) AS town_uppercase,
    LOWER(street_name) AS street_lowercase,
    LENGTH(street_name) AS street_length
FROM resale_flat_prices_2017
WHERE town = 'ANG MO KIO'; 



-- Filter on individual rows before grouping
SELECT
  town,
  AVG(resale_price) AS avg_price
FROM
  resale_flat_prices_2017
WHERE
  resale_price > 500000
GROUP BY
  town;


-- Filter on the aggregated result after grouping
SELECT
  town,
  AVG(resale_price) AS avg_price
FROM
  resale_flat_prices_2017
GROUP BY
  town
HAVING
  AVG(resale_price) > 500000;

SELECT
  town,
  resale_price,
  CASE
    WHEN resale_price > 1000000 THEN 'Million Dollar Club'
    WHEN resale_price > 500000 THEN 'Mid-Range'
    ELSE 'Entry-Level'
  END AS price_category
FROM
  resale_flat_prices_2017;
  
  
  
SELECT
  town,
  flat_type,
  CASE
    WHEN flat_type IN ('1 ROOM', '2 ROOM', '3 ROOM') THEN 'Small'
    WHEN flat_type = '4 ROOM' THEN 'Medium'
    ELSE 'Large'
  END AS flat_size
FROM
  resale_flat_prices_2017;

-- Design your own “budget/mid/high-end” categories based on resale_price.

SELECT town,
  resale_price,
  CASE
    WHEN resale_price < 300000 THEN 'Budget'
    WHEN resale_price BETWEEN 300000 AND 700000 THEN 'Mid-Range'
    ELSE 'High-End'
  END AS price_segment
FROM resale_flat_prices_2017;


-- Design a “old vs new” label based on lease_commence_date.
SELECT town,
  lease_commence_date,
  CASE
    WHEN lease_commence_date < 1990 THEN 'Old'
    ELSE 'New'
  END AS age_category
FROM resale_flat_prices_2017;


SELECT
    month,
    CONCAT(month, '-01')::DATE AS transaction_date,
    date_part('year', (month || '-01')::DATE) AS sale_year
FROM resale_flat_prices_2017;

-- addning 1 month to transaction date
SELECT
    month,
    CONCAT(month, '-01')::DATE AS transaction_date,
    date_part('year', (month || '-01')::DATE) AS sale_year,
    (CONCAT(month, '-01')::DATE + INTERVAL '1 month') AS next_month_date
FROM resale_flat_prices_2017;