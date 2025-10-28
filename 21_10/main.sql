create DATABASE car_renting;


use car_renting;

create table insurances(
    code int not null AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) not null,
    office VARCHAR(255) not null
);


create table owners(
    fiscal_code int not null PRIMARY KEY,
    surname VARCHAR(127) not null,
    name VARCHAR(127) not null,
    city VARCHAR(127) not null,
    residency VARCHAR(127) not null
);



create table cars(
    plate VARCHAR(31) not null PRIMARY key,
    brand VARCHAR(63),
    displacement int,
    power int,
    fiscal_code int not null,
    insurance_code int not null,
    Foreign Key (fiscal_code) REFERENCES owners(fiscal_code),
    Foreign Key (insurance_code) REFERENCES insurances(code)
);




insert into owners(fiscal_code, surname, name, city, residency) VALUES (111, 'cognome', 'nome', 'città', 'residenza');
insert into insurances(code, name, office) VALUES(111, 'nome', 'ufficio')


insert into cars(plate, brand, displacement, power, fiscal_code, insurance_code) VALUES('aaa', 'audi', '200', '400', 111, 111)


select * from cars


select c.plate, c.brand from cars c 
where c.power > 120 or c.displacement > 2000


select ow.name, c.plate from cars c 
inner join owners ow on c.fiscal_code = ow.fiscal_code 
where c.displacement > 2000 or c.power > 120;

select ow.name, c.plate from cars c
join owners ow on c.fiscal_code = ow.fiscal_code
where(c.displacement > 2000 or c.power > 120);


select i.code, i.name, i.office, count(c.insurance_code) 
from insurances i join cars c on i.code = c.insurance_code;


select ow.fiscal_code, ow.name from owners ow
join cars c on ow.fiscal_code = c.fiscal_code
having count(c.fiscal_code)> 1;

