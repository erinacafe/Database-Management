-- Erina Caferra --
-- Professor Rivas --
-- CMPT 308 - 200 --
-- February 24, 2016 --
-- Lab 5 --

-- 1. Show the cities of agents booking an order for a customer whose id is 'c002'. Use joins; no subqueries --
SELECT a.city
FROM agents a, orders o
WHERE o.aid = a.aid
	AND cid = 'c002';

-- 2. Show the ids of products ordered through any agent who makes at least one order for a customer in Dallas, --
--    sorted by pid from highest to lowest. Use joins; no subqueries.						--
-- This one will account for EVERY product order through any agent that made an order for a customer in Dallas --
SELECT DISTINCT o2.pid
FROM orders o, customers c, orders o2
WHERE c.city = 'Dallas'
	AND  o.aid = o2.aid
	AND o.cid = c.cid
ORDER BY o2.pid DESC;
-- This one will ONLY account for the products that were ordered in that SPECIFIC order through any agent that --
-- made an order for a customer in Dallas --
SELECT DISTINCT o.pid
FROM orders o, agents a, customers c 
WHERE c.city = 'Dallas'
	AND  o.aid = a.aid
	AND o.cid = c.cid
ORDER BY o.pid DESC;

-- 3. Show the names of customers who have never placed an order. Use a subquery. --
SELECT name
FROM customers
WHERE cid NOT IN (	SELECT cid
			FROM orders);

-- 4. Show the names of customers who have never places an order. Use an outer join. --
SELECT c.name
FROM orders o
RIGHT OUTER JOIN customers c ON o.cid = c.cid
WHERE ordno IS null;

-- 5. Show the names of customers who placed at least one order through an agent in their own city, along with --
--    those agent(s') names.									               --
SELECT DISTINCT c.name, a.name
FROM orders o, agents a, customers c
WHERE o.aid = a.aid
	AND o.cid = c.cid
	AND c.city = a.city;

-- 6. Show the names of cutomers and agents living in the same city, along with the name of the shared city, --
--    regardless of whether or not the customer has ever placed an order with that agent.		     --
SELECT c.name, a.name, c.city
FROM customers c, agents a
WHERE c.city = a.city;

-- 7. Show the name and city of customers who live in the city that makes the fewest different kinds of  --
--    products. (Hint: Use count and group by on the Products table.)					 --
SELECT c.name, c.city
FROM customers c
WHERE c.city IN (	SELECT city 
			FROM products
			GROUP BY city
			ORDER BY count(pid) ASC
			LIMIT 1 );