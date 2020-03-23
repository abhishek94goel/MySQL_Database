SELECT COUNT(DISTINCT title) FROM books;

SELECT COUNT(*) FROM books;

SELECT released_year, COUNT(*) AS 'Number of Books Released'FROM books GROUP BY released_year;

SELECT SUM(stock_quantity) AS 'Number of Books in Stock' FROM books;

SELECT author_fname, author_lname, AVG(released_year) FROM books GROUP BY author_fname, author_lname;

SELECT author_fname, author_lname, pages FROM books WHERE pages = (SELECT MAX(pages) FROM books);

SELECT author_fname, author_lname, pages FROM books ORDER BY pages DESC LIMIT 1;

SELECT released_year AS 'year', COUNT(*) AS '# Books', AVG(pages) AS 'average pages'
FROM books
GROUP BY released_year;