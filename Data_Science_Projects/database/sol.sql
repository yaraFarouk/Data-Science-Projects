/******************* In the Library *********************/

/*******************************************************/
/* find the number of availalbe copies of the book (Dracula)      */
/*******************************************************/

/* check total copies of the book */
-- your code
select count(*) from books where Title = 'Dracula';
/* current total loans of the book */
-- your code
select count(*) from books as b join loans as l on l.bookid = b.bookid
where b.Title = 'Dracula';
/* total available books of dracula */
-- your code
select (select count(*) from books where Title = 'Dracula')-( select count(*) from books as b join loans as l on l.bookid = b.bookid
where b.Title = 'Dracula') as availbe;

/*******************************************************/
/* Add new books to the library                        */
/*******************************************************/
-- your code
INSERT INTO Books (BookID, Title, Author, Published, BarCode)
VALUES (1234567890, 'New Book Title', 'Author Name', 2025, NULL);


/*******************************************************/
/* Check out Books: books(4043822646, 2855934983) whose patron_email(jvaan@wisdompets.com), loandate=2020-08-25, duedate=2020-09-08, loanid=by_your_choice*/
/*******************************************************/
-- your code
INSERT INTO Loans (LoanID, BookID, PatronID, LoanDate, DueDate)
VALUES (12346789, 10, (SELECT PatronID FROM Patrons WHERE Email = 'jvaan@wisdompets.com'), '2020-08-25', '2020-09-08'),
       (209876675, 12, (SELECT PatronID FROM Patrons WHERE Email = 'jvaan@wisdompets.com'), '2020-08-25', '2020-09-08');

/********************************************************/
/* Check books for Due back                             */
/* generate a report of books due back on July 13, 2020 */
/* with patron contact information                      */
/********************************************************/
-- your code
SELECT b.Title, b.Author, l.DueDate, p.Email, p.FirstName, p.LastName
FROM Loans l
JOIN Books b ON l.BookID = b.BookID
JOIN Patrons p ON l.PatronID = p.PatronID
WHERE l.DueDate = '2020-07-13';
/*******************************************************/
/* Return books to the library (which have barcode=6435968624) and return this book at this date(2020-07-05)                    */
/*******************************************************/
-- your code
DELETE FROM Loans 
WHERE LoanID IN (
    SELECT LoanID 
    FROM (
        SELECT LoanID 
        FROM Loans 
        WHERE BookID = (SELECT BookID FROM Books WHERE Barcode = 6435968624) 
        AND DueDate = '2020-07-05'
    ) AS subquery
);
/*******************************************************/
/* Encourage Patrons to check out books                */
/* generate a report of showing 10 patrons who have
checked out the fewest books.                          */
/*******************************************************/
-- your code
SELECT p.Email, p.FirstName, p.LastName, COUNT(l.LoanID) AS TotalLoans
FROM Patrons p
LEFT JOIN Loans l ON p.PatronID = l.PatronID
GROUP BY p.PatronID
ORDER BY TotalLoans ASC
LIMIT 10;

/*******************************************************/
/* Find books to feature for an event                  
 create a list of books from 1890s that are
 currently available                                    */
/*******************************************************/
-- your code
SELECT Title, Author, Published
FROM Books
WHERE Published BETWEEN 1890 AND 1899
AND BookID NOT IN (SELECT BookID FROM Loans);


/*******************************************************/
/* Book Statistics 
/* create a report to show how many books were 
published each year.                                    */
/*******************************************************/
SELECT Published, COUNT(DISTINCT(Title)) AS TotalNumberOfPublishedBooks FROM Books
GROUP BY Published
ORDER BY TotalNumberOfPublishedBooks DESC;


/*************************************************************/
/* Book Statistics                                           */
/* create a report to show 5 most popular Books to check out */
/*************************************************************/
SELECT b.Title, b.Author, b.Published, COUNT(b.Title) AS TotalTimesOfLoans FROM Books b
JOIN Loans l ON b.BookID = l.BookID
GROUP BY b.Title
ORDER BY 4 DESC
LIMIT 5;
