##  Quick Recap: What You Practiced Today

Below is a summary of all the basic SQL operations you've used:

| Type        | Example Command                      |
|-------------|---------------------------------------|
| Login       | `mysql -uroot -p123456`               |
| Create DB   | `create database library.db;`     |
| Use DB      | `use library.db;`                 |
| Create Table| `create table members (...)`         |
| Insert      | `insert into members ...`            |
| Select      | `select * from books;`             |
| Update      | `update ... set ... where ...`        |
| Delete      | `delete from ... where ...`           |
| Change Pwd  | `update mysql.user ...`               |
| Exit        | `exit;`                               |

✔ These commands form the foundation of most SQL workflows.

## ER Diagram

Here's a ER representation of the Library System:

             +----------------+         +------------------+
             |    members     |         |      books       |
             +----------------+         +------------------+
             | member_id (PK) |         | book_id (PK)     |
             | name           |         | title            |
             | email          |         | author           |
             | join_date      |         | published_year   |
             +----------------+         | genre            |
                                        | available        |
                                        +------------------+

                    \                           /
                     \                         /
                      \                       /
                       \                     /
                        \                   /
                         \                 /
                          v               v

                  +------------------------------+
                  |        borrow_records        |
                  +------------------------------+
                  | record_id (PK)               |
                  | member_id (FK) ─────────────▶ members.member_id
                  | book_id   (FK) ─────────────▶ books.book_id
                  | borrow_date                  |
                  | return_date                  |
                  +------------------------------+
✔ PK means 'PRIMARY KEY' is the identification key for one data
✔ FK means 'FOREIGN KEY' is the identification key for the data in another table

##  Choosing the Right Data Types

Choosing the right column type ensures better performance and storage efficiency.

| Type        | Use Case                                      | Example Value        | Notes                                 |
|-------------|-----------------------------------------------|-----------------------|----------------------------------------|
| `INT`       | Numeric ID, count, year                       | `42`, `2025`          | Use with `AUTO_INCREMENT` for PK       |
| `VARCHAR(n)`| Variable-length strings                       | `'Alice Smith'`       | Choose `n` based on expected length    |
| `TEXT`      | Long text like descriptions                   | `'A long paragraph...'`| Not indexable in MySQL                 |
| `DATE`      | Date only                                     | `'2025-07-10'`        | Use for birthdays, join dates, etc.    |
| `YEAR`      | Only a year                                   | `2024`                | Takes 1 byte, good for published year  |
| `BOOLEAN`   | True/False logic                              | `TRUE`, `FALSE`       | Stored as `TINYINT(1)` in MySQL        |
| `DECIMAL`   | Precise decimals (e.g. money, rating)         | `8.99`, `4.5`         | Use `DECIMAL(5,2)` for money up to 999.99|
| `ENUM`      | Limited fixed options                         | `'male'`, `'female'`  | Good for gender, status, etc.          |

---

###  Example: Column Type Decisions in Our Library System

| Column Name    | Type Used      | Why |
|----------------|----------------|-----|
| `book_id`      | `INT`          | Unique numeric ID, fast indexing |
| `title`        | `VARCHAR(255)` | Book titles vary, up to 255 chars |
| `available`    | `BOOLEAN`      | Only True or False |
| `borrow_date`  | `DATE`         | Only need calendar day |
| `published_year` | `YEAR`       | Just 4-digit year |

