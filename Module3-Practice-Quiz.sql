/* Practice Quiz - Writing Queries */

/* 1. How many albums does the artist Led Zeppelin
have? */

SELECT Name,
       numAlbums
FROM (
  SELECT Name,
         artists.artistid,
         COUNT(albumid) as numAlbums
  FROM artists LEFT JOIN albums ON artists.artistid = albums.artistid
  GROUP BY Name)
WHERE Name = 'Led Zeppelin';

/* 2. Create a list of album titles and the unit prices for the artist "Audioslave". */

SELECT
    artists.artistid,
    artists.name,
    albums.albumid,
    tracks.Unitprice
FROM artists
  LEFT JOIN albums ON artists.artistid = albums.artistid
  LEFT JOIN tracks ON albums.albumid = tracks.albumid
WHERE artists.name = 'Audioslave';

/* 3. Find the first and last name of any customer who does not have an invoice. Are there any customers returned from the query? */

SELECT customers.FirstName,
       customers.LastName,
       invoices.invoiceid
FROM customers
  LEFT JOIN invoices ON customers.customerid = invoices.customerid

/* 4. Find the total price for each album. */

SELECT albums.title,
       SUM(tracks.Unitprice)
FROM albums
  LEFT JOIN tracks ON albums.albumid = tracks.albumid
WHERE albums.title = 'Big Ones'
GROUP BY albums.title;

/* 5. How many records are created when you apply a Cartesian join to the invoice and invoice items table? */

SELECT invoices.invoiceid
FROM invoices CROSS JOIN invoice_items; 
