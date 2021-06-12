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

INSERT INTO Users(name, lastName, birthday, email, password, userType) 
VALUES("Bob","Duncan","1980-06-24","bob@duncan.com",SHA2("123", 224),1);

INSERT INTO Users(name, lastName, birthday, email, password, userType) 
VALUES("PJ","Duncan","1996-06-04","pg@duncan.com",SHA2("123", 224),2);

INSERT INTO Users(name, lastName, birthday, email, password, userType) 
VALUES("Joshua","Bassett","2000-12-22","joshua@basset.com",SHA2("123", 224),3);

INSERT INTO Users(name, lastName, birthday, email, password, userType) 
VALUES("Olivia","Rodrigo","2003-02-20","liv@rodrigo.com",SHA2("123", 224),3);

INSERT INTO Users(name, lastName, birthday, email, password, userType) 
VALUES("Sofia","Wylie","2004-01-07","sofia@wylie.com",SHA2("123", 224),3);


SELECT * FROM Users;

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
    idExchange INT NOT NULL AUTO_INCREMENT,
    idBookOwner INT NOT NULL,
    idBookReceiver INT NOT NULL,
    exchangeDate VARCHAR(25) NOT NULL,

    PRIMARY KEY (idExchange),
    FOREIGN KEY (idBookOwner) REFERENCES Books(idBook),
    FOREIGN KEY (idBookReceiver) REFERENCES Books(idBook)
) ENGINE=INNODB;

-- idUser sesion

INSERT Users (name, lastname, birthday, email, password, userType) VALUES('Hana2', 'Soto', '2016-09-22', 'hana2@hana.com', SHA2('123', 224), 1);
