/*
02_insert_and_query_demo.sql
Inserts sample rows and runs a simple query.
*/

USE GitBookStoreDemo;
GO

INSERT INTO dbo.Publisher (publisher_id, publisher_name, country)
VALUES
(1, 'Northwind Books', 'United Kingdom'),
(2, 'Nordic Data Press', 'Sweden'),
(3, 'Berlin Analytics Publishing', 'Germany');
GO

INSERT INTO dbo.Book (book_id, publisher_id, book_name, book_type, price)
VALUES
(1, 1, 'SQL Basics', 'Technology', 39.90),
(2, 1, 'Data Modeling Intro', 'Technology', 49.90),
(3, 2, 'Python for Analysts', 'Technology', 44.90),
(4, 3, 'Business Reporting', 'Business', 29.90);
GO

SELECT
    b.book_id,
    b.book_name,
    b.book_type,
    b.price,
    p.publisher_name,
    p.country
FROM dbo.Book AS b
JOIN dbo.Publisher AS p
    ON p.publisher_id = b.publisher_id
ORDER BY
    p.country,
    b.book_name;
GO
-- Added during Git demo: grouped report by country
SELECT
    p.country,
    COUNT(*) AS number_of_books,
    AVG(b.price) AS avg_price
FROM dbo.Book AS b
JOIN dbo.Publisher AS p
    ON p.publisher_id = b.publisher_id
GROUP BY
    p.country
ORDER BY
    p.country;
GO
