-- завдання 3

ALTER TABLE books ADD author VARCHAR(15);
ALTER TABLE books CHANGE author author VARCHAR(30);
ALTER TABLE DROP COLUMN author;
CREATE INDEX с ON books (code);
DROP INDEX c;

-- Занесення даних

INSERT INTO books (n, code, name, price, edition, pages, format, date, circulation, theme, category) VALUES (2, 5110, 'Апаратні засоби мультимедіа. Відеосистема РС', 15.51, 'Видавнича група BHV', 400, '70х100/16', '2000-07-24', 5000, 'Використання ПК в цілому', 'Підручники');

-- Перевірка книг на новизну

AlTER TABLE books ADD news VARCHAR(3) NULL;
UPDATE books SET news = 'yes' WHERE date >= '2015-01-01';
UPDATE books SET news = 'no' WHERE date < '2015-01-01' OR date IS NULL;

-- Видалення записів

DELETE FROM books; -- видалення усіх записей
DELETE FROM books WHERE id > 2; -- видалення всих записів з умовою
TRUNCATE books; -- правильное видалення
DROP TABLE books;
DROP DATABASE library;

------------------------------------------------------------------------------