-- Erina Caferra --
-- Professor Rivas --
-- CMPT 308 --
-- March 2, 2016 --
-- Lab 6 --

-- 1. Display the name and city of customers who live in any city that makes the most different kinds of products.
--    (There are two cities that make the most different products. Return the name and city of cutomers from either one of those.)
SELECT name, city
FROM customers
WHERE city IN (	SELECT city
		FROM products
		GROUP BY city
		ORDER BY COUNT(products.city) DESC
		LIMIT 1 );

-- 2. Display the names of products whose priceUSD is strictly above the average priceUSD, in reverse-alphabetical order.
SELECT name
FROM products p
WHERE priceUSD > (	SELECT AVG(priceUSD)
			FROM products )
ORDER BY name DESC;

-- 3. Display the customer name, pid ordered, and the total for all orders, sorted by total from high to low.
SELECT customers.name, orders.pid, orders.dollars
FROM orders 
INNER JOIN customers
ON orders.cid = customers.cid
ORDER BY orders.dollars DESC;

-- 4. Display all customer names (in alphabetical order) and their total ordered, and nothing more. Use coalesce to avoid
--    showing NULLs.
SELECT customers.name, COALESCE(SUM(orders.qty), 0) AS "total ordered"
FROM orders
RIGHT OUTER JOIN customers
ON orders.cid = customers.cid
GROUP BY customers.name
ORDER BY customers.name ASC;

-- 5. Display the names of all customers who bought products from agents based in Tokyo along with the names of the
--    products they ordered, and the names of the agents who sold it to them.
SELECT customers.name, products.name, agents.name
FROM orders 
INNER JOIN customers
ON orders.cid = customers.cid
INNER JOIN products
ON orders.pid = products.pid
INNER JOIN agents
ON orders.aid = agents.aid
WHERE agents.city = 'Tokyo';

-- 6. Write a query to check the accuracy of the dollars oulmn in the Orders table. This means calculating Orders.dollars --
--    from data in other tables and comparing those values to the values in Orders.dollars. Display all rows in Orders 	  --
--    where Orders.dollars is incorrect, if any.
Select *
From (Select o.*, o.qty*p.priceusd*(1-(discount/100)) as truedollars
      from orders o
      inner join products p on o.pid = p.pid
      inner join customers c on o.cid = c.cid) as tmptable
Where dollars != truedollars

-- 7. What is the difference between a LEFT OUTER JOIN and a RIGHT OUTER JOIN? Give example queries in SQL to demonstrate.
--    (Feel free to  use the CAP2 database to make your points here.)

-- The difference between a LEFT OUTER JOIN and a RIGHT OUTER JOIN would be which table will be completely displayed.
-- If a LEFT OUTER JOIN is used, the entire left table will be displayed and parts of the right table may not be display
-- or displayed as NULL. Vise versa, a RIGHT OUTER JOIN would have the entire right table displayed and parts of the left
-- table may not be display or displayed as NULL. 
-- Here would be an example of a LEFT OUTER JOIN:
SELECT *
FROM orders
LEFT OUTER JOIN customers
ON customers.cid = orders.cid;
-- This code produces a combination of the tables customers and orders. Because it is a LEFT OUTER JOIN and orders
-- is the left table, the result has all of the orders table and values for parts of the customers table.
-- This next SQL would be the same except using a RIGHT OUTER JOIN:
SELECT *
FROM orders
RIGHT OUTER JOIN customers
ON customers.cid = orders.cid;
-- This code produces a combination of the tables customers and orders. Because it is a RIGHT OUTER JOIN and customers
-- is the right table, the result has all of the customers table and NULL values for parts of the orders table.