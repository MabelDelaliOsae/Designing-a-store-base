use aidatascience;

/*Challenge: Customer's orders*/
CREATE TABLE customers (id INTEGER PRIMARY KEY AUTO_INCREMENT, name TEXT, email TEXT);
INSERT INTO customers (name, email) VALUES ("Doctor Who", "doctorwho@timelords.com");
INSERT INTO customers (name, email) VALUES ("Harry Potter", "harry@potter.com");
INSERT INTO customers (name, email) VALUES ("Captain Awesome", "captain@awesome.com");

CREATE TABLE orders (id INTEGER PRIMARY KEY AUTO_INCREMENT,customer_id INTEGER,item TEXT,price REAL);
INSERT INTO orders (customer_id, item, price)
 VALUES (1, "Sonic Screwdriver", 1000.00);
INSERT INTO orders (customer_id, item, price)
 VALUES (2, "High Quality Broomstick", 40.00);
INSERT INTO orders (customer_id, item, price)
 VALUES (1, "TARDIS", 1000000.00);
 
 select * from customers;
 select * from orders;
 
 /*We've created a database for customers and their orders. Not all of the customers have
made orders, however. Come up with a query that lists the name and email of every
customer followed by the item and price of orders they've made. Use a LEFT OUTER JOIN
so that a customer is listed even if they've made no orders, and don't add any ORDER BY.*/

 select customers.name ,customers.email, orders.item, orders.price from customers
 left outer join orders orders
 on customers.id = orders.customer_id;
 
 /*Now, create another query that will result in one row per each customer, with their name, email,
and total amount of money they've spent on orders. Sort the rows according to the total money
spent, from the most spent to the least spent.
(Tip: You should always GROUP BY on the column that is most likely to be unique in a row.)*/

select customers.name, customers.email, sum(orders.price) as total_money
from customers 
left outer join orders 
on customers.id = orders.customer_id
group by customers.id 
order  by orders.price DESC;

/*Challenge: Sequels in SQL*/
DROP table movies;
CREATE TABLE movies (id INTEGER PRIMARY KEY AUTO_INCREMENT,title TEXT,released
INTEGER,sequel_id INTEGER);
INSERT INTO movies VALUES (1, "Harry Potter and the Philosopher's Stone", 2001, 2);
INSERT INTO movies VALUES (2, "Harry Potter and the Chamber of Secrets", 2002, 3);
INSERT INTO movies VALUES (3, "Harry Potter and the Prisoner of Azkaban", 2004, 4);
INSERT INTO movies VALUES (4, "Harry Potter and the Goblet of Fire", 2005, 5);
INSERT INTO movies VALUES (5, "Harry Potter and the Order of the Phoenix ", 2007, 6);
INSERT INTO movies VALUES (6, "Harry Potter and the Half-Blood Prince", 2009, 7);
INSERT INTO movies VALUES (7, "Harry Potter and the Deathly Hallows – Part 1", 2010, 8);
INSERT INTO movies VALUES (8, "Harry Potter and the Deathly Hallows – Part 2", 2011, NULL);

select * from movies;
/*We've created a table with all the 'Harry Potter' movies, with a sequel_id column that
matches the id of the sequel for each movie. Issue a SELECT that will show the title of each
movie next to its sequel's title (or NULL if it doesn't have a sequel)*/
select a.title,b.title as next_movie
from movies a
left outer join movies b 
ON a.sequel_id = b.id;


drop table users;
drop table diary_logs;
### changing rows and 
CREATE TABLE users (id INTEGER PRIMARY KEY auto_increment, name TEXT);
CREATE TABLE diary_logs (id INTEGER PRIMARY KEY auto_increment, user_id INTEGER, date TEXT, content
TEXT);
/* After user submitted their new diary log */
INSERT INTO diary_logs (user_id, date, content) VALUES (1, "2015-04-01",
 "I had a horrible fight with OhNoesGuy and I buried my woes in 3 pounds of dark chocolate.");
INSERT INTO diary_logs (user_id, date, content) VALUES (1, "2015-04-02",
 "We made up and now we're best friends forever and we celebrated with a tub of ice cream.");
 
SELECT * FROM diary_logs;
UPDATE diary_logs SET content = "I had a horrible fight with OhNoesGuy" 
WHERE user_id=1  AND date = "2015-04-01";
/*UPDATE diary_logs SET content = "I had a horrible fight with OhNoesGuy" WHERE id = 1;*/
SELECT * FROM diary_logs;
DELETE FROM diary_logs WHERE id = 1;
SELECT * FROM diary_logs;

/*Challenge: Dynamic Documents*/
drop table documents;
CREATE table documents (id INTEGER PRIMARY KEY AUTO_INCREMENT, title TEXT,content
TEXT,author TEXT);
INSERT INTO documents (author, title, content)
 VALUES ("Puff T.M. Dragon", "Fancy Stuff", "Ceiling wax, dragon wings, etc.");
INSERT INTO documents (author, title, content)
 VALUES ("Puff T.M. Dragon", "Living Things", "They're located in the left ear, you know.");
INSERT INTO documents (author, title, content)
 VALUES ("Jackie Paper", "Pirate Recipes", "Cherry pie, apple pie, blueberry pie.");
 INSERT INTO documents (author, title, content)
 VALUES ("Jackie Paper", "Boat Supplies", "Rudder - guitar. Main mast - bed post.");
INSERT INTO documents (author, title, content)
 VALUES ("Jackie Paper", "Things I'm Afraid Of", "Talking to my parents, the sea, giant pirates,
heights.");

SELECT * FROM documents;
UPDATE documents SET author = "Jackie Draper"
WHERE author = "Jackie Paper";

SELECT * FROM documents;
##STEP 2
DELETE FROM documents WHERE title = "Things I'm Afraid Of";
SELECT * FROM documents;

###/* What we used to originally create the table */
drop table users;
drop table diary_logs;
CREATE TABLE users (id INTEGER PRIMARY KEY, name TEXT);
CREATE TABLE diary_logs (id INTEGER PRIMARY KEY auto_increment, user_id INTEGER, date TEXT, content TEXT);
/* After user submits a diary log */
INSERT INTO diary_logs (user_id, date, content) VALUES (1, "2015-04-02",
"OhNoesGuy and I made up and now we're best friends forever and we celebrated with a tub
of ice cream."); 
###Altering Tables After Creation
ALTER TABLE diary_logs ADD emotion TEXT default 'unknown';
INSERT INTO diary_logs (user_id, date, content, emotion) VALUES (1, "2015-04-03","We went to Disneyland!", "happy");
SELECT * FROM diary_logs;
DROP TABLE diary_logs;
SELECT * FROM diary_logs;

/*Challenge: Clothing alterations*/
CREATE TABLE clothes (id INTEGER PRIMARY KEY AUTO_INCREMENT, type TEXT,design TEXT);
INSERT INTO clothes (type, design)
 VALUES ("dress", "pink polka dots");
INSERT INTO clothes (type, design)
 VALUES ("pants", "rainbow tie-dye");
INSERT INTO clothes (type, design)
 VALUES ("blazer", "black sequin");
 
/* Use ALTER to add a 'price' column to the table. */
ALTER TABLE clothes ADD price INTEGER;
SELECT * FROM clothes;
/* assign each item a price, using UPDATE - item 1 should be 10 dollars, item 2 should be 20 
dollars, item 3 should be 30 dollars.*/
UPDATE clothes SET price = 10 WHERE id = 1;
UPDATE clothes SET price = 20 WHERE id = 2;
UPDATE clothes SET price = 30 WHERE id = 3;
SELECT * FROM clothes;

/* insert a new item into the table that has all three attributes filled in, including 'price' */
INSERT INTO clothes(type, design, price)
VALUES ("shirt", "plain", 40);
SELECT * FROM clothes;
