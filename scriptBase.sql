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

SELECT * FROM Books;

DROP TABLE IF EXISTS Books;
CREATE TABLE Books(
    idBook INT auto_increment,
    idUser INT NOT NULL,
    bookName VARCHAR(150) NOT NULL,
    isbn VARCHAR(15) NOT NULL,
    fechaCompra DATE NOT NULL,
    author VARCHAR(100),
    status VARCHAR(50),
    coverBookContent MEDIUMBLOB,
    coverBookSize double,
    coverBookType VARCHAR(255),

    PRIMARY KEY (idBook),
    FOREIGN KEY (idUser) REFERENCES Users(idUser)
) ENGINE=INNODB;

SELECT * FROM Books;

DROP TABLE IF EXISTS BookExchange;
CREATE TABLE BookExchange(
    idExchange INT NOT NULL,
    idBookOwner INT NOT NULL,
    idBookReceiver INT NOT NULL,
    idBook INT NOT NULL,
    exchangeDate DATE NOT NULL,

    PRIMARY KEY (idExchange),
    FOREIGN KEY (idBookOwner) REFERENCES Users(idUser),
    FOREIGN KEY (idBookReceiver) REFERENCES Users(idUser),
    FOREIGN KEY (idBook) REFERENCES Books(idBook)
) ENGINE=INNODB;