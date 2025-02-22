Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 7828505
Server version: 8.0.40 Source distribution

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show tables
    -> show tables;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'show tables' at line 2
mysql> show tables;
+-----------------------------+
| Tables_in_Lynniette$default |
+-----------------------------+
| detalle_horario             |
| gamescores                  |
| hockeygame                  |
| hockeyteam                  |
| hockeyteamplayer            |
| horario                     |
| plantilla_detalle_horario   |
| playoffround                |
| roundstats                  |
| user                        |
| userinfo                    |
| userscorepicks              |
| userstatspicks              |
| usuarios                    |
+-----------------------------+
14 rows in set (0.00 sec)

mysql> DESC gamescores;
+--------------+------+------+-----+---------+-------+
| Field        | Type | Null | Key | Default | Extra |
+--------------+------+------+-----+---------+-------+
| id           | int  | NO   | PRI | NULL    |       |
| team1IdScore | int  | NO   |     | NULL    |       |
| team2IdScore | int  | NO   |     | NULL    |       |
+--------------+------+------+-----+---------+-------+
3 rows in set (0.01 sec)
mysql> INSERT into gamescores (id, team1IdScore, team2IdScore) values (1, 1, 2);
Query OK, 1 row affected (0.00 sec)
mysql> SELECT * from gamescores;
+----+--------------+--------------+
| id | team1IdScore | team2IdScore |
+----+--------------+--------------+
|  1 |            1 |            2 |
+----+--------------+--------------+
1 row in set (0.00 sec)
mysql> DESC hockeygame;
+-------------+------+------+-----+---------+-------+
| Field       | Type | Null | Key | Default | Extra |
+-------------+------+------+-----+---------+-------+
| id          | int  | NO   | PRI | NULL    |       |
| roundld     | int  | NO   |     | NULL    |       |
| description | text | YES  |     | NULL    |       |
| startTime   | date | NO   | PRI | NULL    |       |
| team1Id     | int  | NO   |     | NULL    |       |
| team2Id     | int  | NO   |     | NULL    |       |
+-------------+------+------+-----+---------+-------+
6 rows in set (0.00 sec)

mysql> ALTER TABLE hockeygame rename column roundld to roundId;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> INSERT into hockeygame (id, roundId, description, startTime, team1Id, team2Id) values (1, 1,'VANCOUVER -- Brock Boeser scored the go-ahead power-play goal at 8:56 of the third pe
riod for the Vancouver Canucks in a 2-1 win against...', '2025/02/08', 1, 2);
Query OK, 1 row affected, 1 warning (0.01 sec)

mysql> DESC hockeyteam;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | int         | NO   | PRI | NULL    |       |
| name  | varchar(27) | NO   |     | NULL    |       |
| logo  | varchar(10) | NO   |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)
mysql> INSERT into hockeyteam (id, name, logo) values ( 1, Vancouver Canucks, Canucks);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Canucks, Canucks)' at line 1
mysql> INSERT into hockeyteam (id, name, logo) values ( 1, 'Vancouver Canucks', 'Canucks');
Query OK, 1 row affected (0.01 sec)

mysql> DESC hockeyteamplayer;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| id           | int         | NO   | PRI | NULL    |       |
| hockeyTeamId | int         | NO   |     | NULL    |       |
| firstName    | varchar(20) | NO   |     | NULL    |       |
| lastName     | varchar(25) | NO   |     | NULL    |       |
| jerseyNum    | int         | NO   |     | NULL    |       |
| position     | varchar(30) | NO   |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)
mysql> INSERT into hockeyteamplayer (id, hockeyTeamId, firstName, lastName,jerseyNum, position) values (1, 2, 'Conor', 'Garland', 8, 'Forward');
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * from hockeyteamplayer;
+----+--------------+-----------+----------+-----------+----------+
| id | hockeyTeamId | firstName | lastName | jerseyNum | position |
+----+--------------+-----------+----------+-----------+----------+
|  1 |            2 | Conor     | Garland  |         8 | Forward  |
+----+--------------+-----------+----------+-----------+----------+
1 row in set (0.01 sec)

mysql> DESC playoffround;
+-----------+------+------+-----+---------+-------+
| Field     | Type | Null | Key | Default | Extra |
+-----------+------+------+-----+---------+-------+
| id        | int  | NO   | PRI | NULL    |       |
| team1Id   | int  | NO   |     | NULL    |       |
| team2Id   | int  | NO   |     | NULL    |       |
| startTime | date | NO   | PRI | NULL    |       |
| endTime   | date | NO   |     | NULL    |       |
| roundNum  | int  | NO   |     | NULL    |       |
+-----------+------+------+-----+---------+-------+
6 rows in set (0.00 sec)
mysql> ALTER TABLE playoffround MODIFY startTime timestamp;
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESC playoffround;
+-----------+-----------+------+-----+---------+-------+
| Field     | Type      | Null | Key | Default | Extra |
+-----------+-----------+------+-----+---------+-------+
| id        | int       | NO   | PRI | NULL    |       |
| team1Id   | int       | NO   |     | NULL    |       |
| team2Id   | int       | NO   |     | NULL    |       |
| startTime | timestamp | NO   | PRI | NULL    |       |
| endTime   | date      | NO   |     | NULL    |       |
| roundNum  | int       | NO   |     | NULL    |       |
+-----------+-----------+------+-----+---------+-------+
6 rows in set (0.01 sec)
mysql> ALTER TABLE playoffround MODIFY endTime timestamp;
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESC playoffround;
+-----------+-----------+------+-----+---------+-------+
| Field     | Type      | Null | Key | Default | Extra |
+-----------+-----------+------+-----+---------+-------+
| id        | int       | NO   | PRI | NULL    |       |
| team1Id   | int       | NO   |     | NULL    |       |
| team2Id   | int       | NO   |     | NULL    |       |
| startTime | timestamp | NO   | PRI | NULL    |       |
| endTime   | timestamp | YES  |     | NULL    |       |
| roundNum  | int       | NO   |     | NULL    |       |
+-----------+-----------+------+-----+---------+-------+
6 rows in set (0.00 sec)
mysql> INSERT into playoffround (id, team1Id, team2Id, startTime, endTime, roundNum) values (1, 1, 2, '2025/02/08 19:00:00', '2025/02/08 2
1:00:00', 3);
Query OK, 1 row affected, 2 warnings (0.01 sec)

mysql> DESC roundstats;
+---------------------+-------------+------+-----+---------+-------+
| Field               | Type        | Null | Key | Default | Extra |
+---------------------+-------------+------+-----+---------+-------+
| id                  | int         | NO   | PRI | NULL    |       |
| numShutouts         | int         | NO   |     | NULL    |       |
| goalLeaderId        | varchar(16) | NO   |     | NULL    |       |
| assistLeaderId      | varchar(16) | NO   |     | NULL    |       |
| penaltyLeaderId     | varchar(16) | NO   |     | NULL    |       |
| plusMinusId         | int         | NO   |     | NULL    |       |
| faceOffsWonLeaderId | int         | NO   |     | NULL    |       |
| sogLeaderId         | int         | NO   |     | NULL    |       |
+---------------------+-------------+------+-----+---------+-------+
8 rows in set (0.00 sec)
mysql> ALTER TABLE faceOffsWonLeaderId MODIFY endTime varchar(16);
ERROR 1146 (42S02): Table 'Lynniette$default.faceOffsWonLeaderId' doesn't exist

mysql> ALTER TABLE roundstats MODIFY faceOffsWonLeaderId varchar(16);
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE roundstats MODIFY sogLeaderId varchar(16);
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> INSERT into roundstats (id, numShutouts, goalLeaderId, assistLeaderId, penaltyLeaderId, plusMinusId, faceOffsWonLeaderId, sogLeader
Id) values (1, 10, 'Canucks', 'Canucks', 'Canucks', 4, 'Canucks', 'Canucks');
Query OK, 1 row affected (0.00 sec)

mysql> SLELECT * from roundstats;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syn
tax to use near 'SLELECT * from roundstats' at line 1

mysql> SELECT * from roundstats;
+----+-------------+--------------+----------------+-----------------+-------------+---------------------+-------------+
| id | numShutouts | goalLeaderId | assistLeaderId | penaltyLeaderId | plusMinusId | faceOffsWonLeaderId | sogLeaderId |
+----+-------------+--------------+----------------+-----------------+-------------+---------------------+-------------+
|  1 |          10 | Canucks      | Canucks        | Canucks         |           4 | Canucks             | Canucks     |
+----+-------------+--------------+----------------+-----------------+-------------+---------------------+-------------+
1 row in set (0.00 sec)
 -> DESC user;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syn
tax to use near 'ysql> INSERT into playoffround (id, team1Id, team2Id, startTime, endTime, roundN' at line 1
mysql> DESC user;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| id       | int         | NO   | PRI | NULL    |       |
| username | varchar(40) | NO   |     | NULL    |       |
| password | varchar(35) | NO   |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)
mysql> INSERT into user (id, username, password) values (1, 'jxjxO', 'stwbrry2');
Query OK, 1 row affected (0.00 sec)

mysql> SELECT * from user;
+----+----------+----------+
| id | username | password |
+----+----------+----------+
|  1 | jxjxO    | stwbrry2 |
+----+----------+----------+
1 row in set (0.00 sec)
mysql> DESC userinfo;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| id           | int         | NO   | PRI | NULL    |       |
| firstName    | varchar(20) | NO   |     | NULL    |       |
| lastName     | varchar(25) | NO   |     | NULL    |       |
| email        | varchar(45) | NO   |     | NULL    |       |
| round1Points | int         | NO   |     | NULL    |       |
| round2Points | int         | NO   |     | NULL    |       |
| round3Points | int         | NO   |     | NULL    |       |
| round4Points | int         | NO   |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
8 rows in set (0.01 sec)   
mysql> INSERT into userinfo (id, firstName, lastName, email, round1Points, round2Points, round3Points, round4Points) values (1, 'Allison',
'Stone', 'alli@gmail.com', 1, 1-1, 1-2, 0);
Query OK, 1 row affected (0.00 sec)
    
mysql> DESC userscorepicks;
+--------------+------+------+-----+---------+-------+
| Field        | Type | Null | Key | Default | Extra |
+--------------+------+------+-----+---------+-------+
| id           | int  | NO   | PRI | NULL    |       |
| hockeyGameId | int  | NO   |     | NULL    |       |
| team1IdScore | int  | NO   |     | NULL    |       |
| team2IdScore | int  | NO   |     | NULL    |       |
| userId       | int  | NO   |     | NULL    |       |
+--------------+------+------+-----+---------+-------+
5 rows in set (0.00 sec)
mysql> INSERT into userscorepicks (id, hockeyGameId, team1IdScore, team2IdScore,userId) values (1, 1, 1, 2, 1);
Query OK, 1 row affected (0.01 sec)
    
mysql> SELECT * from userscorepicks;
+----+--------------+--------------+--------------+--------+
| id | hockeyGameId | team1IdScore | team2IdScore | userId |
+----+--------------+--------------+--------------+--------+
|  1 |            1 |            1 |            2 |      1 |
+----+--------------+--------------+--------------+--------+
1 row in set (0.00 sec)
    
mysql> DESC userstatspicks;
+---------------------+-------------+------+-----+---------+-------+
| Field               | Type        | Null | Key | Default | Extra |
+---------------------+-------------+------+-----+---------+-------+
| id                  | int         | NO   | PRI | NULL    |       |
| roundld             | int         | NO   |     | NULL    |       |
| goalLeaderId        | varchar(16) | NO   |     | NULL    |       |
| assistLeaderId      | varchar(16) | NO   |     | NULL    |       |
| penaltyLeaderId     | varchar(16) | NO   |     | NULL    |       |
| plusMinusId         | int         | NO   |     | NULL    |       |
| faceOffsWonLeaderId | int         | NO   |     | NULL    |       |
| sogLeaderId         | int         | NO   |     | NULL    |       |
| numShutouts         | int         | NO   |     | NULL    |       |
| userId              | int         | NO   |     | NULL    |       |
+---------------------+-------------+------+-----+---------+-------+
10 rows in set (0.00 sec)
