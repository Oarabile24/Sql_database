CREATE TABLE "Authors" (
	"author_id"	INTEGER,
	"First_name"	TEXT NOT NULL,
	"Last_name"	TEXT NOT NULL,
	"Nationality"	TEXT NOT NULL,
	PRIMARY KEY("author_id" AUTOINCREMENT)
);

CREATE TABLE "Books" (
	"book_id"	INTEGER,
	"Title"	TEXT NOT NULL,
	"Description"	TEXT NOT NULL,
	"author_id"	INTEGER NOT NULL,
	PRIMARY KEY("book_id" AUTOINCREMENT),
	FOREIGN KEY("author_id") REFERENCES "Authors"("author_id")
);

--count number of books
SELECT count(Title) as booksCounted
FROM Books;

--COUNT HOW MANY BOOKS AN AUTHOR HAS
SELECT A.First_name, A.Last_name, COUNT(B.book_id) AS booksCounted
FROM Authors A
JOIN Books B ON A.author_id = B.author_id
GROUP BY A.author_id, A.First_name, A.Last_name
ORDER BY booksCounted DESC
LIMIT 1;

--how many books there are according to nationality,
SELECT A.Nationality, COUNT(B.book_id) AS booksCounted
FROM Authors A
JOIN Books B ON A.author_id = B.author_id
GROUP BY A.Nationality