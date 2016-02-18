-- Erina Caferra --
-- Professor Rivas --
-- CMPT308-112 --
-- February 17, 2016 --
-- Lab 4 --

-- 1. Get the cities of agents booking an order for a customer whose cid is 'c002'. --
SELECT city
FROM agents
WHERE aid IN (	SELECT aid
		FROM orders
		WHERE cid = 'c002');

-- 2. Get the ids of products ordered through any agents who takes at least one order from a customer in Dallas, sorted by pid from highest to lowest. --
SELECT DISTINCT pid
FROM orders
WHERE aid IN (	SELECT aid
		FROM orders
		WHERE cid IN (	SELECT cid
				FROM customers
				WHERE city = 'Dallas' ))
ORDER BY pid DESC;

-- 3. Get the ids and names of customers who did not place an order through agent a01. --
SELECT cid, name
FROM customers
WHERE cid NOT IN (	SELECT cid
			FROM orders
			WHERE aid IN ('a01'));

-- 4. Get the ids of customers who ordered both product p01 and p07. Dis wrong gurl. c004 shouldn't appear. You have to separate p01 and 07 into subqueries.
SELECT cid
FROM customers
WHERE cid IN (	SELECT DISTINCT cid
		FROM orders
		WHERE (	pid IN ('p01')
			AND cid IN (	SELECT cid
					FROM orders
					WHERE pid IN ('p07'))));

-- 5. Get the ids of products not ordered by any customers who placed any order through agent a07 in pid order from highest to lowest. --
SELECT DISTINCT pid
FROM orders
WHERE cid NOT IN (	SELECT cid
			FROM orders
			WHERE aid IN ('a07'))
ORDER BY pid DESC;

-- 6. Get the name, discounts, and city for all customers who place orders through agents in London or New York. --
SELECT name, discount, city
FROM customers
WHERE cid IN (	SELECT cid
		FROM orders
		WHERE aid IN (	SELECT aid
				FROM agents
				WHERE city IN ('London', 'New York')));

-- 7. Get all customers who have the same discount as that of any customers in Dallas or London. --
SELECT *
FROM customers
WHERE discount IN (	SELECT discount
			FROM customers
			WHERE city IN ('Dallas', 'London'))
				AND city NOT IN ('Dallas', 'London');

-- 8. Tell me about check constraints: What are they? What are they good for? What is the advantage of putting that sort of thing 
--    inside the database? Make up some examples of good users of check constraints and some examples of bad uses of check constraints.
--    Explain the differences in your examples and argue your case.

-- A check constraint is an implemented requirement for each row. It is used to limit the 
-- value range that can be entered into a column. These constraints are good for data 
-- integrity. With limitations to what you can put into a column, random or unimportant 
-- data can be restricted. They are good for reducing uncertainties and providing 
-- consistency to our data. With these sort of things in our database, we can more easily 
-- manipulate our data to make it more managable and reasonable.
-- Good example: A student database would benefit from a constraint of UNIQUE for each 
-- students' CWID. This is because the CWID is a unique number for each student, no two
-- students have or should have the same CWID. Another constraint would be NOT NULL for
-- each students' name. All students have a name as each human being in this country has
-- a name. This, however, can lead into our bad example.
-- Bad example: Although every student has a name, some of them might not have middle
-- names. Middle Name should not be a NOT NULL because of this. Another bad example would
-- be using the constraint of UNIQUE to student names. There are quite a few student names
-- that are the same and would repeat in the column.