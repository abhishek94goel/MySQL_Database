SELECT REVERSE(UPPER('Why does my cat look at me with such hatred ?'));

SELECT
  REPLACE
  (
  CONCAT('I', ' ', 'like', ' ', 'cats'),
  ' ',
  '-'
  );
  
  SELECT REPLACE(title,' ','->') AS title FROM books;
  
  SELECT author_lname AS forwards, REVERSE(author_lname) AS backwards FROM books;
  
  SELECT UPPER(CONCAT(author_fname, ' ', author_lname)) AS 'full name in CAPS' FROM books;
  
  SELECT CONCAT(title, ' was released in ',released_year) AS blurb FROM books;
  
  SELECT title, CHAR_LENGTH(title) AS 'character count' FROM books;
  
  SELECT CONCAT(SUBSTRING(title,1,10),'...') AS 'Short Title', CONCAT_WS(',',author_lname,author_fname) AS Author,
  		CONCAT(stock_quantity,' in Stock') AS Quantity FROM books;