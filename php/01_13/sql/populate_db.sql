use tutti_in_forma

--COACHES
insert into coaches() VALUES
("001", "eee", 2021-09-11, "Lorenzo", "Rossi");

insert into coaches() VALUES
("002","aaa", 2020-06-11, "Luca", "Verdi")

insert into coaches() VALUES
("003","bbb", 2022-02-11, "Roberto", "De Marchi")

insert into coaches() VALUES
("004","ccc", 2021-03-11, "Aurora", "Deste")

insert into coaches() VALUES
("005","ddd", 2022-12-11, "Anna", "Aggio")


--STRUCTURES
insert into structures(description, address, telephone_number, corporation) 
VALUES("desc", "Via Bissuola 12", "3848229586", "corp1")

insert into structures(description, address, telephone_number, corporation) 
VALUES("desc", "Via Dosa 33", "3845439876", "corp2")

insert into structures(description, address, telephone_number, corporation) 
VALUES("desc", "Via Zigaraga 62", "3845439876", "corp1")

insert into structures(description, address, telephone_number, corporation) 
VALUES("desc", "Via Torino 102", "3872343476", "corp3")


--SUPERVISORS
insert into supervisors(fiscal_code, name, surname, telephone_number, address, hourly_pay) 
VALUES("lngmra95", "mario", "linguini", "3825883857", "Via Ca Marcello", 12.5)

insert into supervisors(fiscal_code, name, surname, telephone_number, address, hourly_pay) 
VALUES("rssmtt90", "matteo", "rossato", "39371857395", "Via Roma", 15.0)

insert into supervisors(fiscal_code, name, surname, telephone_number, address, hourly_pay) 
VALUES("stcdnl89", "daniel", "stocco", "39783654495", "Via Lago di Garda", 16.0)

insert into supervisors(fiscal_code, name, surname, telephone_number, address, hourly_pay) 
VALUES("stcfrn80", "francesco", "stocco", "39783654495", "Via Liguria", 18.0)


--COURSES
insert into courses() VALUES
("ftb01", "Calcio<10", "calcio bambini", 120, "giovedi", "16:00:00", "17:00:00", 1, "lngmra95")

insert into courses() VALUES
("ftb02", "Calcio10-14", "calcio ragazzi", 150, "mercoledi", "16:30:00", "18:00:00", 2, "rssmtt90")

insert into courses() VALUES
("ftb03", "Calcio>14", "calcio amatori", 200, "giovedi", "17:30:00", "19:00:00", 1, "rssmtt90")


insert into courses() VALUES
("bsk01", "Basket<10", "basket bambini", 120, "martedi", "16:00:00", "17:00:00", 3, "stcdnl89")

insert into courses() VALUES
("bsk02", "Basket10-14", "basket ragazzi", 150, "martedi", "17:30:00", "18:30:00", 3, "stcdnl89")

insert into courses() VALUES
("bsk03", "Basket>14", "basket amatori", 200, "giovedi", "18:00:00", "19:45:00", 4, "stcfrn80")