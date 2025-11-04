create database university;

use university;

drop DATABASE university

create table degree_courses(
    degree_course varchar(127) not null primary KEY,
    degree_type varchar(255),
    faculty VARCHAR(255)
);

create table professors(
    code int not null PRIMARY KEY,
    name varchar(127),
    department VARCHAR(127)
);

create table courses(
    course_code int not null PRIMARY KEY,
    course_name VARCHAR(127),
    professor int,
    Foreign Key (professor) REFERENCES professors(code)
);

create table students(
    mat_number int not null PRIMARY KEY,
    name varchar(127),
    degree_course VARCHAR(127) not null,
    year int,
    Foreign Key (degree_course) REFERENCES degree_courses(degree_course)
);


create table frequency(
    mat_number int not NULL,
    course_code int not null,
    Foreign Key (mat_number) REFERENCES students(mat_number),
    Foreign Key (course_code) REFERENCES courses(course_code),
    constraint pk_fequency PRIMARY KEY (mat_number,course_code)
);


insert into degree_courses() VALUES("big data", "M", "ingegneria");
insert into degree_courses() VALUES("data science", "M", "ingegneria");
insert into professors() VALUES(001, "Giorgio", "informatica");
insert into professors() VALUES(002, "Francesco", "ingegneria");
insert into courses() values(001, "ux", 001);
insert into courses() values(002, "machine learning", 002);
insert into students() values(00000001, "Luca", "big data", 2005);
insert into students() values(00000002, "Matteo", "data science", 2003);
insert into frequency() values(00000001, 001);
insert into frequency() values(00000002, 002);




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
select s.mat_number, s.name from students s 
join degree_courses dc on s.degree_course = dc.degree_course
join frequency f on f.mat_number = s.mat_number
join courses c on c.course_code = f.course_code
having count(c.course_code) = 0;


/*9. Il Codice ed il Nome dei docenti dei Corsi che non sono frequentati da nessuno
studente
*/
select p.code, p.name from professors p 
join courses c on c.professor = p.code
join frequency f on f.course_code = c.course_code
join students s on s.mat_number = f.mat_number
having count(c.course_code) = 0
