/******************* In the Library *********************/

/*******************************************************/
/* find the number of availalbe copies of the book (Dracula)      */
/*******************************************************/

/* check total copies of the book */
-- your code

/* current total loans of the book */
-- your code

/* total available books of dracula */
-- your code


/*******************************************************/
/* Add new books to the library                        */
/*******************************************************/
-- your code


/*******************************************************/
/* Check out Books: books(4043822646, 2855934983) whose patron_email(jvaan@wisdompets.com), loandate=2020-08-25, duedate=2020-09-08, loanid=by_your_choice*/
/*******************************************************/
-- your code

/********************************************************/
/* Check books for Due back                             */
/* generate a report of books due back on July 13, 2020 */
/* with patron contact information                      */
/********************************************************/
-- your code

/*******************************************************/
/* Return books to the library (which have barcode=6435968624) and return this book at this date(2020-07-05)                    */
/*******************************************************/
-- your code


/*******************************************************/
/* Encourage Patrons to check out books                */
/* generate a report of showing 10 patrons who have
checked out the fewest books.                          */
/*******************************************************/
-- your code


/*******************************************************/
/* Find books to feature for an event                  
 create a list of books from 1890s that are
 currently available                                    */
/*******************************************************/
-- your code


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
