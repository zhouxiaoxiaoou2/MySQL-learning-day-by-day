INSERT INTO books (title, author, published_year, genre) VALUES
('1984', 'George Orwell', 1949, 'Dystopian'),
('Pride and Prejudice', 'Jane Austen', 1813, 'Romance'),
('The Catcher in the Rye', 'J.D. Salinger', 1951, 'Fiction');

INSERT INTO members (name, email) VALUES
('Alice Smith', 'alice@example.com'),
('Bob Johnson', 'bob@example.com');

INSERT INTO borrow_records (member_id, book_id, borrow_date) VALUES
(1, 2, '2025-07-10'),
(2, 1, '2025-07-09');
