-- 1 Вивести статистику: загальна кількість всіх книг, їх вартість, їх середню вартість, мінімальну і максимальну ціну
SELECT COUNT(n) AS 'Кількість всіх книг',SUM(price) AS 'Bартість', AVG(price) AS 'Середня вартість', MIN(price), MAX(price) FROM `books`;
-- 2 Вивести загальну кількість всіх книг без урахування книг з непроставленою ціною
SELECT COUNT(n) AS 'Кількість всіх книг без урахування книг з непроставленою ціною' FROM `books`WHERE price IS NOT NULL OR price > 0; 
-- 3 Вивести статистику (див. 1) для книг новинка / не новинка
SELECT COUNT(n) AS 'Кількість всіх книг',SUM(price) AS 'Bартість', AVG(price) AS 'Середня вартість', MIN(price), MAX(price), news FROM `books` GROUP BY news;
-- 4 Вивести статистику (див. 1) для книг за кожним роком видання
SELECT COUNT(n) AS 'Кількість всіх книг',SUM(price) AS 'Bартість', AVG(price) AS 'Середня вартість', MIN(price), MAX(price), date_format(date,'%Y') FROM `books` GROUP BY date_format(date,'%Y');
-- 5 Змінити п.4, виключивши з статистики книги з ціною від 10 до 20
SELECT COUNT(n) AS 'Кількість всіх книг',SUM(price) AS 'Bартість', AVG(price) AS 'Середня вартість', MIN(price), MAX(price), date_format(date,'%Y') FROM `books` WHERE price NOT BETWEEN 10 AND 20 GROUP BY date_format(date,'%Y');
-- 6 Змінити п.4. Відсортувати статистику по спадаючій кількості.
SELECT COUNT(n) AS 'Кількість всіх книг',SUM(price) AS 'Bартість', AVG(price) AS 'Середня вартість', MIN(price), MAX(price), date_format(date,'%Y') FROM `books` GROUP BY date_format(date,'%Y') SORT BY date_format(date,'%Y') DESK;
-- 7 Вивести загальну кількість кодів книг і кодів книг що не повторюються
SELECT COUNT(DISTINCT cod) AS 'кількість унікальних кодів книг', COUNT(DISTINCT n) AS 'кількість унікальних номерів книг' FROM books;
-- 8 Вивести статистику: загальна кількість і вартість книг по першій букві її назви
SELECT COUNT(n) AS 'Кількість всіх книг',SUM(price) AS 'Bартість', LEFT(name, 1) AS 'Перша буква назви' FROM `books` GROUP BY LEFT(name, 1);
-- 9 Змінити п. 8, виключивши з статистики назви що починаються з англ. букви або з цифри.
SELECT COUNT(n) AS 'Кількість всіх книг',SUM(price) AS 'Bартість', LEFT(name, 1) AS 'Перша буква назви' FROM `books` WHERE name REGEXP '^[А-Я]' GROUP BY LEFT(name, 1);
-- 10 Змінити п. 9 так щоб до складу статистики потрапили дані з роками більшими за 2000.
SELECT COUNT(n) AS 'Кількість всіх книг',SUM(price) AS 'Bартість', LEFT(name, 1) AS 'Перша буква назви' FROM `books` WHERE name REGEXP '^[А-Я]' AND YEAR(date) >= 2000 GROUP BY LEFT(name, 1);
-- 11 Змінити п. 10. Відсортувати статистику по спадаючій перших букв назви.
SELECT COUNT(n) AS 'Кількість всіх книг',SUM(price) AS 'Bартість', LEFT(name, 1) AS 'Перша буква назви' FROM `books` WHERE name REGEXP '^[А-Я]' AND YEAR(date) >= 2000 GROUP BY LEFT(name, 1) DESC;
-- 12 Вивести статистику (див. 1) по кожному місяцю кожного року.
SELECT COUNT(n) AS 'Кількість всіх книг',SUM(price) AS 'Bартість', AVG(price) AS 'Середня вартість', MIN(price), MAX(price), date_format(date,'%m') FROM `books` GROUP BY MONTH(date);
-- 13 Змінити п. 12 так щоб до складу статистики не увійшли дані з незаповненими датами.
SELECT COUNT(n) AS 'Кількість всіх книг',SUM(price) AS 'Bартість', AVG(price) AS 'Середня вартість', MIN(price), MAX(price), date_format(date,'%m') FROM `books` WHERE date IS NOT NULL AND date > 0 GROUP BY MONTH(date);
-- 14 Змінити п. 12. Фільтр по спадаючій року і зростанню місяця.
SELECT COUNT(n) AS 'Кількість всіх книг',SUM(price) AS 'Bартість', AVG(price) AS 'Середня вартість', MIN(price), MAX(price), date_format(date,'%m/%Y') AS 'Місяць/Рік' FROM `books` WHERE date IS NOT NULL AND date > 0 GROUP BY MONTH(date) ASC ORDER BY YEAR(date) DESC;
-- 15 Вивести статистику для книг новинка / не новинка: загальна ціна, загальна ціна в грн. / Євро / руб. Колонкам запиту дати назви за змістом.
SELECT COUNT(n) AS 'Кількість всіх книг',SUM(price) AS 'Bартість', SUM(price*27) AS 'ціна в грн.', SUM(price*0.9) AS 'ціна в євро', SUM(price*10000000) AS 'ціна в руб.', news FROM `books` GROUP BY news;
-- 16 Змінити п. 15 так щоб виводилася округлена до цілого числа (дол. / Грн. / Євро / руб.) Ціна.
SELECT COUNT(n) AS 'Кількість всіх книг',SUM(ROUND(price, -1)) AS 'Bартість', SUM(ROUND(price*27, -1)) AS 'ціна в грн.', SUM(ROUND(price*0.9, -1)) AS 'ціна в євро', SUM(ROUND(price*10000000, -1)) AS 'ціна в руб.', news FROM `books` GROUP BY news;
-- 17 Вивести статистику (див. 1) по видавництвах.
SELECT COUNT(n) AS 'Кількість всіх книг',SUM(price) AS 'Bартість', AVG(price) AS 'Середня вартість', MIN(price), MAX(price), edition FROM `books` GROUP BY edition;
-- 18 Вивести статистику (див. 1) за темами і видавництвами. Фільтр по видавництвам.
SELECT COUNT(n) AS 'Кількість всіх книг',SUM(price) AS 'Bартість', AVG(price) AS 'Середня вартість', MIN(price), MAX(price), theme , edition FROM `books` GROUP BY edition;
-- 19 Вивести статистику (див. 1) за категоріями, темами і видавництвами. Фільтр по видавництвам, темах, категоріям.
SELECT COUNT(n) AS 'Кількість всіх книг',SUM(price) AS 'Bартість', AVG(price) AS 'Середня вартість', MIN(price), MAX(price), category, theme , edition FROM `books` GROUP BY edition, theme, category;
-- 20 Вивести список видавництв, у яких округлена до цілого ціна однієї сторінки більше 10 копійок.
SELECT edition AS 'список видавництв' FROM books WHERE ROUND(price/pages, 1) > 0.1 GROUP BY edition;