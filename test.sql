-- Erina Caferra --
-- Professor Rivas --
-- CMPT330-112 --
-- February 11, 2016 --
-- Lab 3 --

-- Number 1: List the ordno and dollars of all orders. --
SELECT ordno, dollars
FROM orders;

-- Number 2: List the name and city of agents named Smith. --
SELECT name, city
FROM agents
WHERE name = 'Smith';

-- Number 3: List the pid, name, and priceUSD of products with quantity more than 208,000. --
SELECT pid, name, priceUSD
FROM products
WHERE quantity > 208000;

-- Number 4: List the names and cities of customers in Dallas. --
SELECT name, city
FROM customers
WHERE city = 'Dallas';

-- Number 5: List the names of agents not in New York and not in Tokyo. --
SELECT name
FROM agents
WHERE city != 'New York' AND city != 'Tokyo';

-- Number 6: List all data for products not in Dallas or Duluth that cost US$1 or more. --
SELECT *
FROM products
WHERE city != 'Dallas' AND city != 'Duluth' AND priceUSD >= 1;

-- Number 7: List all data for orders in January and March. --
SELECT *
FROM orders
WHERE mon IN ('jan','mar');

-- Number 8: List all data for orders in February less than US$500. --
SELECT *
FROM orders
WHERE mon IN ('feb') AND dollars < 500;

-- Number 9: List all orders from the customer whose cid is C005. --
SELECT *
FROM orders
WHERE cid = 'c005';