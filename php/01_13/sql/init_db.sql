CREATE DATABASE tutti_in_forma;
USE tutti_in_forma;

-- MEMBERS
CREATE TABLE members (
    badge_number INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    address VARCHAR(100),
    birth_date DATE,
    occupation VARCHAR(50),
    type ENUM('athlete','regular','honorary') NOT NULL
);  


-- STRUCTURES
CREATE TABLE structures (
    id INT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(100),
    address VARCHAR(100),
    telephone_number VARCHAR(20),
    corporation VARCHAR(50)
);


-- SUPERVISORS
CREATE TABLE supervisors (
    fiscal_code CHAR(16) PRIMARY KEY,
    name VARCHAR(50),
    surname VARCHAR(50),
    telephone_number VARCHAR(20),
    address VARCHAR(100),
    hourly_pay DECIMAL(6,2)
);


-- COURSES
CREATE TABLE courses (
    course_code varchar(50) not null PRIMARY KEY,
    name VARCHAR(50),
    description VARCHAR(255),
    price DECIMAL(6,2),
    days_of_week VARCHAR(50),
    start_time TIME,
    end_time TIME,
    structure_id INT,
    supervisor_fiscal_code CHAR(16),
    FOREIGN KEY (structure_id) REFERENCES structures(id),
    FOREIGN KEY (supervisor_fiscal_code) REFERENCES supervisors(fiscal_code)
);


-- ATHLETES
CREATE TABLE athletes (
    badge_number INT PRIMARY KEY,
    last_medical_certificate DATE,
    federal_badge_date DATE,
    is_individual BOOLEAN,
    FOREIGN KEY (badge_number) REFERENCES members(badge_number)
);


-- REGULARS
CREATE TABLE regulars (
    badge_number INT PRIMARY KEY,
    courses_number_last_5_years INT,
    FOREIGN KEY (badge_number) REFERENCES members(badge_number)
);


-- HONORARY
CREATE TABLE honorary (
    badge_number INT PRIMARY KEY,
    role VARCHAR(50),
    FOREIGN KEY (badge_number) REFERENCES members(badge_number)
);


-- COURSE ATTENDANCE
CREATE TABLE course_attendance (
    badge_number INT,
    course_code VARCHAR(50),
    payment_date DATE,
    PRIMARY KEY (badge_number, course_code),
    FOREIGN KEY (badge_number) REFERENCES members(badge_number),
    FOREIGN KEY (course_code) REFERENCES courses(course_code)
);


-- COACHES
CREATE TABLE coaches (
    id INT AUTO_INCREMENT PRIMARY KEY,
    federal_code VARCHAR(20),
    federal_badge_date DATE,
    name VARCHAR(50),
    surname VARCHAR(50)
);


-- TEAMS
CREATE TABLE teams (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    category VARCHAR(30),
    athlete_number INT,
    course_code varchar(50),
    coach_id INT,
    FOREIGN KEY (course_code) REFERENCES courses(course_code),
    FOREIGN KEY (coach_id) REFERENCES coaches(id)
);


-- ATHLETE TEAMS
CREATE TABLE athlete_teams (
    badge_number INT,
    team_id INT,
    joining_year YEAR,
    PRIMARY KEY (badge_number, team_id),
    FOREIGN KEY (badge_number) REFERENCES athletes(badge_number),
    FOREIGN KEY (team_id) REFERENCES teams(id)
);

-- Users
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(20) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    badge_number INT,
    FOREIGN KEY (badge_number) REFERENCES members(badge_number)
);