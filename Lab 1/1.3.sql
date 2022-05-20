-- �������� 3

ALTER TABLE books ADD author VARCHAR(15);
ALTER TABLE books CHANGE author author VARCHAR(30);
ALTER TABLE DROP COLUMN author;
CREATE INDEX � ON books (code);
DROP INDEX c;

-- ��������� �����

INSERT INTO books (n, code, name, price, edition, pages, format, date, circulation, theme, category) VALUES (2, 5110, '������� ������ ����������. ³���������� ��', 15.51, '��������� ����� BHV', 400, '70�100/16', '2000-07-24', 5000, '������������ �� � ������', 'ϳ��������');

-- �������� ���� �� �������

AlTER TABLE books ADD news VARCHAR(3) NULL;
UPDATE books SET news = 'yes' WHERE date >= '2015-01-01';
UPDATE books SET news = 'no' WHERE date < '2015-01-01' OR date IS NULL;

-- ��������� ������

DELETE FROM books; -- ��������� ��� �������
DELETE FROM books WHERE id > 2; -- ��������� ���� ������ � ������
TRUNCATE books; -- ���������� ���������
DROP TABLE books;
DROP DATABASE library;

------------------------------------------------------------------------------