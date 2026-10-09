CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(50),
    phone VARCHAR(15),
    city VARCHAR(30)
);

select * from Customers;


CREATE TABLE Destinations (
    destination_id INT PRIMARY KEY,
    destination_name VARCHAR(50),
    country VARCHAR(50),
    description VARCHAR(100)
);

select * from Destinations ;


CREATE TABLE Packages (
    package_id INT PRIMARY KEY,
    destination_id INT,
    package_name VARCHAR(50),
    duration_days INT,
    package_price DECIMAL(10,2),
    FOREIGN KEY (destination_id) REFERENCES Destinations (destination_id)
);

select * from Packages;


CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    customer_id INT,
    package_id INT,
    booking_date DATE,
    travel_date DATE,
    status VARCHAR(20),
    number_of_people INT,
    FOREIGN KEY (customer_id) REFERENCES Customers (customer_id),
    FOREIGN KEY (package_id) REFERENCES Packages (package_id)
);

select * from Bookings;


CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    booking_id INT,
    payment_date DATE,
    amount DECIMAL(10,2),
    payment_mode VARCHAR(20),
    Payment_status VARCHAR(20),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

select * from Payments;



#customer_id,customer_name,email,phone,city
INSERT INTO Customers VALUES
(1,'Rahul','rahul@gmail.com','9876543210','Chennai'),
(2,'Anita','anita@gmail.com','8765432109','Coimbatore'),
(3,'Hari','hari@gmail.com','9854389402','Bangalore'),
(4,'Shyam','shyam@gmail.com','9456237822','Trichy'),
(5,'Priya','priya@gmail.com','9834902165','Salem'),
(6,'Abi','abi@gmail.com','9808653615','Madurai'),
(7,'Prem','prem@gmail.com','9847650923','Chennai'),
(8,'Sindhu','sindhu@gmail.com','9866382199','Coimbatore'),
(9,'Siva','siva@gmail.com','9807895433','Trichy'),
(10,'Akila','akila@gmail.com','9866432288','Bangalore'),
(11,'Raja','raja@gmail.com','9845773321','Chennai'),
(12,'Ram','ram@gmail.com','9875663930','Coimbatore'),
(13,'Krish','krish@gmail.com','9866748591','Trichy'),
(14,'Guru','guru@gmail.com','9800321928','Bangalore'),
(15,'Mano','mano@gmail.com','9832129920','Coimbatore')
;

#destination_id,destination_name,country,description 
INSERT INTO Destinations VALUES
(101,'Goa','India','Beach_destination'),
(102,'Paris','France','City_of_lights'),
(103,'Dubai','UAE','Luxury_city'),
(104,'Singapore','Singapore','Clean_city'),
(105,'Maldives','Maldives','Island_resort'),
(106,'Manali','India','Hill_station'),
(107,'Ooty','India','Queen_of_hills'),
(108,'Bangkok','Thailand','Tourist_city'),
(109,'London','UK','Historic_city'),
(110,'New York','USA','Modern_city'),
(111,'Dubai','UAE','Luxury_city'),
(112,'Singapore','Singapore','Clean_city'),
(113,'Maldives','Maldives','Island_resort'),
(114,'Manali','India','Hill_station'),
(115,'Singapore','Singapore','Clean_city')
;

#package_id,destination_id,package_name,duration_days,package_price 
INSERT INTO Packages VALUES
(201,101,'Goa Beach Package',5,15000),
(202,102,'Paris Tour Package',7,60000),
(203,103,'Dubai Luxury Package',4,40000),
(204,104,'Singapore City Tour',5,35000),
(205,105,'Maldives Honeymoon',6,70000),
(206,106,'Manali Hill Trip',4,12000),
(207,107,'Ooty Nature Tour',3,10000),
(208,108,'Bangkok Fun Tour',5,30000),
(209,109,'London Explorer',7,65000),
(210,110,'New York Trip',6,75000),
(211,111,'Dubai Luxury Package',4,40000),
(212,112,'Singapore City Tour',5,35000),
(213,113,'Maldives Honeymoon',6,70000),
(214,114,'Manali Hill Trip',4,12000),
(215,115,'Singapore City Tour',5,35000)
;

#booking_id,customer_id,package_id,booking_date,travel_date,status,number_of_people
INSERT INTO Bookings VALUES
(301,1,201,'2026-01-01','2026-02-01','Confirmed',2),
(302,2,202,'2026-01-02','2026-02-10','Confirmed',4),
(303,3,203,'2026-01-03','2026-02-08','Pending',3),
(304,4,204,'2026-01-04','2026-02-04','Confirmed',3),
(305,5,205,'2026-01-05','2026-02-15','Confirmed',2),
(306,6,206,'2026-01-06','2026-02-03','Pending',4),
(307,7,207,'2026-01-07','2026-02-05','Confirmed',2),
(308,8,208,'2026-01-08','2026-02-06','Confirmed',2),
(309,9,209,'2026-01-09','2026-02-15','Pending',2),
(310,10,210,'2026-01-10','2026-02-20','Confirmed',4),
(311,11,211,'2026-01-04','2026-02-04','Cancelled',3),
(312,12,212,'2026-01-06','2026-02-03','Pending',4),
(313,13,213,'2026-01-05','2026-02-15','Cancelled',2),
(314,14,214,'2026-01-06','2026-02-03','Pending',4)
;

#payment_id,booking_id,payment_date,amount,payment_mode,Payment_status 
INSERT INTO Payments VALUES
(401,301,'2026-01-01',15000,'UPI','Paid'),
(402,302,'2026-01-02',60000,'Card','Paid'),
(403,303,'2026-01-03',40000,'NetBanking','Pending'),
(404,304,'2026-01-04',35000,'UPI','Paid'),
(405,305,'2026-01-05',70000,'Card','Paid'),
(406,306,'2026-01-06',12000,'Cash','Pending'),
(407,307,'2026-01-07',10000,'UPI','Paid'),
(408,308,'2026-01-08',30000,'Card','Paid'),
(409,309,'2026-01-09',65000,'NetBanking','Pending'),
(410,310,'2026-01-10',75000,'UPI','Paid'),
(412,312,'2026-01-06',35000,'UPI','Paid'),
(414,314,'2026-01-06',12000,'Card','Paid')
;




#Write a query to display Customer Name, Package Name, Travel Date, Number of People using JOIN.

SELECT c.customer_name, p.package_name, b.travel_date, b.number_of_people
FROM Bookings b
JOIN Customers c ON b.customer_id = c.customer_id
JOIN Packages p ON b.package_id = p.package_id;


#Write a query to find Total Revenue from all payments.

SELECT SUM(amount) AS total_revenue
FROM Payments
WHERE payment_status = 'Paid';

#Display Top 3 Most Booked Packages.\

SELECT p.package_name, COUNT(b.booking_id) AS total_bookings
FROM Packages p
JOIN Bookings b ON p.package_id = b.package_id
GROUP BY p.package_name
ORDER BY total_bookings DESC
LIMIT 3;


#Find Customers who have not made any bookings.\

SELECT customer_name
FROM Customers
WHERE customer_id NOT IN (SELECT customer_id FROM Bookings);

#Write a query to show Monthly Income Report.

SELECT MONTH(payment_date) AS month, SUM(amount) AS total_income
FROM Payments
WHERE payment_status = 'Paid'
GROUP BY MONTH(payment_date);

#Write a query to list Cancelled Bookings.

SELECT *
FROM Bookings
WHERE status = 'Cancelled';

#Find the Highest Priced Travel Package.

SELECT *
FROM Packages
ORDER BY package_price DESC
LIMIT 1;

#Write a query to count Total Customers per City.

SELECT city, COUNT(customer_id) AS total_customers
FROM Customers
GROUP BY city;
 
#total bookings
SELECT p.package_name, COUNT(b.booking_id) AS total_bookings
FROM Bookings b
JOIN Packages p ON p.package_id = b.package_id
GROUP BY p.package_name;


#city chennai
SELECT *
FROM Customers
WHERE city = 'Chennai';

#count of paid

SELECT COUNT(*) AS total_paid
FROM Payments
WHERE Payment_status = 'Paid';

#sum of amount paid

SELECT SUM(amount) AS total_amount_paid
FROM Payments
WHERE Payment_status = 'Paid';


#booking confirmed
SELECT * 
FROM Bookings
WHERE status = 'Confirmed';

#customer name,booking date,package name,status

SELECT c.customer_name, b.booking_date, p.package_name, b.status
FROM Customers c
JOIN Bookings b ON c.customer_id = b.customer_id
JOIN Packages p ON b.package_id = p.package_id;

#Pending payments
SELECT * FROM Payments WHERE payment_status='Pending';

#confirmed but pending
SELECT b.booking_id, c.customer_name, p.amount, p.payment_status, b.status
FROM Bookings b
JOIN Customers c ON b.customer_id = c.customer_id
JOIN Payments p ON b.booking_id = p.booking_id
WHERE b.status = 'Confirmed'
AND p.payment_status = 'Pending';

#expensive Package
SELECT *
FROM Packages
ORDER BY package_price DESC
LIMIT 1;

#cheap package
SELECT *
FROM Packages
ORDER BY package_price ASC
LIMIT 1;

# between 
SELECT *
FROM Bookings
WHERE travel_date BETWEEN '2026-01-02' AND '2026-02-05';


#Delete table
drop table Customers;
drop table Destinations;
drop table Packages;
drop table Bookings;
drop table Payments;



