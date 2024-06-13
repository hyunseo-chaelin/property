USE propertyDB;

CREATE TABLE member (
    id VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    name VARCHAR(50) NOT NULL,
    gender VARCHAR(4),
    birth VARCHAR(10),
    mail VARCHAR(50),
    phone VARCHAR(20),
    address VARCHAR(90),
    cardType VARCHAR(30),
    cardName VARCHAR(50),
    cardNumber VARCHAR(30),
    cardExpiration VARCHAR(10),
    cvc VARCHAR(10),
    regist_day varchar(50),
    PRIMARY KEY(id)
) DEFAULT CHARSET=utf8;

SELECT id FROM member;

DROP TABLE member;
