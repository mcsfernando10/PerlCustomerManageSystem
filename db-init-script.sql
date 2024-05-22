CREATE TABLE customer (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    phone_number TEXT NOT NULL UNIQUE
);

INSERT INTO customer (name, email, phone_number)
VALUES ('Chinthaka Suren', 'mcsfernando10@gmail.com', '+94717251884');

INSERT INTO customer (name, email, phone_number)
VALUES ('Shan Jayasinghe', 'shan.jayasinghe@gmail.com', '+94717251889');

INSERT INTO customer (name, email, phone_number)
VALUES ('Kavisha Silva', 'kavisha.silva@gmail.com', '+94717251880');

.exit
