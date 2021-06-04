-- Nombre de la página : NekoBook Store :v / Kawai Book Store / New Gandhi Store / Sakura Book Store /
CREATE DATABASE proyectoWeb;

USE proyectoWeb;

DROP TABLE IF EXISTS UserType;

CREATE TABLE UserType(
    idType INT auto_increment NOT NULL ,
    type VARCHAR(100) NOT NULL ,

    PRIMARY KEY(idType)
) ENGINE=INNODB;

INSERT INTO UserType VALUES (0, 'Administrator'), (0, 'Supervisor'), (0, 'User');
SELECT * FROM UserType;

DROP TABLE IF EXISTS Users;
CREATE TABLE Users(
    idUser INT auto_increment,
    name VARCHAR(150) NOT NULL,
    lastname VARCHAR(150) NOT NULL,
    birthday DATE NOT NULL,
    email VARCHAR(150) NOT NULL,
    password VARCHAR(224),
    userType INT NOT NULL,

    PRIMARY KEY(idUser),
    FOREIGN KEY (userType) REFERENCES UserType(idType)
) ENGINE=INNODB;

DROP TABLE IF EXISTS Author;
CREATE TABLE Author(
    idAuthor INT auto_increment,
    authorName VARCHAR(150),

    PRIMARY KEY (idAuthor)
) ENGINE=INNODB;

DROP TABLE IF EXISTS Books;
CREATE TABLE Books(
    idBook INT auto_increment,
    bookName VARCHAR(150) NOT NULL,
    isbn VARCHAR(15) NOT NULL,
    fechaCompra DATE NOT NULL,
    idAuthor INT,
    status VARCHAR(50),
    coverBookContent MEDIUMBLOB,
    coverBookSize double,
    coverBookType VARCHAR(255),

    PRIMARY KEY (idBook),
    FOREIGN KEY (idAuthor) REFERENCES Author(idAuthor)
) ENGINE=INNODB;

SELECT * FROM Books;