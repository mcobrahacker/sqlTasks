-- 1 Вивести значення наступних колонок: назва книги, ціна, назва видавництва. Використовувати внутрішнє з'єднання, застосовуючи where.
SELECT books.name, topic.theme_name FROM `books`, topic WHERE topic_id = theme_id;
-- 2 Вивести значення наступних колонок: назва книги, назва категорії. Використовувати внутрішнє з'єднання, застосовуючи inner join.
SELECT books.name, topic.theme_name FROM `books` INNER JOIN topic ON topic_id = theme_id;
-- 3 Вивести значення наступних колонок: назва книги, ціна, назва видавництва, формат.
SELECT books.name, books.price, publishers.publisher_name, bookformat.format_name 
FROM `books` 
	INNER JOIN publishers
	INNER JOIN bookformat 
   	ON publisherID = publisher_id AND format_id = form_id;
-- 4 Вивести значення наступних колонок: тема, категорія, назва книги, назва видавництва. Фільтр по темам і категоріям.
SELECT books.name, topic.theme_name, publishers.publisher_name, categories.category_name
FROM `books` 
	INNER JOIN publishers
	INNER JOIN topic
    	INNER JOIN categories
   	ON publisherID = publisher_id AND topic_id = theme_id AND category_id = categ_id
    GROUP BY topic.theme_name, categories.category_name;
-- 5 Вивести книги видавництва 'BHV', видані після 2000 р
SELECT b.name 
FROM books AS b 
	INNER JOIN publishers AS p 
	ON publisherID = publisher_id
WHERE p.publisher_name = 'Видавнича група BHV';
-- 6 Вивести загальну кількість сторінок по кожній назві категорії. Фільтр по спадаючій кількості сторінок.
SELECT SUM(b.pages) AS 'Загальна кількість сторінок', c.category_name AS 'Категорія' 
FROM `books` as b INNER JOIN categories as c 
ON b.category_id = c.categ_id
GROUP BY c.category_name ORDER BY SUM(b.pages) DESC;
-- 7 Вивести середню вартість книг по темі 'Використання ПК' і категорії 'Linux'.
SELECT AVG(b.price) AS 'Середня вартість'
FROM `books` as b 
	INNER JOIN categories as c
    	INNER JOIN topic as t
ON b.category_id = c.categ_id AND b.topic_id = t.theme_id
WHERE c.category_name = 'Linux' OR t.theme_name = 'Використання ПК';
-- 8 Вивести всі дані універсального відношення. Використовувати внутрішнє з'єднання, застосовуючи where.
SELECT * FROM `books` as b, topic as t, categories as c, publishers as p, bookformat as f WHERE b.topic_id = t.theme_id AND b.format_id = f.form_id AND b.category_id = c.categ_id AND b.publisherID = p.publisher_id;
-- 9 Вивести всі дані універсального відношення. Використовувати внутрішнє з'єднання, застосовуючи inner join.
SELECT * FROM `books` 
    INNER JOIN publishers
    INNER JOIN categories
    INNER JOIN topic
    INNER JOIN bookformat
ON publisherID = publisher_id AND category_id = categ_id AND topic_id = theme_id AND format_id = form_id;
-- 10 Вивести всі дані універсального відношення. Використовувати зовнішнє з'єднання, застосовуючи left join / rigth join.
SELECT * FROM `books` 
    LEFT JOIN publishers
    ON publisherID = publisher_id
    LEFT JOIN categories
    ON category_id = categ_id
    LEFT JOIN topic
    ON topic_id = theme_id
    LEFT JOIN bookformat
    ON format_id = form_id;
-- 11 Вивести пари книг, що мають однакову кількість сторінок. Використовувати само об’єднання і аліаси (self join).
SELECT b1.name, b1.pages FROM books as b1 
    INNER JOIN books as b2
    WHERE b1.pages = b2.pages AND b1.name != b2.name
    ORDER BY b1.pages;
-- 12 Вивести тріади книг, що мають однакову ціну. Використовувати самооб'єднання і аліаси (self join).
SELECT b1.name, b1.pages FROM books as b1 
    INNER JOIN books as b2
    INNER JOIN books as b3
    WHERE b1.pages = b2.pages = b3.pages AND b1.name != b2.name != b3.name
    ORDER BY b1.pages;
-- 13 Вивести всі книги категорії 'C ++'. Використовувати підзапити (subquery).
SELECT b.name FROM books as b
	WHERE b.category_id =(SELECT c.categ_id FROM categories as c WHERE c.category_name = 'C&C++');
-- 14 Вивести книги видавництва 'BHV', видані після 2000 р Використовувати підзапити (subquery).
SELECT b.name FROM books as b
	WHERE b.publisherID =(SELECT p.publisher_id FROM publishers as p 
                          WHERE p.publisher_name = 'Видавнича група BHV' AND YEAR(b.date) >= 2000);
-- 15  Вивести список видавництв, у яких розмір книг перевищує 400 сторінок. Використовувати пов'язані підзапити (correlated subquery).
SELECT p.publisher_name FROM publishers as p
	WHERE p.publisher_id IN 
		(SELECT b.publisherID FROM books as b
                          WHERE b.pages >= 400);
-- 16 Вивести список категорій в яких більше 3-х книг. Використовувати пов'язані підзапити (correlated subquery).
SELECT c.category_name FROM categories as c
	WHERE c.categ_id IN 
		(SELECT b.category_id FROM books as b
                          HAVING COUNT(b.name) > 3);
-- 17 Вивести список книг видавництва 'BHV', якщо в списку є хоча б одна книга цього видавництва. Використовувати exists.
SELECT b.name FROM books as b
	WHERE EXISTS (SELECT * FROM publishers as p 
                  WHERE b.publisherID = p.publisher_id 
                  AND p.publisher_name = 'Видавнича група BHV');
-- 18 Вивести список книг видавництва 'BHV', якщо в списку немає жодної книги цього видавництва. Використовувати not exists.
SELECT b.name FROM books as b
	WHERE NOT EXISTS (SELECT * FROM publishers as p 
                  WHERE b.publisherID = p.publisher_id 
                  AND p.publisher_name = 'Видавнича група BHV');
-- 19 Вивести відсортований загальний список назв тем і категорій. Використовувати union.
SELECT c.category_name AS 'Категорії та теми' FROM categories as c
		UNION
SELECT t.theme_name FROM topic as t;
--20 Вивести відсортований в зворотному порядку загальний список перших слів, назв книг і категорій що не повторюються. Використовувати union.
SELECT SUBSTRING(b.name, 1, INSTR(b.name, ' ')-1) AS 'Назва' FROM books as b GROUP by b.name DESC
UNION 
SELECT SUBSTRING(c.category_name, 1, INSTR(c.category_name, ' ')-1) FROM categories as c GROUP by c.category_name DESC;