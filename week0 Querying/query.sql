<slide 16 - sqlite3 file.db>
-- Uses longlist.db
-- sqlite3 longlist.db


<slide 18 - SELECT>
-- Select all columns from "longlist" table
SELECT * FROM "longlist";

-- Select "title" column from "longlist" table
SELECT "title" FROM "longlist";

-- Select "title" and "author" column from "longlist" table
SELECT "title", "author" FROM "longlist";

-- Select "title", "author", and "translator" column from "longlist" table
SELECT "title", "author", "translator" FROM "longlist";


<slide 19 - LIMIT>
-- Limit results to first 3
SELECT "title", "author" FROM "longlist" LIMIT 3;

-- Limit results to first 10
SELECT "title", "author" FROM "longlist" LIMIT 10;


<slide 20 to 22 - WHERE>
-- Select all books nominated in 2023
SELECT "title", "author" FROM "longlist" WHERE "year" = 2023;

-- Prove selected only books nominated in 2023
SELECT "title", "year" FROM "longlist" WHERE "year" = 2023;

-- Select all books by Fernanda Melchor
SELECT "title", "author" FROM "longlist" WHERE "author" = 'Fernanda Melchor';

-- Select all books not released in hardcover format
SELECT "title", "format" FROM "longlist" WHERE "format" != 'hardcover';

-- Select all books not released in hardcover format
SELECT "title", "format" FROM "longlist" WHERE "format" <> 'hardcover';

-- Select all books not released in hardcover format
SELECT "title", "format" FROM "longlist" WHERE NOT "format" = 'hardcover';


<slide 27 - NULL>
-- Books without a translator
SELECT "title", "translator" FROM "longlist" WHERE "translator" IS NULL;

-- Books with a translator
SELECT "title", "translator" FROM "longlist" WHERE "translator" IS NOT NULL;


<slide 29 - LIKE>
-- Find all books with "love" in the title
SELECT "title" FROM "longlist" WHERE "title" LIKE '%love%';

-- Find all books that begin with "The" (includes "There", etc.)
SELECT "title" FROM "longlist" WHERE "title" LIKE 'The%';

-- Find all books that begin with "The"
SELECT "title" FROM "longlist" WHERE "title" LIKE 'The %';

-- Find a book whose title unsure how to spell
SELECT "title" FROM "longlist" WHERE "title" LIKE 'P_re';


<slide 31 - Compound>
-- Find titles from 2022 or 2023
SELECT "title", "year" FROM "longlist" WHERE "year" = 2022 OR "year" = 2023;

-- Find hardcover books from 2022 and 2023
SELECT "title", "year" FROM "longlist" WHERE ("year" = 2022 OR "year" = 2023) AND "format" = 'hardcover';

-- Find books between 2019 and 2022
-- Using many ORs
SELECT "title", "year" FROM "longlist" 
WHERE "year" = 2019 OR "year" = 2020 OR "year" = 2021 OR "year" = 2022;


<slide 32 - Range>
-- Rewrite prior query with a range condition
SELECT "title", "year" FROM "longlist" WHERE "year" >= 2019 AND "year" <= 2022;

-- Rewrite with a BETWEEN condition
SELECT "title", "year" FROM "longlist" WHERE "year" BETWEEN 2019 AND 2022;

-- Select books with a rating above 4.0
SELECT "title", "rating" FROM "longlist" WHERE "rating" > 4.0;

-- Select books with a rating above 4.0 and at least 1000 votes
SELECT "title", "rating" FROM "longlist" WHERE "rating" > 4.0 AND "votes" > 1000;

-- Select books with fewer than 300 pages
SELECT "title", "pages" FROM "longlist" WHERE "pages" < 300;


<slide 33 - BETWEEN>
-- Look at examples of dates
SELECT "title", "published" FROM "longlist";

-- Books published in the summer of 2022 (for the northern hemisphere)
SELECT "title", "published" FROM "longlist" WHERE "published" BETWEEN date('2022-05-01') AND date('2022-08-01');


<slide 34 - ORDER BY>
-- Top 10 books by rating (incorrectly)
SELECT "title", "rating" FROM "longlist" ORDER BY "rating" LIMIT 10;

-- Top 10 books by rating (correctly)
SELECT "title", "rating" FROM "longlist" ORDER BY "rating" DESC LIMIT 10;

-- Ordering by more than one column
SELECT "title", "rating", "votes" FROM "longlist" 
ORDER BY "rating" DESC, "votes" DESC
LIMIT 10;

-- Ordering with a condition
SELECT "title", "rating" FROM "longlist" 
WHERE "votes" > 10000 ORDER BY "rating" DESC 
LIMIT 10;


<slide 36 - Basic function>
-- Find the average rating of all longlisted books
SELECT AVG("rating") FROM "longlist";

-- Find maximum rating
SELECT MAX("rating") FROM "longlist";

-- Find minimum rating
SELECT MIN("rating") FROM "longlist";

-- Find total number of votes
SELECT SUM("votes") FROM "longlist";

-- Find total number of books
SELECT COUNT(*) FROM "longlist";

-- Find total number of translators
SELECT COUNT("translator") FROM "longlist";

-- Incorrectly count publishers
SELECT COUNT("publisher") FROM "longlist";


<slide 37 - Basic function>
-- Round the result
SELECT ROUND(AVG("rating"), 2) FROM "longlist";

-- Rename column with AS
SELECT ROUND(AVG("rating"), 2) AS "Average Rating" FROM "longlist";


<slide 38 - Uniqu>
-- Correctly count publishers
SELECT COUNT(DISTINCT "publisher") FROM "longlist";