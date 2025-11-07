CREATE DATABASE university;
USE university;

DROP DATABASE IF EXISTS university;
CREATE DATABASE university;
USE university;
 
CREATE TABLE degree_courses(
    degree_course VARCHAR(127) NOT NULL PRIMARY KEY,
    degree_type VARCHAR(255),
    faculty VARCHAR(255)
);

CREATE TABLE professors(
    code INT NOT NULL PRIMARY KEY,
    name VARCHAR(127),
    department VARCHAR(127)
);

CREATE TABLE courses(
    course_code INT NOT NULL PRIMARY KEY,
    course_name VARCHAR(127),
    professor INT,
    FOREIGN KEY (professor) REFERENCES professors(code)
);

CREATE TABLE students(
    mat_number INT NOT NULL PRIMARY KEY,
    name VARCHAR(127),
    degree_course VARCHAR(127) NOT NULL,
    year INT,
    FOREIGN KEY (degree_course) REFERENCES degree_courses(degree_course)
);

CREATE TABLE frequency(
    mat_number INT NOT NULL,
    course_code INT NOT NULL,
    FOREIGN KEY (mat_number) REFERENCES students(mat_number),
    FOREIGN KEY (course_code) REFERENCES courses(course_code),
    CONSTRAINT pk_frequency PRIMARY KEY (mat_number, course_code)
);

INSERT INTO degree_courses VALUES
('Big Data', 'M', 'Ingegneria'),
('Data Science', 'M', 'Ingegneria'),
('Lettere Moderne', 'L', 'Lettere'),
('Filosofia', 'L', 'Filosofia'),
('Informatica', 'L', 'Scienze');

INSERT INTO professors VALUES
(1, 'Giorgio', 'Informatica'),
(2, 'Francesco', 'Ingegneria'),
(3, 'Felice Leoni', 'Informatica'),
(4, 'Anna Bianchi', 'Lettere'),
(5, 'Marco Rossi', 'Informatica'),
(6, 'Luca Leoni', 'Informatica');

INSERT INTO courses VALUES
(1, 'UX', 1),
(2, 'Machine Learning', 2),
(3, 'SBC', 3),
(4, 'Basi di Dati e Sistemi Informativi', 3),
(5, 'Informatica Generale', 5),
(6, 'Letteratura Italiana', 4),
(7, 'Filosofia Antica', 4),
(8, 'AI Foundations', 6);


INSERT INTO students VALUES
(1001, 'Luca', 'Big Data', 2005),
(1002, 'Matteo', 'Data Science', 2003),
(1003, 'Chiara', 'Informatica', 2004),
(1004, 'Francesca', 'Informatica', 2002),
(1005, 'Giulia', 'Lettere Moderne', 2000),
(1006, 'Davide', 'Filosofia', 2001),
(1007, 'Sara', 'Filosofia', 2003),
(1008, 'Marco', 'Big Data', 2005),
(1009, 'Elena', 'Informatica', 2002);


INSERT INTO frequency VALUES
(1001, 1),
(1002, 2),
(1003, 3),
(1004, 4),
(1005, 6),
(1006, 7),
(1007, 7),
(1003, 5),
(1004, 8),
(1008, 3),
(1009, 3);


INSERT INTO students VALUES (1010, 'Paolo', 'Data Science', 2001);

INSERT INTO courses VALUES (9, 'Reti di Calcolatori', 5);
INSERT INTO courses VALUES (10, 'Algoritmi Avanzati', 5);


/*1. Il nome e l’anno di nascita degli studenti iscritti a SBC, in ordine rispetto al
nome
*/
select s.name, s.year from students s 
join frequency f on f.mat_number = s.mat_number
join courses c on c.course_code = f.course_code
where c.course_name = "SBC"
order by s.name;


/*2. Il nome ed il Dipartimento dei docenti di “Basi di Dati e Sistemi Informativi” o di
“Informatica Generale”
*/
select p.name, p.department from professors p 
join courses c on c.professor = p.code
where c.course_name = "Basi di Dati e Sistemi Informativi" 
or c.course_name = "Informatica Generale";


/*3. Matricola e nome degli studenti di un corso di laurea triennale (tipoLaurea = 'L')
che seguono un corso di un docente di nome Felice.
*/
select s.mat_number, s.name from students s
join degree_courses dc on s.degree_course = dc.degree_course
join frequency f on f.mat_number = s.mat_number
join courses c on c.course_code = f.course_code
join professors p on p.code = c.professor
where dc.degree_type = "L"
and p.name like "%Felice%";


/*4. Per ogni tipo di laurea, il tipoLaurea e l’età media degli studenti
*/
select dc.degree_type, avg(2025 - s.year) from degree_courses dc
join students s on s.degree_course = dc.degree_course


/*5. Di ogni corso di un docente di nome Leoni, il CodCorso e il numero degli
studenti che lo frequentano
*/
select c.course_code, COUNT(s.mat_number) from courses c
join professors p on p.code = c.professor
join frequency f on f.course_code = c.course_code
join students s on s.mat_number = f.mat_number
where p.name like "%Leoni%"


/*6. Il codice dei corsi frequentati da più di 5 studenti e tenuti da docenti del
Dipartimento di Informatica
*/
select c.course_code from courses c
join professors p on p.code = c.professor
join frequency f on f.course_code = c.course_code
join students s on s.mat_number = f.mat_number
where p.department like "Informatica"
having COUNT(s.name) > 5;  


/*7. Per ogni studente della Facoltà di Lettere e Filosofia, la matricola ed il numero
di corsi seguiti
*/
select s.mat_number, count(c.course_code) from students s
join degree_courses dc on s.degree_course = dc.degree_course
join frequency f on f.mat_number = s.mat_number
join courses c on c.course_code = f.course_code
where dc.faculty like "Lettere" or dc.faculty like "Filosofia"



/*8. Matricola e nome degli studenti che non frequentano nessun corso
*/
select s.mat_number, s.name
from students s
left join frequency f on s.mat_number = f.mat_number
where f.course_code is null;



/*9. Il Codice ed il Nome dei docenti dei Corsi che non sono frequentati da nessuno
studente
*/
select distinct p.code, p.name
from professors p
join courses c on c.professor = p.code
left join frequency f on f.course_code = c.course_code
where f.mat_number is null;
