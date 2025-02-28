/* 
Implemetacion de una base de datos relacional en un sistema de informacion
2025/21/02 4-J
Alumno- Jocelyn Abigail Huerta Avilés
Operaciones con Joins
CORREGIDO
*/

CREATE TABLE BOOKS (
 ID INT PRIMARY KEY AUTO_INCREMENT,
 NAME VARCHAR(50) NOT NULL,
 PRICE INT,
 CATEGORYID INT,
 AUTHORID INT,
 FOREIGN KEY (CATEGORYID) REFERENCES CATEGORIES(ID),
 FOREIGN KEY (AUTHORID) REFERENCES AUTHORS(ID)
);

CREATE TABLE CATEGORIES (
 ID INT PRIMARY KEY, 
 NAME VARCHAR(50) NOT NULL
 );

CREATE TABLE AUTHORS (
 ID INT PRIMARY KEY, 
 NAME VARCHAR(50) NOT NULL
 );

INSERT INTO CATEGORIES VALUES
 (1, 'Cat-A'),
 (2, 'Cat-B'),
 (3, 'Cat-C'),
 (4, 'Cat-D'),
 (5, 'Cat-E'),
 (6, 'Cat-F'),
 (7, 'Cat-G'),
 (8, 'Cat-H'),
 (9, 'Cat-I');

INSERT INTO AUTHORS VALUES
 (1, 'Author-A'),
 (2, 'Author-B'),
 (3, 'Author-C'),
 (4, 'Author-D'),
 (5, 'Author-E'),
 (6, 'Author-F'),
 (7, 'Author-G'),
 (8, 'Author-H'),
 (9, 'Author-I');

INSERT INTO BOOKS VALUES
 (DEFAULT,'Book-A', 100, 1, 2),
 (DEFAULT,'Book-B', 200, 2, 2),
 (DEFAULT,'Book-C', 150, 3, 2),
 (DEFAULT,'Book-D', 100, 3, 1),
 (DEFAULT,'Book-E', 200, 3, 1),
 (DEFAULT,'Book-F', 150, 4, 1),
 (DEFAULT,'Book-G', 100, 5, 5),
 (DEFAULT,'Book-H', 200, 5, 6),
 (DEFAULT,'Book-I', 150, 7, 8);
);
---------------------------------------------------------------------------------------------------------------------
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 11422039
Server version: 8.0.40 Source distribution

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use Lynniette$JazminStrawberryTea;
Database changed
mysql> CREATE TABLE CATEGORIES (
    ->  ID INT PRIMARY KEY, 
    ->  NAME VARCHAR(50) NOT NULL
    ->  );

Query OK, 0 rows affected (0.02 sec)
mysql> INSERT INTO CATEGORIES VALUES
    ->  (1, 'Cat-A'),
    ->  (2, 'Cat-B'),
    ->  (3, 'Cat-C'),
    ->  (4, 'Cat-D'),
    ->  (5, 'Cat-E'),
    ->  (6, 'Cat-F'),
    ->  (7, 'Cat-G'),
    ->  (8, 'Cat-H'),
    ->  (9, 'Cat-I');
Query OK, 9 rows affected (0.01 sec)
Records: 9  Duplicates: 0  Warnings: 0

mysql> SELECT * from CATEGORIES;
+----+-------+
| ID | NAME  |
+----+-------+
|  1 | Cat-A |
|  2 | Cat-B |
|  3 | Cat-C |
|  4 | Cat-D |
|  5 | Cat-E |
|  6 | Cat-F |
|  7 | Cat-G |
|  8 | Cat-H |
|  9 | Cat-I |
+----+-------+
9 rows in set (0.00 sec)
mysql> CREATE TABLE AUTHORS (
    ->  ID INT PRIMARY KEY, 
    ->  NAME VARCHAR(50) NOT NULL
    ->  );

Query OK, 0 rows affected (0.02 sec)
mysql> INSERT INTO AUTHORS VALUES
    ->  (1, 'Author-A'),
    ->  (2, 'Author-B'),
    ->  (3, 'Author-C'),
    ->  (4, 'Author-D'),
    ->  (5, 'Author-E'),
    ->  (6, 'Author-F'),
    ->  (7, 'Author-G'),
    ->  (8, 'Author-H'),
    ->  (9, 'Author-I'),
Query OK, 9 rows affected (0.01 sec)
Records: 9  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM AUTHORS;
+----+----------+
| ID | NAME     |
+----+----------+
|  1 | Author-A |
|  2 | Author-B |
|  3 | Author-C |
|  4 | Author-D |
|  5 | Author-E |
|  6 | Author-F |
|  7 | Author-G |
|  8 | Author-H |
|  9 | Author-I |
+----+----------+
9 rows in set (0.00 sec)

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
mysql> INSERT INTO BOOKS VALUES
    ->  (DEFAULT,'Book-A', 100, 1, 2),
    ->  (DEFAULT,'Book-B', 200, 2, 2),
    ->  (DEFAULT,'Book-C', 150, 3, 2),
    ->  (DEFAULT,'Book-D', 100, 3, 1),
    ->  (DEFAULT,'Book-E', 200, 3, 1),
    ->  (DEFAULT,'Book-F', 150, 4, 1),
    ->  (DEFAULT,'Book-G', 100, 5, 5),
    ->  (DEFAULT,'Book-H', 200, 5, 6),
    ->  (DEFAULT,'Book-I', 150, 7, 8);
Query OK, 9 rows affected (0.01 sec)
Records: 9  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM BOOKS;
+----+--------+-------+------------+----------+
| ID | NAME   | PRICE | CATEGORYID | AUTHORID |
+----+--------+-------+------------+----------+
|  1 | Book-A |   100 |          1 |        2 |
|  2 | Book-B |   200 |          2 |        2 |
|  3 | Book-C |   150 |          3 |        2 |
|  4 | Book-D |   100 |          3 |        1 |
|  5 | Book-E |   200 |          3 |        1 |
|  6 | Book-F |   150 |          4 |        1 |
|  7 | Book-G |   100 |          5 |        5 |
|  8 | Book-H |   200 |          5 |        6 |
|  9 | Book-I |   150 |          7 |        8 |
+----+--------+-------+------------+----------+
9 rows in set (0.00 sec)

mysql> SELECT * from BOOKS INNER JOIN AUTHORS ON BOOKS.AUTHORID = AUTHORS.ID;
+----+--------+-------+------------+----------+----+----------+
| ID | NAME   | PRICE | CATEGORYID | AUTHORID | ID | NAME     |
+----+--------+-------+------------+----------+----+----------+
|  1 | Book-A |   100 |          1 |        2 |  2 | Author-B |
|  2 | Book-B |   200 |          2 |        2 |  2 | Author-B |
|  3 | Book-C |   150 |          3 |        2 |  2 | Author-B |
|  4 | Book-D |   100 |          3 |        1 |  1 | Author-A |
|  5 | Book-E |   200 |          3 |        1 |  1 | Author-A |
|  6 | Book-F |   150 |          4 |        1 |  1 | Author-A |
|  7 | Book-G |   100 |          5 |        5 |  5 | Author-E |
|  8 | Book-H |   200 |          5 |        6 |  6 | Author-F |
|  9 | Book-I |   150 |          7 |        8 |  8 | Author-H |
+----+--------+-------+------------+----------+----+----------+
9 rows in set (0.00 sec)

mysql> SELECT * from BOOKS LEFT OUTER JOIN CATEGORIES ON BOOKS.CATEGORYID = CATEGORIES.ID;
+----+--------+-------+------------+----------+------+-------+
| ID | NAME   | PRICE | CATEGORYID | AUTHORID | ID   | NAME  |
+----+--------+-------+------------+----------+------+-------+
|  1 | Book-A |   100 |          1 |        2 |    1 | Cat-A |
|  2 | Book-B |   200 |          2 |        2 |    2 | Cat-B |
|  3 | Book-C |   150 |          3 |        2 |    3 | Cat-C |
|  4 | Book-D |   100 |          3 |        1 |    3 | Cat-C |
|  5 | Book-E |   200 |          3 |        1 |    3 | Cat-C |
|  6 | Book-F |   150 |          4 |        1 |    4 | Cat-D |
|  7 | Book-G |   100 |          5 |        5 |    5 | Cat-E |
|  8 | Book-H |   200 |          5 |        6 |    5 | Cat-E |
|  9 | Book-I |   150 |          7 |        8 |    7 | Cat-G |
+----+--------+-------+------------+----------+------+-------+
9 rows in set (0.00 sec)

mysql> SELECT * from BOOKS RIGHT OUTER JOIN AUTHORS ON BOOKS.AUTHORID = AUTHORS.ID;
+------+--------+-------+------------+----------+----+----------+
| ID   | NAME   | PRICE | CATEGORYID | AUTHORID | ID | NAME     |
+------+--------+-------+------------+----------+----+----------+
|    4 | Book-D |   100 |          3 |        1 |  1 | Author-A |
|    5 | Book-E |   200 |          3 |        1 |  1 | Author-A |
|    6 | Book-F |   150 |          4 |        1 |  1 | Author-A |
|    1 | Book-A |   100 |          1 |        2 |  2 | Author-B |
|    2 | Book-B |   200 |          2 |        2 |  2 | Author-B |
|    3 | Book-C |   150 |          3 |        2 |  2 | Author-B |
| NULL | NULL   |  NULL |       NULL |     NULL |  3 | Author-C |
| NULL | NULL   |  NULL |       NULL |     NULL |  4 | Author-D |
|    7 | Book-G |   100 |          5 |        5 |  5 | Author-E |
|    8 | Book-H |   200 |          5 |        6 |  6 | Author-F |
| NULL | NULL   |  NULL |       NULL |     NULL |  7 | Author-G |
|    9 | Book-I |   150 |          7 |        8 |  8 | Author-H |
| NULL | NULL   |  NULL |       NULL |     NULL |  9 | Author-I |
+------+--------+-------+------------+----------+----+----------+
13 rows in set (0.00 sec)

mysql> SELECT * FROM BOOKS
    -> LEFT JOIN CATEGORIES ON BOOKS.CATEGORYID = CATEGORIES.ID
    -> UNION ALL
    -> SELECT * FROM BOOKS
    -> RIGHT JOIN CATEGORIES ON BOOKS.CATEGORYID = CATEGORIES.ID;
+------+--------+-------+------------+----------+------+-------+
| ID   | NAME   | PRICE | CATEGORYID | AUTHORID | ID   | NAME  |
+------+--------+-------+------------+----------+------+-------+
|    1 | Book-A |   100 |          1 |        2 |    1 | Cat-A |
|    2 | Book-B |   200 |          2 |        2 |    2 | Cat-B |
|    3 | Book-C |   150 |          3 |        2 |    3 | Cat-C |
|    4 | Book-D |   100 |          3 |        1 |    3 | Cat-C |
|    5 | Book-E |   200 |          3 |        1 |    3 | Cat-C |
|    6 | Book-F |   150 |          4 |        1 |    4 | Cat-D |
|    7 | Book-G |   100 |          5 |        5 |    5 | Cat-E |
|    8 | Book-H |   200 |          5 |        6 |    5 | Cat-E |
|    9 | Book-I |   150 |          7 |        8 |    7 | Cat-G |
|    1 | Book-A |   100 |          1 |        2 |    1 | Cat-A |
|    2 | Book-B |   200 |          2 |        2 |    2 | Cat-B |
|    3 | Book-C |   150 |          3 |        2 |    3 | Cat-C |
|    4 | Book-D |   100 |          3 |        1 |    3 | Cat-C |
|    5 | Book-E |   200 |          3 |        1 |    3 | Cat-C |
|    6 | Book-F |   150 |          4 |        1 |    4 | Cat-D |
|    7 | Book-G |   100 |          5 |        5 |    5 | Cat-E |
|    8 | Book-H |   200 |          5 |        6 |    5 | Cat-E |
| NULL | NULL   |  NULL |       NULL |     NULL |    6 | Cat-F |
|    9 | Book-I |   150 |          7 |        8 |    7 | Cat-G |
| NULL | NULL   |  NULL |       NULL |     NULL |    8 | Cat-H |
| NULL | NULL   |  NULL |       NULL |     NULL |    9 | Cat-I |
+------+--------+-------+------------+----------+------+-------+
21 rows in set (0.00 sec)

mysql> SELECT * FROM BOOKS
    -> LEFT JOIN AUTHORS
    -> ON BOOKS.AUTHORID = AUTHORS.ID
    -> WHERE AUTHORS.ID IS NULL;
Empty set (0.00 sec)

mysql> SELECT * FROM BOOKS
    -> RIGHT JOIN CATEGORIES
    -> ON BOOKS.CATEGORYID = CATEGORIES.ID
    -> WHERE CATEGORIES.ID IS NULL;
Empty set (0.00 sec)
