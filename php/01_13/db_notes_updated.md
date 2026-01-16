### MEMBERS
badge_number (PK)
name
surname
address
birth_date
occupation
type ENUM('athlete','regular','honorary')

### ATHLETES
badge_number (PK, FK)
last_medical_certificate
federal_badge_date
is_individual

### REGULARS
badge_number (PK, FK)
courses_number_last_5_years

### HONORARY
badge_number (PK, FK)
role

### STRUCTURES
id (PK)
description
address
telephone_number
corporation

### SUPERVISORS
fiscal_code (PK)
name
surname
telephone_number
address
hourly_pay

### COURSES
course_code (PK)
name
description
price
days_of_week
start_time
end_time
structure_id (FK)
supervisor_fiscal_code (FK)

### COURSE_ATTENDANCE
badge_number (FK)
course_code (FK)
payment_date
PK (badge_number, course_code)

### COACHES
id (PK)
federal_code
federal_badge_date
name
surname

### TEAMS
id (PK)
name
category
athlete_number
course_code (FK)
coach_id (FK)

### ATHLETE_TEAMS
badge_number (FK)
team_id (FK)
joining_year
PK (badge_number, team_id)