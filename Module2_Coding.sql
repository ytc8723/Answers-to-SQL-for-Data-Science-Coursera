/* All of the questions in this quiz refer to the open source Chinook Database. Please familiarize yourself with the ER diagram to familiarize yourself with the table and column names to write accurate queries and get the appropriate answers.

1. Run Query: Find all the tracks that have a length of 5,000,000 milliseconds or more */

SELECT TrackId,
       Milliseconds,
FROM tracks
WHERE Milliseconds >= 5000000;


/* 2. Find all the invoices whose total is between $5 and $15 dollars.*/

SELECT COUNT(InvoiceID)
FROM invoices
WHERE Total BETWEEN 5 AND 15;

 /* 3. Find all the customers from the following States: RJ, DF, AB, BC, CA, WA, NY*/

 SELECT FirstName,
        LastName,
        Company,
        State
FROM Customers
WHERE State IN ('RJ', 'DF', 'AB', 'BC', 'CA', 'WA', 'NY');

/* 4. Find all the invoices for customer 56 and 58 where the total was between $1 and $5 */

SELECT InvoiceId,
       CustomerID,
       InvoiceDate,
       Total
FROM Invoices
WHERE CustomerID IN (56, 58) AND Total BETWEEN 1 AND 5;

/* 5. Find all the tracks whose name starts with 'All' */

SELECT COUNT(TrackId)
FROM Tracks
WHERE Name LIKE ('All%');

/* 6. Find all the customer emails that start with 'J' and are from gmail.com */

SELECT CustomerId,
       FirstName,
       LastName,
       Email
FROM Customers
WHERE Email LIKE ('J%gmail.com');

/* 7. Find all the invoices from the billing city Brasília, Edmonton, and Vancouver and sort in descending order by invoice ID.*/

SELECT *
FROM Invoices
WHERE BillingCity IN ('Brasilia', 'Edmonton', 'Vancouver')
ORDER BY InvoiceId DESC;

/* 8.  Show the number of orders placed by each customer (hint: this is found in the invoices table) and sort the result by the number of orders in descending order */

SELECT CustomerId, COUNT(CustomerId)
FROM Invoices
GROUP BY CustomerId
ORDER BY COUNT(CustomerId) DESC;

/* 9. Find the albums with 12 or more tracks */

SELECT AlbumId,
       COUNT (AlbumId) AS NumTrack
FROM Tracks
GROUP BY AlbumId
HAVING NumTrack >= 12;
