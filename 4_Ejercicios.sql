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
//*
    EJERCICIO 2
*//

Query OK, 0 rows affected (0.03 sec)
mysql> CREATE TABLE LICENCIAS (
    ->     IDEMPLEADO int (4),
    ->     LICENCIA varchar (10) NOT  NULL
    -> );
Query OK, 0 rows affected, 1 warning (0.04 sec)

mysql> INSERT INTO LICENCIAS (IDEMPLEADO, LICENCIA) VALUES 
    -> (1001, 'Tipo A'),
    -> (1001, 'Tipo B'),
    -> (1001, 'Tipo C'),
    -> (2002, 'Tipo A'),
    -> (2002, 'Tipo B'),
    -> (2002, 'Tipo C'),
    -> (3003, 'Tipo A'),
    -> (3003, 'Tipo D'),
    -> (4004, 'Tipo A'),
    -> (4004, 'Tipo B'),
    -> (4004, 'Tipo D'),
    -> (5005, 'Tipo A'),
    -> (5005, 'Tipo B'),
    -> (5005, 'Tipo D');
Query OK, 14 rows affected (0.01 sec)
Records: 14  Duplicates: 0  Warnings: 0
    
mysql> SELECT l1.IDEMPLEADO AS Id_empleado, 
    ->        l2.IDEMPLEADO AS Id_empleado, 
    ->        COUNT(*) AS Coincidencias
    -> FROM LICENCIAS l1
    -> JOIN LICENCIAS l2 
    ->     ON l1.LICENCIA = l2.LICENCIA 
    ->     AND l1.IDEMPLEADO != l2.IDEMPLEADO
    -> GROUP BY l1.IDEMPLEADO, l2.IDEMPLEADO
    -> HAVING COUNT(*) = (SELECT COUNT(*) FROM LICENCIAS WHERE IDEMPLEADO = l1.IDEMPLEADO)
    -> AND COUNT(*) = (SELECT COUNT(*) FROM LICENCIAS WHERE IDEMPLEADO = l2.IDEMPLEADO);
+-------------+-------------+---------------+
| Id_empleado | Id_empleado | Coincidencias |
+-------------+-------------+---------------+
|        2002 |        1001 |             3 |
|        1001 |        2002 |             3 |
|        5005 |        4004 |             3 |
|        4004 |        5005 |             3 |
+-------------+-------------+---------------+
4 rows in set (0.01 sec)

---------------------------------------------------------------------------------------------------
//*
    EJERCICIO 3
*//
    
mysql> CREATE TABLE ENTERO (
    ->     num int (2)
    -> );
Query OK, 0 rows affected, 1 warning (0.07 sec)

mysql> INSERT INTO ENTERO (num) VALUES 
    -> (5),
    -> (6),
    -> (10),
    -> (10),
    -> (13),
    -> (14),
    -> (17),
    -> (20),
    -> (81),
    -> (90),
    -> (76);
Query OK, 11 rows affected (0.01 sec)
Records: 11  Duplicates: 0  Warnings: 0

mysql> WITH ORDENADO AS (
    ->     SELECT 
    ->         num,
    ->         ROW_NUMBER() OVER (ORDER BY num) AS row_num,
    ->         COUNT(*) OVER () AS total_count
    ->     FROM ENTERO
    -> ),
    -> Moda AS (
    ->     SELECT 
    ->         num,
    ->         COUNT(*) AS Frecuencia
    ->     FROM ENTERO
    ->     GROUP BY num
    ->     ORDER BY Frecuencia DESC
    ->     LIMIT 1
    -> )
    -> SELECT 
    ->     (SELECT AVG(num) FROM ENTERO) AS Media,
    ->     (SELECT num FROM ORDENADO WHERE row_num = FLOOR((total_count + 1) / 2)) AS Mediana,
    ->     (SELECT num FROM Moda) AS Moda,
    ->     (SELECT MAX(num) - MIN(num) FROM ENTERO) AS Rango;
+---------+---------+------+-------+
| Media   | Mediana | Moda | Rango |
+---------+---------+------+-------+
| 31.0909 |      14 |   10 |    85 |
+---------+---------+------+-------+
1 row in set (0.00 sec)
