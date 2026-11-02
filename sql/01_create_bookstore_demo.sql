/*
01_create_bookstore_demo.sql
Creates a very small demo database and two tables.
*/

CREATE DATABASE GitBookStoreDemo;
GO

USE GitBookStoreDemo;
GO

CREATE TABLE dbo.Publisher
(
    publisher_id int NOT NULL,
    publisher_name varchar(100) NOT NULL,
    country varchar(50) NOT NULL,

    CONSTRAINT PK_Publisher
        PRIMARY KEY (publisher_id)
);
GO

CREATE TABLE dbo.Book
(
    book_id int NOT NULL,
    publisher_id int NOT NULL,
    book_name varchar(150) NOT NULL,
    book_type varchar(50) NOT NULL,
    price decimal(10,2) NOT NULL,

    CONSTRAINT PK_Book
        PRIMARY KEY (book_id)
);
GO

ALTER TABLE dbo.Book
ADD CONSTRAINT FK_Book_Publisher
    FOREIGN KEY (publisher_id)
    REFERENCES dbo.Publisher(publisher_id);
GO
