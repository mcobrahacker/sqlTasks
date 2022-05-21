-- 2 Створення таблиць бази даних. Команди для створення таблиці повинні містити головний ключ, обмеження типу null / not null, default, check, створення зв'язків з умовами посилальної цілісності

CREATE TABLE bookformat( 
	format_id SMALLINT NOT NULL, 
	format_name VARCHAR(15) NOT NULL);

CREATE TABLE topic( 
	theme_id SMALLINT NOT NULL, 
	theme_name VARCHAR(30) NOT NULL);

CREATE TABLE categories( 
	category_id SMALLINT NOT NULL, 
	category_name VARCHAR(30) NOT NULL);

CREATE TABLE publishers( 
	publisher_id SMALLINT NOT NULL, 
	publisher_name VARCHAR(30) NOT NULL);

SELECT format FROM books GROUP BY format;

INSERT INTO bookformat (format_id, format_name) 
	VALUES
    (1, '60х84/16'),
    (2, '60х88/16'),
    (3, '60х90/16'),
    (4, '70х100/16'),
    (5, '84х108/16');

SELECT category FROM books GROUP BY category;

INSERT INTO categories (category_id, category_name) 
	VALUES
    (1, 'Підручники'),
    (2, 'Захист і безпека ПК'),
    (3, 'Апаратні засоби ПК'),
    (4, 'Інші операційні системи'),
    (5, 'Інші книги'),
    (6, 'C&C++'),
    (7, 'Linux'),
    (8, 'SQL'),
    (9, 'Unix'),
    (10, 'Windows 2000');

SELECT edition FROM `books` GROUP BY edition;

INSERT INTO publishers (publisher_id, publisher_name) 
	VALUES
    (1, 'DiaSoft'),
    (2, 'Вільямс'),
    (3, 'Вінниця: ВДТУ'),
    (4, 'Видавнича група BHV'),
    (5, 'ДМК'),
    (6, 'Києво-Могилянська академія'),
    (7, 'МикроАрт'),
    (8, 'Триумф'),
    (9, 'Університет "Україна"'),
    (10, 'Эком');

SELECT theme FROM `books` GROUP BY theme;

INSERT INTO topic (theme_id, theme_name) 
	VALUES
    (1, 'Використання ПК в цілому'),
    (2, 'Операційні системи'),
    (3, 'Програмування');

UPDATE books SET theme = 1 WHERE theme = 'Використання ПК в цілому';
UPDATE books SET theme = 2 WHERE theme = 'Операційні системи';
UPDATE books SET theme = 3 WHERE theme = 'Програмування';
ALTER TABLE books CHANGE theme topic_id SMALLINT NOT NULL;

UPDATE books SET edition = 1 WHERE edition = 'DiaSoft';
UPDATE books SET edition = 2 WHERE edition = 'Вільямс';
UPDATE books SET edition = 3 WHERE edition = 'Вінниця: ВДТУ';
UPDATE books SET edition = 4 WHERE edition = 'Видавнича група BHV';
UPDATE books SET edition = 5 WHERE edition = 'ДМК';
UPDATE books SET edition = 6 WHERE edition = 'Києво-Могилянська академія';
UPDATE books SET edition = 7 WHERE edition = 'МикроАрт';
UPDATE books SET edition = 8 WHERE edition = 'Триумф';
UPDATE books SET edition = 9 WHERE edition = 'Університет "Україна"';
UPDATE books SET edition = 10 WHERE edition = 'Эком';
ALTER TABLE books CHANGE edition publisher_id SMALLINT NOT NULL;


UPDATE books SET format = 1 WHERE format = '60х84/16';
UPDATE books SET format = 2 WHERE format = '60х88/16';
UPDATE books SET format = 3 WHERE format = '60х90/16';
UPDATE books SET format = 4 WHERE format = '70х100/16';
UPDATE books SET format = 5 WHERE format = '84х108/16';
ALTER TABLE books CHANGE format format_id SMALLINT NOT NULL;

ALTER TABLE categories ADD PRIMARY KEY (category_id);
ALTER TABLE categories CHANGE category_id categ_id SMALLINT NOT NULL AUTO_INCREMENT FIRST;

ALTER TABLE bookformat ADD PRIMARY KEY (format_id);
ALTER TABLE bookformat CHANGE format_id form_id SMALLINT NOT NULL AUTO_INCREMENT FIRST;

ALTER TABLE publishers ADD PRIMARY KEY (publisher_id);
ALTER TABLE publishers CHANGE publisher_id publisher_id SMALLINT NOT NULL AUTO_INCREMENT FIRST;

ALTER TABLE topic ADD PRIMARY KEY (theme_id);
ALTER TABLE topic CHANGE theme_id theme_id SMALLINT NOT NULL AUTO_INCREMENT FIRST;

ALTER TABLE `books` ADD FOREIGN KEY (`category_id`) REFERENCES `categories`(`categ_id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `books` ADD FOREIGN KEY (`format_id`) REFERENCES `bookformat`(`form_id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `books` ADD FOREIGN KEY (`publisher_id`) REFERENCES `publishers`(`publisher_id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `books` ADD FOREIGN KEY (`topic_id`) REFERENCES `topic`(`theme_id`) ON DELETE CASCADE ON UPDATE CASCADE;