-- 1 Вивести книги у яких не введена ціна або ціна дорівнює 0
SELECT * FROM `books` WHERE price IS NULL OR price = 0;
-- 2 Вивести книги у яких введена ціна, але не введений тираж
SELECT * FROM `books` WHERE price IS NOT NULL AND (circulation IS NULL OR circulation = 0);
-- 3 Вивести книги, про дату видання яких нічого не відомо.
SELECT * FROM `books` WHERE date IS NULL;
-- 4 Вивести книги, з дня видання яких пройшло не більше року.
SELECT * FROM `books` WHERE date > '2021-04-03';
-- 5 Вивести список книг-новинок, відсортованих за зростанням ціни
SELECT * FROM `books` WHERE news = 'yes' ORDER BY books.price ASC;
-- 6 Вивести список книг з числом сторінок від 300 до 400, відсортованих в зворотному алфавітному порядку назв
SELECT * FROM `books` WHERE pages >=300 AND pages <=400 ORDER BY books.name DESC;
-- 7 Вивести список книг з ціною від 20 до 40, відсортованих за спаданням дати
SELECT * FROM `books` WHERE price >=20 AND price <=40 ORDER BY books.date DESC;
-- 8 Вивести список книг, відсортованих в алфавітному порядку назв і ціною по спадаючій
SELECT CONCAT(' Название: ' ,name,' Цена: ', price) AS 'Информация' FROM `books` ORDER BY books.name ASC;
-- 9 Вивести книги, у яких ціна однієї сторінки < 10 копійок.
SELECT * FROM `books` WHERE price/pages < 0.1;
-- 10 Вивести значення наступних колонок: число символів в назві, перші 20 символів назви великими літерами
Select CHAR_LENGTH(name) AS 'Кількість символів', UCASE(LEFT(name, 20)) AS 'перші 20 символів' FROM books;
-- 11 Вивести значення наступних колонок: перші 10 і останні 10 символів назви прописними буквами, розділені '...'
SELECT CONCAT(LEFT(name, 10), "...", RIGHT(name, 10)) AS 'Белиберда' FROM books;
-- 12 Вивести значення наступних колонок: назва, дата, день, місяць, рік
SELECT name AS 'Назва', date AS 'Дата', date_format(date,'%d') AS 'День', date_format(date,'%m') AS 'Місяць', date_format(date,'%Y') AS 'Рік' FROM `books`;
-- 13 Вивести значення наступних колонок: назва, дата, дата в форматі 'dd / mm / yyyy'
SELECT name AS 'Назва', date AS 'Дата', date_format(date,'%d/%m/%Y') FROM `books`;
-- 14 Вивести значення наступних колонок: код, ціна, ціна в грн., ціна в євро, ціна в руб.
SELECT cod AS 'Код', price AS 'ціна', price*27 AS 'ціна в грн.', price*0.9 AS 'ціна в євро', price*10000000 AS 'ціна в руб.' FROM `books`;
-- 15 Вивести значення наступних колонок: код, ціна, ціна в грн. без копійок, ціна без копійок округлена
SELECT cod AS 'Код', price AS 'ціна', ROUND(price*27, 0) AS 'ціна в грн. без копійок', ROUND(price, -1) AS 'ціна без копійок округлена' FROM `books`;
-- 16 Додати інформацію про нову книгу (всі колонки)
INSERT INTO books (n, code, name, price, edition, pages, format, date, circulation, theme, category) 
	VALUES
	(1001, 9999, 'Математичний аналіз. Частина 2', 5.00, 'Видавництво вища школа', 400, '70х100/16', '2005-05-03', 5000, 'Математика', 'Підручники');
UPDATE books SET news = 'yes' WHERE date >= '2015-01-01';
-- 17 Додати інформацію про нову книгу
UPDATE books SET (n, code, name, price, edition, pages, format, date, circulation, theme, category) IS NOT NULL;
INSERT INTO books (n, code, name, price, edition, pages, format, date, circulation, theme, category) 
	VALUES
	(1001, 9999, 'Математичний аналіз. Частина 2', 5.00, 'Видавництво вища школа', 400, '70х100/16', '2005-05-03', 5000, 'Математика', 'Підручники');
-- 18 Видалити книги, видані до 1990 року
DELETE FROM book WHERE date < '1990-01-01';
-- 19 Проставити поточну дату для тих книг, у яких дата видання відсутня
UPDATE books SET date = '2022-04-06' WHERE date IS NULL
-- 20 Установити ознаку новинка для книг виданих після 2005 року
UPDATE books SET news = 'yes' WHERE date >= '2005-01-01';