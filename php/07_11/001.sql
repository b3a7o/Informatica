create DATABASE lessons;

use lessons;

create table courses(
    courseCode INT not null unique PRIMARY KEY,
    professorName varchar(127)
);

create table rooms(
    roomCode int not null primary key unique,
    Nseats int,
    building varchar(127),
    lim BOOLEAN,
    pcNumber INT
)

create table software(
    id int AUTO_INCREMENT not Null PRIMARY KEY,
    roomCode int,
    softwareName VARCHAR(255),
    Foreign Key (roomCode) REFERENCES rooms(roomCode)
)

create table lessons(
    id int not null AUTO_INCREMENT PRIMARY KEY,
    courseCode int not null,
    roomCode int not null,
    semester int,
    weekDay varchar(32),
    endTime TIME,
    startTime TIME,
    Foreign Key (courseCode) REFERENCES courses(courseCode),
    Foreign Key (roomCode) REFERENCES rooms(roomCode)
)


