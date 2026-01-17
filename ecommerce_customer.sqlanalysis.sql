CREATE DATABASE Mysql_revision;
USE Mysql_revision;

CREATE TABLE students(
id INT,
name VARCHAR(50)
);

CREATE TABLE classes (
id INT,
class VARCHAR(20)
);

INSERT INTO students VALUES 
(1, 'Gaurav'),
(2, 'Raju'),
(3, 'Sam');

INSERT INTO classes VALUES
(1, '10th'),
(2, '12th'),
(3, '9th');

SELECT * FROM students;
SELECT * FROM classes;

-- INNER JOIN
SELECT students.id, name , class
FROM students 
INNER JOIN classes 
ON students.id = classes.id;

-- LEFT JOIN
SELECT students.id, name, class
FROM students
LEFT JOIN classes
ON students.id = classes.id;

-- RIGHT JOIN 
SELECT students.id, name, class 
FROM students 
RIGHT JOIN classes
ON students.id = classes.id;

-- FULL JOIN 
SELECT students.id, name, class
FROM students
LEFT JOIN classes
ON students.id = classes.id
UNION
SELECT students.id, name, class 
FROM students 
RIGHT JOIN classes
ON students.id = classes.id;

