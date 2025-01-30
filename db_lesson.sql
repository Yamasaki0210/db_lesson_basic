
Q1
MariaDB [db_lesson]> create table departments (
    -> `department_id` int unsigned auto_increment primary key,
    -> `name` varchar(20) not null,
    -> created_at timestamp null default current_timestamp,
    -> updated_at timestamp null default current_timestamp on update current_timestamp
    -> );
Query OK, 0 rows affected (0.015 sec)

MariaDB [db_lesson]> desc departments;
+---------------+------------------+------+-----+---------------------+-------------------------------+
| Field         | Type             | Null | Key | Default             | Extra                         |
+---------------+------------------+------+-----+---------------------+-------------------------------+
| department_id | int(10) unsigned | NO   | PRI | NULL                | auto_increment                |
| name          | varchar(20)      | NO   |     | NULL                |                               |
| created_at    | timestamp        | YES  |     | current_timestamp() |                               |
| updated_at    | timestamp        | YES  |     | current_timestamp() | on update current_timestamp() |
+---------------+------------------+------+-----+---------------------+-------------------------------+
4 rows in set (0.015 sec)


Q2
MariaDB [db_lesson]> alter table people add department_id int unsigned null after email;
Query OK, 0 rows affected (0.014 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [db_lesson]> desc people;
+---------------+---------------------+------+-----+---------------------+-------------------------------+
| Field         | Type                | Null | Key | Default             | Extra                         |
+---------------+---------------------+------+-----+---------------------+-------------------------------+
| person_id     | int(10) unsigned    | NO   | PRI | NULL                | auto_increment                |
| name          | varchar(20)         | NO   |     | NULL                |                               |
| email         | varchar(255)        | YES  | UNI | NULL                |                               |
| department_id | int(10) unsigned    | YES  |     | NULL                |                               |
| age           | tinyint(3) unsigned | YES  |     | NULL                |                               |
| gender        | tinyint(4)          | YES  |     | NULL                |                               |
| created_at    | timestamp           | NO   |     | current_timestamp() |                               |
| updated_at    | timestamp           | NO   |     | current_timestamp() | on update current_timestamp() |
+---------------+---------------------+------+-----+---------------------+-------------------------------+
8 rows in set (0.015 sec)


Q3
MariaDB [db_lesson]> insert into departments (name)
    -> values
    -> ('営業'),('開発'),('経理'),('人事'),('情報システム');
Query OK, 5 rows affected (0.008 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [db_lesson]> select * from departments
    -> ;
+---------------+--------------+---------------------+---------------------+
| department_id | name         | created_at          | updated_at          |
+---------------+--------------+---------------------+---------------------+
|             1 | 営業         | 2025-01-31 03:16:32 | 2025-01-31 03:16:32 |
|             2 | 開発         | 2025-01-31 03:16:32 | 2025-01-31 03:16:32 |
|             3 | 経理         | 2025-01-31 03:16:32 | 2025-01-31 03:16:32 |
|             4 | 人事         | 2025-01-31 03:16:32 | 2025-01-31 03:16:32 |
|             5 | 情報システム | 2025-01-31 03:16:32 | 2025-01-31 03:16:32 |
+---------------+--------------+---------------------+---------------------+
5 rows in set (0.000 sec)


MariaDB [db_lesson]> insert into people (name,email,department_id,age,gender)
    -> values
    -> ('佐藤一郎','sato@gizmo.jp',1,22,1),
    -> ('中田次郎','nakata@gizmo.jp',1,33,1)
    -> ,
    -> ('清水三郎','shimizu@gizumo.jp',1,44,1),
    -> ('望月めい','mochiduki@gizumo.jp',2,22,2),
    -> ('中村りこ','nakamura@gizumo.jp',2,33,2),
    -> ('佐々木さくら','sasaki@gizumo.jp',2,44,2),
    -> ('山田ももか','yamada@gizumo.jp',2,55,2),
    -> ('高橋さつき','takahashi@gizumo.jp',3,23,2),
    -> ('伊藤史郎','ito@gizumo.jp',4,24,1),
    -> ('原五郎','hara@gizumo.jp',5,25,1);
Query OK, 10 rows affected (0.007 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [db_lesson]> select * from people;
+-----------+----------------+---------------------+---------------+------+--------+---------------------+---------------------+
| person_id | name           | email               | department_id | age  | gender | created_at          | updated_at          |
+-----------+----------------+---------------------+---------------+------+--------+---------------------+---------------------+
|         1 | 鈴木たかし     | suzuki@gizumo.jp    |          NULL |   20 |      1 | 2025-01-27 20:28:48 | 2025-01-27 20:28:48 |
|         2 | 田中ゆうこ     | tanaka@gizumo.jp    |          NULL |   25 |      2 | 2025-01-27 20:33:40 | 2025-01-29 20:13:18 |
|         3 | 福田だいすけ   | fukuda@gizumo.jp    |          NULL |   42 |      1 | 2025-01-27 20:33:40 | 2025-01-27 20:33:40 |
|         4 | 豊島はなこ     | toyoshima@gizumo.jp |          NULL |   34 |      2 | 2025-01-27 20:33:40 | 2025-01-27 20:33:40 |
|         6 | 不思議沢みちこ | NULL                |          NULL | NULL |   NULL | 2025-01-27 20:33:40 | 2025-01-27 20:33:40 |
|         7 | 佐藤一郎       | sato@gizmo.jp       |             1 |   22 |      1 | 2025-01-31 03:45:16 | 2025-01-31 03:45:16 |
|         8 | 中田次郎       | nakata@gizmo.jp     |             1 |   33 |      1 | 2025-01-31 03:45:16 | 2025-01-31 03:45:16 |
|         9 | 清水三郎       | shimizu@gizumo.jp   |             1 |   44 |      1 | 2025-01-31 03:45:16 | 2025-01-31 03:45:16 |
|        10 | 望月めい       | mochiduki@gizumo.jp |             2 |   22 |      2 | 2025-01-31 03:45:16 | 2025-01-31 03:45:16 |
|        11 | 中村りこ       | nakamura@gizumo.jp  |             2 |   33 |      2 | 2025-01-31 03:45:16 | 2025-01-31 03:45:16 |
|        12 | 佐々木さくら   | sasaki@gizumo.jp    |             2 |   44 |      2 | 2025-01-31 03:45:16 | 2025-01-31 03:45:16 |
|        13 | 山田ももか     | yamada@gizumo.jp    |             2 |   55 |      2 | 2025-01-31 03:45:16 | 2025-01-31 03:45:16 |
|        14 | 高橋さつき     | takahashi@gizumo.jp |             3 |   23 |      2 | 2025-01-31 03:45:16 | 2025-01-31 03:45:16 |
|        15 | 伊藤史郎       | ito@gizumo.jp       |             4 |   24 |      1 | 2025-01-31 03:45:16 | 2025-01-31 03:45:16 |
|        16 | 原五郎         | hara@gizumo.jp      |             5 |   25 |      1 | 2025-01-31 03:45:16 | 2025-01-31 03:45:16 |
+-----------+----------------+---------------------+---------------+------+--------+---------------------+---------------------+
15 rows in set (0.000 sec)



MariaDB [db_lesson]> insert into reports (person_id,content)
    -> values
    -> (7,'本日は晴天かもしれない'),
    -> (8,'本日は曇りかもしれない'),
    -> (9,'本日は豪雨かもしれない'),
    -> (10,'本日は台風かもしれない'),
    -> (11,'本日は焼肉を食べたかった'),
    -> (12,'本日は焼肉を食べれなかった'),
    -> (13,'本日は焼肉を焼いただけだった'),
    -> (14,'本日は焼肉を食べたかもしれない'),
    -> (15,'本日はラーメンを食べる'),
    -> (16,'本日もラーメンを食べる');
Query OK, 10 rows affected (0.006 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [db_lesson]> select * from reports
    -> ;
+-----------+-----------+--------------------------------+---------------------+---------------------+
| report_id | person_id | content                        | created_at          | updated_at          |
+-----------+-----------+--------------------------------+---------------------+---------------------+
|         1 |         1 | いっぽう                       | 2025-01-29 21:02:32 | 2025-01-29 21:02:32 |
|         2 |         2 | にっぽう                       | 2025-01-29 21:06:31 | 2025-01-29 21:06:31 |
|         3 |         3 | さんぽう                       | 2025-01-29 21:06:31 | 2025-01-29 21:06:31 |
|         4 |         4 | よんぽう                       | 2025-01-29 21:06:31 | 2025-01-29 21:06:31 |
|         5 |         5 | ごほう                         | 2025-01-29 21:06:31 | 2025-01-29 21:06:31 |
|         6 |         1 | ろっぽう                       | 2025-01-29 21:06:31 | 2025-01-29 21:06:31 |
|         7 |         2 | ななほう                       | 2025-01-29 21:06:31 | 2025-01-29 21:06:31 |
|         8 |         3 | はっぽうさい                   | 2025-01-29 21:06:31 | 2025-01-29 21:06:31 |
|         9 |         4 | きゅうほう                     | 2025-01-29 21:06:31 | 2025-01-29 21:06:31 |
|        10 |         2 | じゅっぽう                     | 2025-01-29 21:06:31 | 2025-01-29 21:08:55 |
|        11 |         1 | じゅういち                     | 2025-01-29 21:06:31 | 2025-01-29 21:06:31 |
|        12 |         7 | 本日は晴天かもしれない         | 2025-01-31 03:59:37 | 2025-01-31 03:59:37 |
|        13 |         8 | 本日は曇りかもしれない         | 2025-01-31 03:59:37 | 2025-01-31 03:59:37 |
|        14 |         9 | 本日は豪雨かもしれない         | 2025-01-31 03:59:37 | 2025-01-31 03:59:37 |
|        15 |        10 | 本日は台風かもしれない         | 2025-01-31 03:59:37 | 2025-01-31 03:59:37 |
|        16 |        11 | 本日は焼肉を食べたかった       | 2025-01-31 03:59:37 | 2025-01-31 03:59:37 |
|        17 |        12 | 本日は焼肉を食べれなかった     | 2025-01-31 03:59:37 | 2025-01-31 03:59:37 |
|        18 |        13 | 本日は焼肉を焼いただけだった   | 2025-01-31 03:59:37 | 2025-01-31 03:59:37 |
|        19 |        14 | 本日は焼肉を食べたかもしれない | 2025-01-31 03:59:37 | 2025-01-31 03:59:37 |
|        20 |        15 | 本日はラーメンを食べる         | 2025-01-31 03:59:37 | 2025-01-31 03:59:37 |
|        21 |        16 | 本日もラーメンを食べる         | 2025-01-31 03:59:37 | 2025-01-31 03:59:37 |
+-----------+-----------+--------------------------------+---------------------+---------------------+
21 rows in set (0.000 sec)


Q4
MariaDB [db_lesson]> update people set department_id = 1 where department_id is null ;
Query OK, 5 rows affected (0.005 sec)
Rows matched: 5  Changed: 5  Warnings: 0

MariaDB [db_lesson]> select name ,department_id from people;
+----------------+---------------+
| name           | department_id |
+----------------+---------------+
| 鈴木たかし     |             1 |
| 田中ゆうこ     |             1 |
| 福田だいすけ   |             1 |
| 豊島はなこ     |             1 |
| 不思議沢みちこ |             1 |
| 佐藤一郎       |             1 |
| 中田次郎       |             1 |
| 清水三郎       |             1 |
| 望月めい       |             2 |
| 中村りこ       |             2 |
| 佐々木さくら   |             2 |
| 山田ももか     |             2 |
| 高橋さつき     |             3 |
| 伊藤史郎       |             4 |
| 原五郎         |             5 |
+----------------+---------------+
15 rows in set (0.000 sec)


Q5
MariaDB [db_lesson]>  select name , age from people where gender = 1 order by age desc;
+--------------+------+
| name         | age  |
+--------------+------+
| 清水三郎     |   44 |
| 福田だいすけ |   42 |
| 中田次郎     |   33 |
| 原五郎       |   25 |
| 伊藤史郎     |   24 |
| 佐藤一郎     |   22 |
| 鈴木たかし   |   20 |
+--------------+------+
7 rows in set (0.000 sec)


Q6
SELECT
  `name`, `email`, `age`
FROM
  `people`
WHERE
  `department_id` = 1
ORDER BY
  `created_at`;

  peopleテーブルのdepartment_idというカラムから１というレコードを絞り込み
  そのレコードが作られた時間の古いものから順に、name, email, ageのカラムのみ抜粋して
  表示する


  Q7
  MariaDB [db_lesson]> select * from people where gender = 2 and age between 20 and 29 or gender = 1 and age between 40 and 49;
+-----------+--------------+---------------------+---------------+------+--------+---------------------+---------------------+
| person_id | name         | email               | department_id | age  | gender | created_at          | updated_at          |
+-----------+--------------+---------------------+---------------+------+--------+---------------------+---------------------+
|         2 | 田中ゆうこ   | tanaka@gizumo.jp    |             1 |   25 |      2 | 2025-01-27 20:33:40 | 2025-01-31 04:27:17 |
|         3 | 福田だいすけ | fukuda@gizumo.jp    |             1 |   42 |      1 | 2025-01-27 20:33:40 | 2025-01-31 04:27:17 |
|         9 | 清水三郎     | shimizu@gizumo.jp   |             1 |   44 |      1 | 2025-01-31 03:45:16 | 2025-01-31 03:45:16 |
|        10 | 望月めい     | mochiduki@gizumo.jp |             2 |   22 |      2 | 2025-01-31 03:45:16 | 2025-01-31 03:45:16 |
|        14 | 高橋さつき   | takahashi@gizumo.jp |             3 |   23 |      2 | 2025-01-31 03:45:16 | 2025-01-31 03:45:16 |
+-----------+--------------+---------------------+---------------+------+--------+---------------------+---------------------+
5 rows in set (0.000 sec)

MariaDB [db_lesson]> select name from people where gender = 2 and age between 20 and 29 or gender = 1 and age between 40 and 49;
+--------------+
| name         |
+--------------+
| 田中ゆうこ   |
| 福田だいすけ |
| 清水三郎     |
| 望月めい     |
| 高橋さつき   |
+--------------+
5 rows in set (0.000 sec)

Q8
MariaDB [db_lesson]> select * from people where department_id = 1 order by age;
+-----------+----------------+---------------------+---------------+------+--------+---------------------+---------------------+
| person_id | name           | email               | department_id | age  | gender | created_at          | updated_at          |
+-----------+----------------+---------------------+---------------+------+--------+---------------------+---------------------+
|         6 | 不思議沢みちこ | NULL                |             1 | NULL |   NULL | 2025-01-27 20:33:40 | 2025-01-31 04:27:17 |
|         1 | 鈴木たかし     | suzuki@gizumo.jp    |             1 |   20 |      1 | 2025-01-27 20:28:48 | 2025-01-31 04:27:17 |
|         7 | 佐藤一郎       | sato@gizmo.jp       |             1 |   22 |      1 | 2025-01-31 03:45:16 | 2025-01-31 03:45:16 |
|         2 | 田中ゆうこ     | tanaka@gizumo.jp    |             1 |   25 |      2 | 2025-01-27 20:33:40 | 2025-01-31 04:27:17 |
|         8 | 中田次郎       | nakata@gizmo.jp     |             1 |   33 |      1 | 2025-01-31 03:45:16 | 2025-01-31 03:45:16 |
|         4 | 豊島はなこ     | toyoshima@gizumo.jp |             1 |   34 |      2 | 2025-01-27 20:33:40 | 2025-01-31 04:27:17 |
|         3 | 福田だいすけ   | fukuda@gizumo.jp    |             1 |   42 |      1 | 2025-01-27 20:33:40 | 2025-01-31 04:27:17 |
|         9 | 清水三郎       | shimizu@gizumo.jp   |             1 |   44 |      1 | 2025-01-31 03:45:16 | 2025-01-31 03:45:16 |
+-----------+----------------+---------------------+---------------+------+--------+---------------------+---------------------+
8 rows in set (0.000 sec)


Q9
MariaDB [db_lesson]> select avg(age) as average_age from people where department_id = 2 and gender = 2 ;
+-------------+
| average_age |
+-------------+
|     38.5000 |
+-------------+
1 row in set (0.000 sec)


Q10
MariaDB [db_lesson]> select people.name, departments.name, reports.content
    -> from people inner join reports on people.person_id = reports.person_id inner join departments on people.department_id = departments.department_id;
+--------------+--------------+--------------------------------+
| name         | name         | content                        |
+--------------+--------------+--------------------------------+
| 鈴木たかし   | 営業         | いっぽう                       |
| 田中ゆうこ   | 営業         | にっぽう                       |
| 福田だいすけ | 営業         | さんぽう                       |
| 豊島はなこ   | 営業         | よんぽう                       |
| 鈴木たかし   | 営業         | ろっぽう                       |
| 田中ゆうこ   | 営業         | ななほう                       |
| 福田だいすけ | 営業         | はっぽうさい                   |
| 豊島はなこ   | 営業         | きゅうほう                     |
| 田中ゆうこ   | 営業         | じゅっぽう                     |
| 鈴木たかし   | 営業         | じゅういち                     |
| 佐藤一郎     | 営業         | 本日は晴天かもしれない         |
| 中田次郎     | 営業         | 本日は曇りかもしれない         |
| 清水三郎     | 営業         | 本日は豪雨かもしれない         |
| 望月めい     | 開発         | 本日は台風かもしれない         |
| 中村りこ     | 開発         | 本日は焼肉を食べたかった       |
| 佐々木さくら | 開発         | 本日は焼肉を食べれなかった     |
| 山田ももか   | 開発         | 本日は焼肉を焼いただけだった   |
| 高橋さつき   | 経理         | 本日は焼肉を食べたかもしれない |
| 伊藤史郎     | 人事         | 本日はラーメンを食べる         |
| 原五郎       | 情報システム | 本日もラーメンを食べる         |
+--------------+--------------+--------------------------------+
20 rows in set (0.000 sec)


Q11
MariaDB [db_lesson]>  select people.name , reports.content
    ->  from people left outer join reports on people.person_id = reports.person_id where content is null;
+----------------+---------+
| name           | content |
+----------------+---------+
| 不思議沢みちこ | NULL    |
+----------------+---------+
1 row in set (0.001 sec)

MariaDB [db_lesson]>  select people.name
    ->  from people left outer join reports on people.person_id = reports.person_id where content is null;
+----------------+
| name           |
+----------------+
| 不思議沢みちこ |
+----------------+
1 row in set (0.000 sec)