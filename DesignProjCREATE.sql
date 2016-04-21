-- Erina Caferra
-- Prof Rivas
-- Design Project CMPT 308
-- 4/20/16

-- Create the Tables --

DROP TABLE Commissions;
DROP TABLE Styles;
DROP TABLE Artists;
DROP TABLE Customers;
DROP TABLE ContactInfo;

CREATE TABLE IF NOT EXISTS ContactInfo(
	ciid 	INT NOT NULL,
	name 	TEXT NOT NULL,
	address TEXT,
	email 	TEXT NOT NULL,
	PRIMARY KEY(ciid)
);

CREATE TABLE IF NOT EXISTS Artists(
	aid 	INT NOT NULL,
	ciid 	INT NOT NULL REFERENCES ContactInfo(CIID),
	PRIMARY KEY(aid)
);

CREATE TABLE IF NOT EXISTS Customers(
	cuid		INT NOT NULL,
	ciid		INT NOT NULL REFERENCES ContactInfo(CIID),
	discount 	FLOAT,
	PRIMARY KEY(cuid)
);

CREATE TABLE IF NOT EXISTS Styles(
	sid	INT NOT NULL,
	sname	TEXT NOT NULL,
	medium	TEXT NOT NULL,
	price	FLOAT NOT NULL,
	PRIMARY KEY(sid)
);

CREATE TABLE IF NOT EXISTS Commissions(
	coid		INT NOT NULL,
	sid		INT NOT NULL REFERENCES Styles(sid),
	aid		INT NOT NULL REFERENCES Artists(aid),
	cuid		INT NOT NULL REFERENCES Customers(cuid),
	cname		TEXT NOT NULL,
	requestdate	DATE NOT NULL,
	duedate		DATE,
	prepay		FLOAT NOT NULL,
	totalcost	FLOAT NOT NULL,
	PRIMARY KEY(coid)
);


--Populate the Tables --

INSERT INTO ContactInfo (ciid, name, address, email)
	VALUES (001, 'Erina Caferra', '13 Oak St, NJ', 'erinacaferra@gmail.com');
INSERT INTO ContactInfo (ciid, name, address, email)
	VALUES (002, 'Francesa Treglia', '1766 Kimball St, NY', 'franana@mail.com');
INSERT INTO ContactInfo (ciid, name, address, email)
	VALUES (003, 'Lizeth Sanchez', '98 Lan St, CA', 'liz-san@gmail.com');
INSERT INTO ContactInfo (ciid, name, address, email)
	VALUES (004, 'Vallie Joseph', '14 Free Ln, FL', 'vgirl@gmail.com');
INSERT INTO ContactInfo (ciid, name, address, email)
	VALUES (005, 'Iglika Hadjiyska', '55 Alto Dr, CT', 'ignition@gmail.com');
INSERT INTO ContactInfo (ciid, name, address, email)
	VALUES (006, 'Kaylee Neff', '123 Orlando Ln, PA', 'kayleee@hotmail.com');
INSERT INTO ContactInfo (ciid, name, address, email)
	VALUES (007, 'Daren Pagen', '987 Dev St, NY', 'shampoohat@gmail.com');
INSERT INTO ContactInfo (ciid, name, address, email)
	VALUES (008, 'Magnus Mazolla', '47 Que Dr, MD', 'magpie@gmail.com');
INSERT INTO ContactInfo (ciid, name, address, email)
	VALUES (009, 'Justin Zureev', '492 Tomato Ln, TX', 'zeevee@gmail.com');
INSERT INTO ContactInfo (ciid, name, address, email)
	VALUES (010, 'Nicole Ridenour', '9 Guild Dr, MA', 'inoclue@gmail.com');

INSERT INTO Artists (aid, ciid)
	VALUES (001, 001);
INSERT INTO Artists (aid, ciid)
	VALUES (002, 006);
INSERT INTO Artists (aid, ciid)
	VALUES (003, 008);
INSERT INTO Artists (aid, ciid)
	VALUES (004, 009);
INSERT INTO Artists (aid, ciid)
	VALUES (005, 010);

INSERT INTO Customers (cuid, ciid, discount)
	VALUES (001, 002, 0.25);
INSERT INTO Customers (cuid, ciid, discount)
	VALUES (002, 003, 0.10);
INSERT INTO Customers (cuid, ciid, discount)
	VALUES (003, 004, 0.0);
INSERT INTO Customers (cuid, ciid, discount)
	VALUES (004, 005, 0.0);
INSERT INTO Customers (cuid, ciid, discount)
	VALUES (005, 007, 0.50);

INSERT INTO Styles (sid, sname, medium, price)
	VALUES (1, 'Sketch Bust', 'Traditional', 5.00);
INSERT INTO Styles (sid, sname, medium, price)
	VALUES (2, 'Sketch Half-Body', 'Traditional', 10.00);
INSERT INTO Styles (sid, sname, medium, price)
	VALUES (3, 'Sketch Full-Body', 'Traditional', 15.00);
INSERT INTO Styles (sid, sname, medium, price)
	VALUES (4, 'Lineart Bust', 'Traditional', 10.00);
INSERT INTO Styles (sid, sname, medium, price)
	VALUES (5, 'Lineart Half-Body', 'Traditional', 15.00);
INSERT INTO Styles (sid, sname, medium, price)
	VALUES (6, 'Lineart Full-Body', 'Traditional', 20.00);
INSERT INTO Styles (sid, sname, medium, price)
	VALUES (7, 'Full Bust', 'Traditional', 15.00);
INSERT INTO Styles (sid, sname, medium, price)
	VALUES (8, 'Full Half-Body', 'Traditional', 20.00);
INSERT INTO Styles (sid, sname, medium, price)
	VALUES (9, 'Full Full-Body', 'Traditional', 25.00);
INSERT INTO Styles (sid, sname, medium, price)
	VALUES (10, 'Sketch Bust', 'Digital', 7.00);
INSERT INTO Styles (sid, sname, medium, price)
	VALUES (12, 'Sketch Half-Body', 'Digital', 12.00);
INSERT INTO Styles (sid, sname, medium, price)
	VALUES (13, 'Sketch Full-Body', 'Digital', 17.00);
INSERT INTO Styles (sid, sname, medium, price)
	VALUES (14, 'Lineart Bust', 'Digital', 12.00);
INSERT INTO Styles (sid, sname, medium, price)
	VALUES (15, 'Lineart Half-Body', 'Digital', 17.00);
INSERT INTO Styles (sid, sname, medium, price)
	VALUES (16, 'Lineart Full-Body', 'Digital', 22.00);
INSERT INTO Styles (sid, sname, medium, price)
	VALUES (17, 'Full Bust', 'Digital', 17.00);
INSERT INTO Styles (sid, sname, medium, price)
	VALUES (18, 'Full Half-Body', 'Digital', 22.00);
INSERT INTO Styles (sid, sname, medium, price)
	VALUES (19, 'Full Full-Body', 'Digital', 27.00);

INSERT INTO Commissions (coid, sid, aid, cuid, cname, requestdate, prepay, totalcost)
	VALUES (0001, 19, 001, 005, 'Dare Evil Full', '2016-01-01', 27.00, 50.90);
INSERT INTO Commissions (coid, sid, aid, cuid, cname, requestdate, duedate, prepay, totalcost)
	VALUES (0002, 10, 005, 002, 'Leobwin Sketch', '2016-03-01', '2016-04-20', 9.00, 17.09);
INSERT INTO Commissions (coid, sid, aid, cuid, cname, requestdate, duedate, prepay, totalcost)
	VALUES (0003, 1, 004, 003, 'Bust of Drake', '2015-12-25', '2016-05-12', 2.07, 10.00);
INSERT INTO Commissions (coid, sid, aid, cuid, cname, requestdate, prepay, totalcost)
	VALUES (0004, 5, 003, 005, 'Giraffe', '2015-11-10', 20.67, 25.87);
INSERT INTO Commissions (coid, sid, aid, cuid, cname, requestdate, duedate, prepay, totalcost)
	VALUES (0005, 13, 001, 001, 'Blender Still', '2016-02-12', '2016-06-12', 20.00, 30.80);
INSERT INTO Commissions (coid, sid, aid, cuid, cname, requestdate, duedate, prepay, totalcost)
	VALUES (0006, 18, 002, 004, 'Dragon Mage OC', '2016-04-20', '2016-07-27', 25.00, 45.25);
INSERT INTO Commissions (coid, sid, aid, cuid, cname, requestdate, duedate, prepay, totalcost)
	VALUES (0007, 7, 001, 005, 'SteamPunk AU OP', '2016-04-20', '2016-07-27', 25.00, 45.00);
INSERT INTO Commissions (coid, sid, aid, cuid, cname, requestdate, prepay, totalcost)
	VALUES (0008, 12, 001, 002, 'Design of Elise', '2016-01-05', 15.50, 25.50);


-- Select Tables --

SELECT * 
FROM ContactInfo;

SELECT *
FROM Artists;

SELECT *
FROM Customers;

SELECT *
FROM Styles;

SELECT *
FROM Commissions;


-- Create Views --
DROP VIEW commissionsDue;
CREATE VIEW commissionsDue AS
	SELECT	co.cname AS Commission_Name,
		a.aid AS Artist_ID,
		cu.cuid AS Customer_ID,
		co.requestdate AS Request_Date,
		co.duedate AS Due_Date
	FROM	Commissions co,
		Artists a,
		Customers cu
	WHERE 	co.duedate IS NOT NULL
	  AND	a.aid = co.aid
	  AND	cu.cuid = co.cuid
	ORDER BY co.duedate ASC;
SELECT *
FROM commissionsDue;

DROP VIEW discountPrice;
CREATE VIEW discountPrice AS
	SELECT	cu.cuid AS Customer_ID,
		ci.name AS Customer_Name,
		cu.discount AS Discount
	FROM	Customers cu,
		ContactInfo ci
	WHERE	cu.ciid = ci.ciid
	  AND	cu.discount != 0
	ORDER BY cu.discount ASC;
SELECT *
FROM discountPrice;


-- Reports --

-- Total Income for Each Artist
SELECT 	co.aid, ci.name, SUM(co.totalcost)
FROM 	Commissions co, ContactInfo ci, Artists a
WHERE 	co.aid = co.aid
  AND	a.ciid = ci.ciid
ORDER BY co.aid ASC;