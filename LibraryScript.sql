--create data base
CREATE DATABASE Library;
GO

--connected to DB
USE Library;

--create tables
CREATE TABLE Authors
(id INT PRIMARY KEY IDENTITY, 
name VARCHAR(20),
surname VARCHAR(20),
date_birth DATE,  --YYYY-MM-DD
date_death DATE
);

CREATE TABLE Addresses
(id INT PRIMARY KEY IDENTITY,
street VARCHAR(50),
street_number VARCHAR(20),
postal_code VARCHAR(10),
city VARCHAR(20),
country VARCHAR(20)
);

CREATE TABLE PublishingHouse
(id INT PRIMARY KEY IDENTITY,
name VARCHAR(20),
address_ID INT FOREIGN KEY REFERENCES Addresses(id)
);

CREATE TABLE BookLanguage
(id INT PRIMARY KEY IDENTITY,
book_language VARCHAR(20)
);

CREATE TABLE LiteratureCategory
(id INT PRIMARY KEY IDENTITY,
category_name VARCHAR(20)
);

CREATE TABLE Books
(id INT PRIMARY KEY IDENTITY,
isbn BIGINT,
title VARCHAR(50),
published_year INT,
page_number INT,
publishing_house_ID INT FOREIGN KEY REFERENCES PublishingHouse(id),
language_ID INT FOREIGN KEY REFERENCES BookLanguage(id),
category_ID INT FOREIGN KEY REFERENCES LiteratureCategory(id),
quantity INT,
price MONEY
);

--link table
CREATE TABLE AuthorsBooks
(author_ID INT FOREIGN KEY REFERENCES Authors(id),
book_ID INT FOREIGN KEY REFERENCES Books(id),
CONSTRAINT pk_authors_books PRIMARY KEY (author_ID, book_id)
);

CREATE TABLE Members
(id INT	PRIMARY KEY IDENTITY,
name VARCHAR(20),
surname VARCHAR(20),
address_ID INT FOREIGN KEY REFERENCES Addresses(id),
email VARCHAR(50),
password VARCHAR(20),
phone VARCHAR(20),
);

CREATE TABLE Transactions
(id INT PRIMARY KEY IDENTITY,
book_ID INT FOREIGN KEY REFERENCES Books(id),
member_ID INT FOREIGN KEY REFERENCES Members(id),
book_quantity INT
);

--insert data
INSERT INTO LiteratureCategory (category_name) VALUES 
('Culinare'), ('Arta'), ('Arhitectura'), ('Biografii'), ('Lingvistica'), ('Poezie'), ('Teatru'), ('Fictiune'), ('Istorie'),
('Religie'), ('Filosofie'), ('Psihologie'), ('Copii'), ('Medicina'), ('Drept'), ('Business'), ('Economie'), ('Matematici'), ('Sport')

INSERT INTO BookLanguage (book_language) VALUES ('Romanian'), ('English'), ('Spanish'), ('French'), ('Portuguese'), ('Arabic'),
('German'), ('Russian'), ('Italian'), ('Japanese'), ('Korean'), ('Turkish')

INSERT INTO Addresses (street, street_number, postal_code, city, country) VALUES('Bd. Regie', '6D', '060204', 'Bucharest', 'Romania'), ('Piata Presei Libere', '1', '715541', 'Bucharest', 'Romania'),
('Arh. Ion Mincu', '1', '11356', 'Bucharest', 'Romania'), ('Sos. Kiseleff', '30', '11347', 'Bucharest', 'Romania'), ('Grigore Ipatescu', '5', '113457','Bucharest', 'Romania'),
('Piata Presei Libere', '1', '013701', 'Bucharest', 'Romania'), ('Albac', '15', '11607', 'Bucharest', 'Romania')

INSERT INTO PublishingHouse (name, address_ID) VALUES ('Publica', 7), ('Humanitas', 6), ('Paralela 45', 5), ('Ministry of Culture', 4), ('Curtea Veche', 3), ('Egmont', 2), ('Niculescu', 1)

INSERT INTO Authors (name, surname, date_birth, date_death) VALUES ('Eckhart', 'Tolle', '1948-02-16', '1900-01-01'), ('Mihai', 'Eminescu', '1850-01-15', '1889-06-15'), ('Kevin', 'Simler', '1900-01-01', '1900-01-01'),
('Robin', 'Hanson', '1959-08-28', '1900-01-01'), ('Christopher', 'McDougall', '1962-01-24', '1900-01-01'), ('Liviu', 'Rebreanu', '1885-11-27', '1944-09-01'), ('James', 'Clear', '1900-01-01', '1900-01-01'), ('Marcus', 'Aurelius', '0121-04-26', '0180-03-17'), 
('Harari', 'Yuval Noah', '1976-02-24', '1900-01-01'), ('Ion', 'Creanga', '1837-03-01', '1889-12-31'), ('Nichita', 'Stanescu', '1933-03-31', '1983-12-13')

INSERT INTO Books (isbn, title, published_year, page_number, publishing_house_ID, language_ID, category_ID, quantity, price) VALUES
(9786064408310, 'Puterea Prezentlui', 2021, 144, 5, 1, 12, 3, 50.00),
(9786064010117, 'Elefantul Din Creier', 2021, 528, 1, 1, 12, 5, 55.00),
(9780099590088, 'Sapiens', 2015, 512, 6, 7, 9, 5, 46.00),
(9789734671991, 'Homo Deus', 2018, 392, 6, 7, 9, 5, 62.00),
(9780099590088, 'Sapiens', 2015, 512, 6, 1, 9, 10, 46.00),
(9789734671991, 'Homo Deus', 2018, 392, 6, 1, 9, 10, 62.00),
(9780857088468, 'Meditations', 2019, 320, 4, 2, 9, 20, 67.00),
(9789731163109, 'Integrala Poeziei', 2013, 820, 3, 1, 6, 30, 88.20),
(9789975342094, 'Tu ai un fel de paradis al tau', 2020, 324, 3, 1, 6, 30, 56.05),
(2000000338224, 'Nascuti pentru a alerga', 2016, 288, 4, 1, 19, 15, 35.50),
(2000000338224, 'Born to run', 2016, 288, 4, 2, 19, 15, 35.50),
(2000000338224, 'Born to run', 2016, 288, 4, 3, 19, 15, 35.50),
(9786067891744, 'Atomic Habits', 2019, 272, 7, 2, 12, 6, 49.00),
(9789731898384, 'Nuvele', 2016, 270, 2, 1, 13, 35, 16.20)

INSERT INTO AuthorsBooks (author_ID, book_ID) VALUES (1, 1), (3, 2), (4, 2), (9, 3), (9, 4), (9, 5), (9, 6), (8, 7), (11, 8), (11, 9), (5, 10), (5, 11), (5, 12), (7, 13), (6, 14)

INSERT INTO Members (name, surname, address_ID, email, password, phone) VALUES ('Popescu', 'Maria', 1, 'maria@gmail.com', '34fd43f', '0764953567'),
('Andrei', 'Avram', 4, 'avram@gmail.com', '3432f43da', '0732454652'), ('Catalin', 'Lungu', 2, 'catalin@yahoo.com', 'dcfs34kfsjf', '0735412123'),
('Cosmina', 'Ionesc', 1, 'cosmina@yahoo.com', 'jvg943rjks', '0729540332'), ('Larisa', 'Baciug', 5, 'larisa@gmail.com', '3redma203dc', '0768493422'),
('Teodora', 'Ciocarlan', 7, 'teo@gmail.com', 'd3redss', '0745643949'), ('Darius', 'Lepadatu', 3, 'darius@gmail.com', 'fk29342vs', '0764349532')

INSERT INTO Transactions (book_ID, member_ID, book_quantity) VALUES (1, 4, 3), (2, 2, 1), (10, 7, 1), (10, 3, 1), (5, 4, 1), (12, 1, 2), (14, 1, 1), (7, 6, 1), (9, 5, 1)

INSERT INTO Transactions (book_ID, book_quantity) VALUES (1,1)

INSERT INTO Authors (name, surname, date_birth) VALUES ('Eckhart', 'Tolle', '1948-02-16'),
('Robin', 'Hanson', '1959-08-28'), ('Christopher', 'McDougall', '1962-01-24'),
('Harari', 'Yuval Noah', '1976-02-24')

--insert new data to check if the id value has been reset 
INSERT INTO Authors (name, surname, date_birth, date_death) VALUES ('Marin', 'Sorescu', '1936-02-29', '1996-12-08')
INSERT INTO Authors (name, surname, date_birth) VALUES ('PAul', 'Hollywood', '1966-03-01')

INSERT INTO Books (isbn, title, published_year, page_number, publishing_house_ID, language_ID, category_ID, quantity, price) VALUES
(1408846500, 'A Bakery''s life', 2017, 304, 6, 2, 1, 10, 190.99)
INSERT INTO AuthorsBooks (author_ID, book_ID) VALUES (13, 15)


INSERT INTO Books (title, published_year, page_number, publishing_house_ID, language_ID, category_ID, quantity, price) VALUES 
('Setea muntelui de sare', 2020, 190, 1, 1, 13, 7, 29.00)
INSERT INTO AuthorsBooks (author_ID, book_ID) VALUES (12, 16)

INSERT INTO Books (isbn, title, published_year, page_number, publishing_house_ID, language_ID, category_ID, quantity, price) VALUES 
(9789731898384, 'Nuvele', 2019, 270, 3, 1, 13, 35, 20.20)

--modify isbn column datatype from varchar in bigint
ALTER TABLE Books 
ALTER COLUMN isbn BIGINT

--modify default date value in null
UPDATE Authors 
SET date_birth = NULL 
WHERE date_birth = '1900-01-01'

UPDATE Authors 
SET date_death = NULL 
WHERE date_death = '1900-01-01'

UPDATE Authors 
SET name = 'Paul'
WHERE name = 'PAul'

--delete duplicate data
DELETE FROM Authors 
WHERE id = 12 

DELETE FROM Authors 
WHERE id = 13 OR id = 14 OR id = 15 

--and reset auto incremented id value
DBCC CHECKIDENT ('Authors') 				-- check the identity column value (15)
DBCC CHECKIDENT ('Authors', RESEED, 11)  	-- reset the identity column value.

--increase with 10% books price where price is less then 40.00
UPDATE 	Books 
SET 	price = price + (0.1 * price)
WHERE 	price < 70 

--isbn update of the book "Setea muntelui de sare" with isbn null
UPDATE 	Books 
SET 	isbn = 9786067107586
WHERE 	isbn IS NULL

------------------------------------------
------------------------------------------
------------------------------------------
------------------------------------------
------------------------------------------
------------------------------------------
--TEMA 2

--a) find books published in 2019 or 2020 (UNION)
SELECT 	b.id, b.title, b.published_year 
FROM  	Books b
WHERE 	b.published_year = 2019
UNION 
SELECT 	b.id, b.title, b.published_year 
FROM  	Books b
WHERE 	b.published_year = 2020

--a) find books published in 2019 or 2020 (OR)
SELECT 	b.id, b.title, b.published_year 
FROM  	Books b
WHERE 	b.published_year = 2019
		OR b.published_year = 2020

--b) find books translated into Romanian and German (INTERSECT)
SELECT 	b.title
FROM  	Books b, BookLanguage bl 
WHERE 	b.language_ID = bl.id 
		AND bl.book_language = 'German'
INTERSECT
SELECT 	b.title
FROM  	Books b, BookLanguage bl 
WHERE 	b.language_ID = bl.id 
		AND bl.book_language = 'Romanian'

--b)/e) find books translated into Romanian and German (IN)
SELECT 	b.title 
FROM  	Books b
WHERE 	b.language_ID IN (	SELECT 	bl1.id 
							FROM 	BookLanguage bl1, BookLanguage bl2
							WHERE 	bl1.book_language = 'German' 
									AND bl2.book_language = 'Romanian')

--c) find authors who have books at the publishing house Paralela 45 but not at Humanitas (EXCEPT)
SELECT	a.id, a.name, a.surname 
FROM 	Authors a, Books b, AuthorsBooks ab, PublishingHouse ph 
WHERE 	a.id = ab.author_ID 
		AND b.id = ab.book_ID 
		AND b.publishing_house_ID = ph.id 
		AND ph.name = 'Paralela 45'
EXCEPT 
SELECT 	a.id, a.name, a.surname 
FROM 	Authors a, Books b, AuthorsBooks ab, PublishingHouse ph 
WHERE 	a.id = ab.author_ID 
		AND b.id = ab.book_ID 
		AND b.publishing_house_ID = ph.id 
		AND ph.name = 'Humanitas'

--c) find authors who have books at the publishing house Paralela 45 but not at Humanitas (NOT IN)
SELECT DISTINCT 	a.id, a.name, a.surname 
FROM 				Authors a, Books b, AuthorsBooks ab, PublishingHouse ph 
WHERE 				a.id = ab.author_ID 
					AND b.id = ab.book_ID 
					AND b.publishing_house_ID = ph.id 
					AND ph.name = 'Paralela 45' 
					AND ph.name NOT IN (	SELECT 	ph.name
											FROM 	Books b, PublishingHouse ph 
											WHERE 	b.publishing_house_ID = ph.id 
													AND ph.name = 'Humanitas')
												
--d.i) display all the books that have been traded (INNER JOIN)
SELECT 	*
FROM 	Books b INNER JOIN Transactions t ON b.id = t.book_ID
												
--d.ii) transaction data will be displayed; books that do no have transactions will also be included; the result contains the names of the authors (RIGHT JOIN)
SELECT 	*
FROM 	Transactions t RIGHT JOIN Books b ON t.book_ID = b.id 
		INNER JOIN AuthorsBooks ab ON b.id = ab.book_ID 
		INNER JOIN Authors a ON a.id = ab.author_ID 

--e) display all the books from Egmont publishing house -> subinterogation in clause where (EXISTS)
SELECT 	b.title 
FROM  	Books b
WHERE EXISTS (	SELECT 	ph.id 
				FROM 	PublishingHouse ph 
				WHERE 	b.publishing_house_ID = ph.id 
						AND ph.name = 'Egmont')
				
--f) display the transactions of psychology books -> subinterogation in clause from
SELECT *
FROM (	SELECT 	b.id, b.title
	  	FROM 	Books b, LiteratureCategory lc 
	  	WHERE 	b.category_ID = lc.id 
	  			AND lc.category_name = 'Psihologie') AS b2 INNER JOIN Transactions t ON b2.id = t.book_ID
	  
--g.i) display how many transaction were made on each book category and the total quantity sold
SELECT 		lc.category_name, 
			COUNT(t.id) AS transactionsByCategory, 
			SUM(t.book_quantity) AS totalQuantitySold
FROM 		Books b INNER JOIN Transactions t ON b.id = t.book_ID 
					RIGHT JOIN LiteratureCategory lc ON b.category_ID = lc.id 
GROUP BY 	lc.category_name 
ORDER BY 	transactionsByCategory DESC

--g.ii) display the Publishing House and authors who have at least 2 books at the same PublishingHouse, count how many books he has in total and the avarage price
SELECT 		a.name AS Author_Name, 
			a.surname AS Author_Surname, 
			ph.name AS Publishing_House, 
			COUNT(*) AS total_number_of_books, 
			AVG(b.price) AS avg_book_price
FROM 		AuthorsBooks ab INNER JOIN Authors a ON ab.author_ID = a.id 
							INNER JOIN Books b ON ab.book_ID = b.id 
							INNER JOIN PublishingHouse ph ON b.publishing_house_ID = ph.id 
GROUP BY 	a.name, a.surname, ph.name
HAVING 		COUNT(*) >= 2

--g.iii) display the author and the Publishing House where he has the most books, count how many books he has in total and the avarage price
SELECT TOP(1) 	a.name AS Author_Name, 
				a.surname AS Author_Surname, 
				ph.name AS Publishing_House, 
				COUNT(*) AS total_number_of_books, 
				AVG(b.price) AS avg_book_price
FROM 			AuthorsBooks ab INNER JOIN Authors a ON ab.author_ID = a.id 
								INNER JOIN Books b ON ab.book_ID = b.id 
								INNER JOIN PublishingHouse ph ON b.publishing_house_ID = ph.id 
GROUP BY 		a.name, a.surname, ph.name
HAVING 			COUNT(*) >= 2
ORDER BY 		total_number_of_books DESC

--h) display the latest published books (2021)
SELECT 	*
FROM 	Books b 
WHERE 	b.published_year >= ALL (	SELECT	b2.published_year
									FROM 	Books b2)

									
------------------------------------------
------------------------------------------
------------------------------------------
------------------------------------------
------------------------------------------
------------------------------------------
--TEMA 3
									
--1. Procedures and user-defined functions

--1.a) creating the validation function 
CREATE FUNCTION checkIsbnCodeForBooks (@isbnCode BIGINT)
RETURNS BIT AS 
	BEGIN
		IF(LEN(@isbnCode) = 13)
			RETURN 1
		RETURN 0
	END
	
--call the validation function
PRINT dbo.checkIsbnCodeForBooks(23949340);
PRINT dbo.checkIsbnCodeForBooks(2394934000256);

--creating the stored procedure that inserts data into the Books table and use the isbn code validation function
CREATE PROCEDURE insertBooks (@isbnCode BIGINT, @bookTitle VARCHAR(20), @publishedYear INT, @pageNumber INT, @publishingHouseID INT, @bookLanguageID INT, @categoryID INT, @quantity INT, @price MONEY)
AS
BEGIN
	IF(dbo.checkIsbnCodeForBooks(@isbnCode) = 0)
		PRINT 'ISBN code must have 13 digits'
	ELSE 
		INSERT INTO Books(isbn, title, published_year, page_number, publishing_house_ID, language_ID, category_ID, quantity, price) 
		VALUES (@isbnCode, @bookTitle, @publishedYear, @pageNumber, @publishingHouseID, @bookLanguageID, @categoryID, @quantity, @price)
END

--call the stored procedure that inserts books into the table
EXEC insertBooks 9786063322389, Proza, 2017, 444, 1, 1, 6, 5, 19.90  
--Display all the books
SELECT * FROM Books
--call the stored procedure that insert a book with invalid isbn code
EXEC insertBooks 97860669511, Tiganiada, 2008, 412, 1, 1, 6, 5, 29.00
--Display all the books
SELECT * FROM Books

--1.b) creating the validation function in which I check if the quantity traded is less than or equal to the quantity remaining in stock
CREATE FUNCTION checkTransactionBookQuantity (@bookID INT, @transactionQuantity INT)
RETURNS BIT AS 
	BEGIN
		DECLARE @bookQuantity INT
		SET @bookQuantity = 0
		
		SELECT @bookQuantity = b.quantity 
		FROM Books b 
		WHERE b.id = @bookID
		
		IF(@transactionQuantity <= @bookQuantity)
			RETURN 1
		RETURN 0
	END
	
DROP FUNCTION checkTransactionBookQuantity
	
--call the validation function
PRINT dbo.checkTransactionBookQuantity(1, 239);
PRINT dbo.checkTransactionBookQuantity(1, 1);

--creating the stored procedure that inserts data into the Transactions table and use the validation function for the book_quantity COLUMN 
CREATE PROCEDURE insertTransactions (@bookID INT, @memberID INT, @bookQuantity INT)
AS
BEGIN
	IF(dbo.checkTransactionBookQuantity(@bookID, @bookQuantity) = 0)
		PRINT 'The quantity traded must be less than the quantity remaining in stock'
	ELSE 
		INSERT INTO Transactions (book_ID, member_ID, book_quantity) 
		VALUES (@bookID, @memberID, @bookQuantity)
END

DROP PROCEDRE insertTransactions

--call the stored procedure that inserts transactions into the table
EXEC insertTransactions 10, 1, 3;
--Display all the transactions
SELECT * FROM Transactions
--call the stored procedure that inserts transactions into the table
EXEC insertTransactions 16, 4, 8;
--Display all the transactions
SELECT * FROM Transactions


------------------------------------------
------------------------------------------
------------------------------------------
--2. View and Select interogation

CREATE VIEW BooksDetails 
AS
SELECT b.isbn, b.title, a.name, a.surname, b.page_number, lc.category_name, bl.book_language, b.price, b.quantity 
FROM AuthorsBooks ab INNER JOIN Authors a ON ab.author_ID = a.id 
					 INNER JOIN Books b ON ab.book_ID = b.id 
					 INNER JOIN LiteratureCategory lc ON b.category_ID = lc.id 
					 INNER JOIN BookLanguage bl ON b.language_ID = bl.id 

DROP VIEW BooksDetails 

--Interogations
SELECT * FROM BooksDetails WHERE book_language = 'English';
SELECT isbn, title, name, surname, book_language, price, quantity FROM BooksDetails WHERE category_name = 'Psihologie';


CREATE VIEW MembersDetails 
AS
SELECT m.name, m.surname, m.email, b.title, a.name as author_name, a.surname as author_surname, bl.book_language, lc.category_name, t.book_quantity 
FROM Members m INNER JOIN Transactions t ON m.id = t.member_ID 
				INNER JOIN Books b ON t.book_ID = b.id
				INNER JOIN AuthorsBooks ab ON b.id = ab.book_ID  
				INNER JOIN Authors a ON ab.author_ID = a.id 
				INNER JOIN LiteratureCategory lc ON b.category_ID = lc.id 
				INNER JOIN BookLanguage bl ON b.language_ID = bl.id 

SELECT * FROM MembersDetails WHERE name = 'Popescu';
SELECT * FROM MembersDetails WHERE category_name = 'Psihologie';

------------------------------------------
------------------------------------------
------------------------------------------
--3. Triggers

--create log table
CREATE TABLE logChangesTable
(id INT PRIMARY KEY IDENTITY, 
operation_date DateTime,
operation_type VARCHAR(10),
table_name VARCHAR(10),
number_of_rows_affected INT
);

DROP TABLE logChangesTable 

--create the trigger
CREATE TRIGGER books_trigger
ON Books
AFTER INSERT, UPDATE, DELETE
AS 
BEGIN
	DECLARE @operationType VARCHAR(10), @tableName VARCHAR(10)
	
	--update
	IF EXISTS (SELECT * from inserted) AND EXISTS (SELECT * FROM deleted)
		BEGIN
			SET @operationType = 'Update' 
			SET @tableName = 'Books'
			INSERT INTO logChangesTable (operation_date, operation_type, table_name, number_of_rows_affected) 
			SELECT GETDATE(), @operationType, @tableName, (SELECT COUNT(*) FROM inserted)
			FROM inserted
		END
	
	--insert
	IF EXISTS (SELECT * FROM inserted) AND NOT EXISTS(SELECT * FROM deleted)
		BEGIN
			SET @operationType = 'Insert' 
			SET @tableName = 'Books'
			INSERT INTO logChangesTable (operation_date, operation_type, table_name, number_of_rows_affected) 
			SELECT GETDATE(), @operationType, @tableName, (SELECT COUNT(*) from inserted)
			FROM inserted
		END
	
	--delete
	IF EXISTS (SELECT * FROM deleted) AND NOT EXISTS(SELECT * FROM inserted)
		BEGIN
			SET @operationType = 'Delete' 
			SET @tableName = 'Books'
			INSERT INTO logChangesTable (operation_date, operation_type, table_name, number_of_rows_affected) 
			SELECT GETDATE(), @operationType, @tableName, (SELECT COUNT(*) from deleted)
			FROM deleted
		END
	
	SELECT * FROM logChangesTable 
END

DROP TRIGGER books_trigger 
	
UPDATE Books 
SET quantity = 0
WHERE quantity = 5

INSERT INTO Books (title, published_year, page_number, publishing_house_ID, language_ID, category_ID, quantity, price) VALUES 
('SAS Survival Guide', 2020, 190, 1, 1, 13, 7, 29.00)

INSERT INTO Books (title, published_year, page_number, publishing_house_ID, language_ID, category_ID, quantity, price) VALUES 
('Bucuria de a avea mai putin', 2020, 190, 1, 1, 13, 7, 29.00)

DELETE FROM Books 
WHERE title = 'SAS Survival Guide' or title = 'Bucuria de a avea mai putin'

UPDATE Books 
SET quantity = 5
WHERE quantity = 0


------------------------------------------
------------------------------------------
------------------------------------------
--4. Cursor care sa execute o procedura stocata
	
CREATE PROCEDURE updateBooksPrice (@bookName VARCHAR(50) OUTPUT)
AS 
	BEGIN 
			UPDATE Books 
			SET price = price - (0.1 * price)
			WHERE title = @bookName
	END	
	
DROP PROCEDURE updateBooksPrice
	
DECLARE @bookIsbn BIGINT,
		@bookName VARCHAR(20),
		@transactionByBooks INT,
		@quantity INT,
		@price MONEY
DECLARE cursorForUntradedBooks CURSOR FOR 
		SELECT 		b.isbn, b.title, COUNT(t.book_ID) AS transactionsByBooks, b.quantity, b.price 
		FROM 		Books b LEFT JOIN Transactions t ON b.id = t.book_ID 
		GROUP BY 	b.isbn, b.title, b.quantity, b.price 
		HAVING 		COUNT(t.book_ID) = 0
		ORDER BY 	b.quantity DESC
FOR UPDATE
OPEN cursorForUntradedBooks

FETCH cursorForUntradedBooks INTO @bookIsbn, @bookName, @transactionByBooks, @quantity, @price
WHILE @@FETCH_STATUS = 0
	BEGIN
		PRINT CAST(@bookIsbn AS VARCHAR(13)) + ' ' + @bookName + ' ' + CAST(@price AS VARCHAR(10))
		EXEC updateBooksPrice @bookName
		FETCH cursorForUntradedBooks INTO @bookIsbn, @bookName, @transactionByBooks, @quantity, @price
	END

CLOSE cursorForUntradedBooks
DEALLOCATE cursorForUntradedBooks

