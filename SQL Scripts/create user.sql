CREATE TABLE testdb.bookshelf_user (
id INT NOT NULL AUTO_INCREMENT,
username VARCHAR(45) NOT NULL,
password VARCHAR(45) NOT NULL,
first_name VARCHAR(45),
last_name VARCHAR(45),
email VARCHAR(45),
address VARCHAR(100),
zipcode VARCHAR(45),
PRIMARY KEY (id),
UNIQUE (id),
UNIQUE (username),
UNIQUE (email)
);