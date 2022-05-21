-- 1 Вивести значення наступних колонок: номер, код, новинка, назва, ціна, сторінки
SELECT n, code, news, name, price, pages FROM `books`;
-- 2 Вивести значення всіх колонок
SELECT * FROM `books`;
-- 3 Вивести значення колонок в наступному порядку: код, назва, новинка, сторінки, ціна, номер
SELECT code, name, news, pages, price, n FROM `books`;
-- 4 Вивести значення всіх колонок 10 перших рядків
SELECT * FROM `books` LIMIT 10;
-- 5 Вивести значення всіх колонок 10% перших термін
SELECT * FROM `books` LIMIT 2;
-- 6 Вивести значення колонки код без повторення однакових кодів
SELECT DISTINCT code FROM `books`;
-- 7 Вивести всі книги новинки
SELECT * FROM `books` WHERE news = 'yes';
-- 8 Вивести всі книги новинки з ціною від 20 до 30
SELECT * FROM `books` WHERE news = 'yes' AND price >= 20 AND price <=30;
-- 9 Вивести всі книги новинки з ціною менше 20 і більше 30
SELECT * FROM `books` WHERE news = 'yes' AND (price < 20 OR price >30);
-- 10 Вивести всі книги з кількістю сторінок від 300 до 400 і з ціною більше 20 і менше 30
SELECT * FROM `books` WHERE (pages >=300 AND pages <=400) AND (price < 20 OR price >30);
-- 11 Вивести всі книги видані взимку 2000 року
SELECT * FROM `books` WHERE date >= '2000-01-01' AND date < '2000-03-01';
-- 12 Вивести книги зі значеннями кодів 5110, 5141, 4985, 4241
SELECT * FROM `books` WHERE code IN (5110, 5141, 4985, 4241)
-- 13 Вивести книги видані в 1999, 2001, 2003, 2005 р
SELECT * FROM `books` WHERE date LIKE '1999%' OR date LIKE '2001%' OR date LIKE '2003%' OR date LIKE '2005%';
-- 14 Вивести книги назви яких починаються на літери А-К
SELECT * FROM books WHERE name LIKE '[А-К]%';
-- 15 Вивести книги назви яких починаються на літери "АПП", видані в 2000 році з ціною до 20
SELECT * FROM `books` WHERE name LIKE 'АПП%' AND date LIKE '2000&' AND price < 20;
-- 16 Вивести книги назви яких починаються на літери "АПП", закінчуються на "е", видані в першій половині 2000 року
SELECT * FROM `books` WHERE name LIKE 'АПП%' AND name LIKE '%е' AND date > '2000-01-01' AND date < '2000-06-15';
-- 17 Вивести книги, в назвах яких є слово Microsoft, але немає слова Windows
SELECT * FROM `books` WHERE name LIKE '%Microsoft%' AND name NOT LIKE '%Windows%';
-- 18 Вивести книги, в назвах яких присутня як мінімум одна цифра.
SELECT * FROM `books` WHERE name LIKE '%[0-9]%';
-- 19 Вивести книги, в назвах яких присутні не менше трьох цифр.
SELECT * FROM `books` WHERE name LIKE '%[0-9]%[0-9]%[0-9]%';
-- 20 Вивести книги, в назвах яких присутній рівно п'ять цифр.
SELECT * FROM `books` WHERE name LIKE '%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[^0-9]';