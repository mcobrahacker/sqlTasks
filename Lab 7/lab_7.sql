-- 1 Вивести значення наступних колонок: назва книги, ціна, назва видавництва, формат.
CREATE PROCEDURE N1()
SELECT books.name, books.price, publishers.publisher_name, bookformat.format_name 
FROM `books` 
	INNER JOIN publishers
	INNER JOIN bookformat 
   	ON publisherID = publisher_id AND format_id = form_id;
CALL N1;
-- 2 Вивести значення наступних колонок: тема, категорія, назва книги, назва видавництва. Фільтр по темам і категоріям.
CREATE PROCEDURE N2()
SELECT books.name, topic.theme_name, publishers.publisher_name, categories.category_name
FROM `books` 
	INNER JOIN publishers
	INNER JOIN topic
    	INNER JOIN categories
   	ON publisherID = publisher_id AND topic_id = theme_id AND category_id = categ_id
    GROUP BY topic.theme_name, categories.category_name;
CALL N2;
-- 3 Вивести книги видавництва 'BHV', видані після 2000 р
CREATE PROCEDURE N3()
SELECT b.name 
FROM books AS b 
	INNER JOIN publishers AS p 
	ON publisherID = publisher_id
WHERE p.publisher_name = 'Видавнича група BHV';
CALL N3;
-- 4 Вивести загальну кількість сторінок по кожній назві категорії. Фільтр по спадаючій / зростанню кількості сторінок.
CREATE PROCEDURE N4()
SELECT SUM(b.pages) AS 'Загальна кількість сторінок', c.category_name AS 'Категорія' 
FROM `books` as b INNER JOIN categories as c 
ON b.category_id = c.categ_id
GROUP BY c.category_name ORDER BY SUM(b.pages) DESC;
CALL N4;
-- 5 Вивести середню вартість книг по темі 'Використання ПК' і категорії 'Linux'.
CREATE PROCEDURE N5(OUT categ_price FLOAT(10), OUT topic_price FLOAT(10))
BEGIN
SET categ_price = 
	(SELECT AVG(b.price) FROM books as b INNER JOIN categories as c ON b.category_id = c.categ_id 
     WHERE c.category_name = 'Linux');
SET topic_price = 
	(SELECT  AVG(b.price) FROM books as b INNER JOIN topic as t ON b.topic_id = t.theme_id 
     WHERE t.theme_name = 'Використання ПК в цілому');
END
CALL N5(@categ_price, @topic_price);
SELECT @categ_price, @topic_price;

-- 6 Вивести всі дані універсального відношення.
CREATE PROCEDURE N6()
SELECT * FROM `books` as b, topic as t, categories as c, publishers as p, bookformat as f WHERE b.topic_id = t.theme_id AND b.format_id = f.form_id AND b.category_id = c.categ_id AND b.publisherID = p.publisher_id;
CALL N6;
-- 7 Вивести пари книг, що мають однакову кількість сторінок.
CREATE PROCEDURE N7()
SELECT b1.name, b1.pages FROM books as b1 
    INNER JOIN books as b2
    WHERE b1.pages = b2.pages AND b1.name != b2.name
    ORDER BY b1.pages;
CALL N7;
-- 8 Вивести тріади книг, що мають однакову ціну.
CREATE PROCEDURE N8()
SELECT b1.name, b1.pages FROM books as b1 
    INNER JOIN books as b2
    INNER JOIN books as b3
    WHERE b1.pages = b2.pages = b3.pages AND b1.name != b2.name != b3.name
    ORDER BY b1.pages;
CALL N8;
-- 9 Вивести всі книги категорії 'C ++'.
CREATE PROCEDURE N9(IN categ_Name VARCHAR(60))
SELECT b.n, b.cod, b.name, b.pages, b.price, b.circulation, c.category_name FROM books as b
	INNER JOIN categories as c ON b.category_id = c.categ_id WHERE c.category_name LIKE categ_name;
CALL N9('%C++%');
-- 10 Вивести список видавництв, у яких розмір книг перевищує 400 сторінок.
CREATE PROCEDURE N10(IN page INT(10))
SELECT b.pages, p.publisher_name FROM books as b
	INNER JOIN publishers as p ON b.publisherID = p.publisher_id WHERE b.pages > page;
CALL N10(400);
-- 11 Вивести список категорій за якими більше 3-х книг.
CREATE PROCEDURE N11()
SELECT c.category_name FROM categories as c
	WHERE c.categ_id IN 
		(SELECT b.category_id FROM books as b
                          HAVING COUNT(b.name) > 3);
CALL N11;
-- 12 Вивести список книг видавництва 'BHV', якщо в списку є хоча б одна книга цього видавництва.
CREATE PROCEDURE N12()
SELECT b.name FROM books as b
	WHERE EXISTS (SELECT * FROM publishers as p 
                  WHERE b.publisherID = p.publisher_id 
                  AND p.publisher_name = 'Видавнича група BHV');
CALL N12();
-- 13 Вивести список книг видавництва 'BHV', якщо в списку немає жодної книги цього видавництва.
CREATE PROCEDURE N13()
SELECT b.name FROM books as b
	WHERE NOT EXISTS (SELECT * FROM publishers as p 
                  WHERE b.publisherID = p.publisher_id 
                  AND p.publisher_name = 'Видавнича група BHV');
CALL N13;
-- 14 Вивести відсортоване загальний список назв тем і категорій.
CREATE PROCEDURE N14() 
SELECT c.category_name AS 'Категорії та теми' FROM categories as c GROUP by c.category_name 
UNION 
SELECT t.theme_name FROM topic as t GROUP by t.theme_name;
CALL N14;
-- 15 Вивести відсортований в зворотному порядку загальний список перших слів назв книг і категорій що не повторюються
CREATE PROCEDURE N15()
SELECT SUBSTRING(b.name, 1, INSTR(b.name, ' ')-1) AS 'Назва' FROM books as b GROUP by b.name DESC
UNION 
SELECT SUBSTRING(c.category_name, 1, INSTR(c.category_name, ' ')-1) FROM categories as c GROUP by c.category_name DESC;
CALL N15;