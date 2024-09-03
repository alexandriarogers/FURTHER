1.
SELECT author.id,
       author.first_name,
       author.last_name,
       country.name AS country_name,
       book.title AS book_name,
       book.isbn AS ISBN,
       bookdetails.price,
       bookdetails.discount,
       bookdetails.is_hard_copy
FROM author
JOIN book ON author.id = book.author_id
JOIN bookdetails ON book.id = bookdetails.book_id
JOIN country ON author.country_id = country.id
ORDER BY author.last_name, author.first_name;

2.
SELECT author.id,
       author.first_name,
       author.last_name,
       country.name AS country_name
FROM author
JOIN country ON author.country_id = country.id
WHERE country.code = 'USA';

3.
SELECT author.id,
       author.first_name,
       author.last_name,
       country.name AS country_name,
       COUNT(book.id) AS book_count
FROM author
JOIN book ON author.id = book.author_id
JOIN country ON author.country_id = country.id
GROUP BY author.id, author.first_name, author.last_name, country.name
ORDER BY COUNT(book.id) DESC;

4.
SELECT COUNT(book.id) AS book_count
FROM book
JOIN author ON book.author_id = author.id
JOIN country ON author.country_id = country.id
WHERE country.code = 'USA';

5.
SELECT book.title,
       book.isbn,
       bookdetails.discount,
       bookdetails.price
FROM book
JOIN bookdetails ON book.id = bookdetails.book_id
WHERE bookdetails.discount BETWEEN 20 AND 30
ORDER BY bookdetails.price ASC;

6.
SELECT author.first_name,
       author.last_name,
       COALESCE(MIN(bookdetails.price), -1) AS cheapest_price
FROM author
JOIN book ON author.id = book.author_id
JOIN bookdetails ON book.id = bookdetails.book_id
GROUP BY author.id, author.first_name, author.last_name;
