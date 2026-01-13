# DB notes


### Members:
- badge_number ! 
- name !
- surname ! 
- birth_date
- occupation
- type (atlethes  -  regular  -  honorary)


### atlethes (3 courses)
- badge_number
- last_certificate
- fed_badge
- is_individual


### regular (3 courses)
- badge_number
- courses_number


### honorary
- badge_number
- role

### course_attendance
- course_code
- badge_number
- payment_date

### courses
- course_code
- name
- desciprion
- price
- structure_id !
- date
- start
- finish

### structures
- id 
- description
- address
- telephone_number
- corporation

### supervisor
- fiscal_code
- name
- surname
- telephone_number
- address
- hourly_pay

### atlethe_teams (must be attending the relative course)
- badge_number
- joining_year

### teams 
- course
- name
- category
- atlethe_number
- coach

### coaches
- id
- name
- surname
- badge_number
- badge_date