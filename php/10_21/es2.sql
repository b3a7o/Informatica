create Database Arte;

use arte;

create table museums(
    id int AUTO_INCREMENT not null PRIMARY KEY,
    name VARCHAR(127) not null ,
    city varchar(127) not null
);

create table artists(
    id int AUTO_INCREMENT not null PRIMARY KEY,
    name varchar(127) not null,
    nationality VARCHAR(127)
);

create table works(
    code int not null PRIMARY KEY,
    title varchar(255),
    museum int not NULL,
    artist int not null,
    Foreign Key (museum) REFERENCES museums(id),
    Foreign Key (artist) REFERENCES artists(id)
);

create table characters(
    id int AUTO_INCREMENT not null PRIMARY KEY,
    workCode int not null,
    person VARCHAR(255) not null,
    Foreign Key (workCode) REFERENCES works(code)
);

INSERT into museums(name, city) VALUES("primo_museo", "Milano");
INSERT into museums(name, city) VALUES("secondo_museo", "Parigi");


INSERT INTO artists(name, nationality) VALUES("primo_artista", "Italiano");
INSERT INTO artists(name, nationality) VALUES("secondo_artista", "Francese");

INSERT INTO works() VALUES(000, "prima_opera", 1, 1);
INSERT INTO works() VALUES(001, "seconda_opera", 2, 2);







INSERT INTO artists(name, nationality) 
VALUES("Tiziano", "Italiano");

INSERT into museums(name, city) 
VALUES("National Gallery", "London");

INSERT INTO works() 
VALUES(002, "venere", 3, 3);

select w.code, w.title from works as w
join museums as m on m.id = w.museum
join artists as a on a.id = w.artist
where m.name ="National Gallery" and a.name = "Tiziano"






select a.name, w.title from works w
join artists a on a.id = w.artist 
join museums m on m.id = w.museum
where m.name = "Galleria degli Uffizi" 
or m.name = "National Gallery";




INSERT into museums(name, city) 
VALUES("museo_firenze", "Firenze");

INSERT INTO works() 
VALUES(003, "opera_firenze", 4, 3);

select a.name, w.title from works w 
join artists a on a.id = w.artist
join museums m on m.id = w.museum
where m.city = "Firenze"




INSERT INTO artists(name, nationality) 
VALUES("Caravaggio", "Italiano");

INSERT INTO works() 
VALUES(004, "opera_caravaggio", 3, 4);

select m.city from museums m
join works w on w.museum = m.id 
join artists a on a.id = w.artist 
where a.name = "Caravaggio" 






select w.code, w.title from works w 
join artists a on w.artist = a.id 
join museums m on w.museum = m.id
where a.name = "Tiziano" and m.city = "London"


select a.name, w.title from works w 
join artists a on w.artist = a.id 
join museums m on w.museum = m.id
where a.nationality = "Spanish" and m.city = "Firenze"




select w.code, w.title from works w 
join artists a on w.artist = a.id 
join museums m on w.museum = m.id
join characters c on c.workCode = w.code
where m.city = "London" 
and a.nationality = "Italiano" 
and c.person = "Madonna";



INSERT into museums(name, city)
VALUES("london_museum", "London");

select m.name, count(w.code) as "N opere" from works w 
join artists a on w.artist = a.id 
left join museums m on w.museum = m.id
group by m.name, m.city, a.nationality
having a.nationality like "Italiano" and m.city like "London"

INSERT INTO works() 
VALUES(006, "london2", 5, 4);
