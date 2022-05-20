CREATE TABLE books(
	n INT NOT NULL,
	name VARCHAR(100) NOT NULL,
	price INT NULL,
	edition VARCHAR(30),
	pages INT NOT NULL,
	format VARCHAR(15),
	circulation INT NOT NULL,
	theme VARCHAR(50) NOT NULL,
	category VARCHAR(20) NOT NULL,
	date DATE NULL,
	code INT NOT NULL,
	PRIMARY KEY(n))