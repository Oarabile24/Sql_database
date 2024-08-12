# Sql_database

# Books and Authors Database

**This repository contains the SQL schema and queries for a simple database that tracks books and their authors. The database consists of two tables: `Authors` and `Books`. Below is a description of the tables, their relationships, and the SQL queries used to analyze the data.**

## Database Schema

### Authors Table

**The `Authors` table contains information about the authors. The schema is defined as follows:**

| Column Name  | Data Type | Constraints          | Description                            |
|--------------|-----------|----------------------|----------------------------------------|
| author_id    | INTEGER   | PRIMARY KEY AUTOINCREMENT | Unique identifier for each author      |
| First_name   | TEXT      | NOT NULL             | First name of the author               |
| Last_name    | TEXT      | NOT NULL             | Last name of the author                |
| Nationality  | TEXT      | NOT NULL             | Nationality of the author              |

### Books Table

The `Books` table contains information about the books. The schema is defined as follows:

| Column Name  | Data Type | Constraints          | Description                            |
|--------------|-----------|----------------------|----------------------------------------|
| book_id      | INTEGER   | PRIMARY KEY AUTOINCREMENT | Unique identifier for each book        |
| Title        | TEXT      | NOT NULL             | Title of the book                      |
| Description  | TEXT      | NOT NULL             | Description of the book                |
| author_id    | INTEGER   | NOT NULL, FOREIGN KEY | References the `author_id` in `Authors` table to link the book to an author |

## SQL Queries

### 1. Count the Total Number of Books

**This query counts the total number of books in the `Books` table.**

SELECT count(Title) as booksCounted

FROM Books;

## 2. Count the Number of Books by Each Author
**This query returns the number of books written by each author, ordered by the number of books in descending order. It also limits the results to the author with the most books.**

SELECT A.First_name, A.Last_name, COUNT(B.book_id) AS booksCounted

FROM Authors A

JOIN Books B ON A.author_id = B.author_id

GROUP BY A.author_id, A.First_name, A.Last_name

ORDER BY booksCounted DESC

LIMIT 1;

 ## 3. Count the Number of Books by Nationality
**This query returns the number of books written by authors of each nationality.**

SELECT A.Nationality, COUNT(B.book_id) AS booksCounted

FROM Authors A

JOIN Books B ON A.author_id = B.author_id

GROUP BY A.Nationality;

## How to Use
## 1. Set Up the Database:
**Use the provided SQL schema to create the Authors and Books tables in your database.**

## 2. Insert Data:
**Populate the tables with relevant data about authors and books.**

# 3. Run Queries:
**Execute the provided SQL queries to analyze the data in your database.**

## License
**This project is licensed under the MIT License. See the LICENSE file for details.**


This README file provides a clear overview of your project, including the structure of the database and the purpose of the SQL queries. You can customize the content further based on your specific needs.
