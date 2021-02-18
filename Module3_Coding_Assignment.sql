-- Module 3 Coding Assignment
/* 1. Using a subquery, find the names of all the tracks for the album "Californication". */
SELECT Name,
       albumid
FROM tracks
WHERE albumid IN (
  SELECT albumid
  FROM albums
  WHERE title = 'Californication');

  /*2 Find the total number of invoices for each customer along with the customer's full name, city and email. */

  SELECT Customers.FirstName,
         Customers.LastName,
         Customers.City,
         Customers.Email,
         COUNT(Invoices.InvoiceId) AS Invoices
FROM Customers INNER JOIN Invoices
  ON Customers.CustomerId = Invoices.CustomerId
GROUP BY Customers.CustomerId;

/* 3. Retrieve the track name, album, artistID, and trackID for all the albums. */

SELECT tracks.TrackId,
       tracks.Name,
       Albums.Title,
       Albums.ArtistId
FROM tracks INNER JOIN Albums
  ON tracks.AlbumId = Albums.AlbumId;

/* 4. Retrieve a list with the managers last name, and the last name of the employees who report to him or her. */

SELECT M.LastName AS Managers,
       E.LastName AS Employees
FROM Employees E INNER JOIN Customers M
  ON E.ReportsTo = M.EmployeeId;

/* 5. Find the name and ID of the artists who do have albums */

SELECT Artists.Name,
       Artists.ArtistId
FROM Artists LEFT JOIN Albums
  ON Artists.ArtistId = Albums.ArtistId
WHERE Albums.ArtistId IS NULL;

/* 6. Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order. */

SELECT LastName,
       FirstName
FROM Employees
UNION
SELECT Lastname,
       FirstName
FROM Customers
ORDER BY LastName DESC;

/* 7. See if there are any customers who have a different city listed in their billing city versus their customer city. */

SELECT Customers.FirstName,
       Customers.LastName,
       Customers.City AS CustomerCity,
       Invoices.BillingCity AS BillingCity
FROM Customers INNER JOIN Invoices
  ON Customers.CustomerId = Invoices.CustomerId
WHERE CustomerCity != BillingCity;
