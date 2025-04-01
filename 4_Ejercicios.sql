//*
EJERCICIO 1
*//

mysql> CREATE TABLE FLUJOS (
    ->     FLUJO varchar (20) NOT NULL,
    ->     CASO1 int (1) NOT NULL,
    ->     CASO2 int (1) NOT NULL,
    ->     CASO3 int (1) NOT NULL
    -> );
Query OK, 0 rows affected, 3 warnings (0.02 sec)
    
mysql> INSERT INTO FLUJOS (FLUJO, CASO1, CASO2, CASO3) VALUES 
    -> ('Alta de usuario', 0, 0, 0),
    -> ('Baja de usuario', 0, 1, 1),
    -> ('Nueva Orden', 1, 0, 0),
    -> ('Elimina Orden', 0, 0, 0);
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0
    
mysql> SELECT FLUJO,
    ->     (CASO1 + CASO2 + CASO3) AS Aprovado
    -> FROM FLUJOS
    -> ORDER BY FLUJO;
+-----------------+----------+
| FLUJO           | Aprovado |
+-----------------+----------+
| Alta de usuario |        0 |
| Baja de usuario |        2 |
| Elimina Orden   |        0 |
| Nueva Orden     |        1 |
+-----------------+----------+
4 rows in set (0.00 sec)
    
------------------------------------------------------------

CREATE TABLE LICENCIAS (
    IDEMPLEADO int (4),
    LICENCIA varchar (10) NOT  NULL
);

INSERT INTO LICENCIAS (IDEMPLEADO, LICENCIA) VALUES 
(1001, 'Tipo A'),
(1001, 'Tipo B'),
(1001, 'Tipo C'),
(2002, 'Tipo A'),
(2002, 'Tipo B'),
(2002, 'Tipo C'),
(3003, 'Tipo A'),
(3003, 'Tipo D'),
(4004, 'Tipo A'),
(4004, 'Tipo B'),
(4004, 'Tipo D'),
(5005, 'Tipo A'),
(5005, 'Tipo B'),
(5005, 'Tipo D');

SELECT 
