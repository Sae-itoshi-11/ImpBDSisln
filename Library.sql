Your MySQL connection id is 10038870
Server version: 8.0.40 Source distribution
Copyright (c) 2000, 2022, Oracle and/or its affiliates.
Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.
Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
  
mysql> CREATE TABLE CATEGORIES (
    ->  ID INT PRIMARY KEY, 
    ->  NAME VARCHAR(50) NOT NULL
    ->  );
Query OK, 0 rows affected (0.03 sec)
mysql> CREATE TABLE AUTHORS (
    ->  ID INT PRIMARY KEY, 
    ->  NAME VARCHAR(50) NOT NULL
    ->  );
Query OK, 0 rows affected (0.02 sec)

mysql> CREATE TABLE BOOKS (
    ->  ID INT PRIMARY KEY AUTO_INCREMENT,
    ->  NAME VARCHAR(50) NOT NULL,
    ->  PRICE INT,
    ->  CATEGORYID INT,
    ->  AUTHORID INT,
    ->  FOREIGN KEY (CATEGORYID) REFERENCES CATEGORIES(ID),
    ->  FOREIGN KEY (AUTHORID) REFERENCES AUTHORS(ID)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> INSERT INTO CATEGORIES VALUES
    ->  (1, 'Cat-A'),
    ->  (2, 'Cat-B'),
    ->  (3, 'Cat-C'),
    ->  (7, 'Cat-D'),
    ->  (8, 'Cat-E'),
    ->  (4, 'Cat-F'),
    ->  (10, 'Cat-G'),
    ->  (12, 'Cat-H'),
    ->  (6, 'Cat-I');
Query OK, 9 rows affected (0.00 sec)
Records: 9  Duplicates: 0  Warnings: 0

mysql> INSERT INTO AUTHORS VALUES
    ->  (1, 'Author-A'),
    ->  (2, 'Author-B'),
    ->  (3, 'Author-C'),
    ->  (10, 'Author-D'),
    ->  (12, 'Author-E');
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0
