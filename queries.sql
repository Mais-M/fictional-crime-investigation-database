-- Investigation queries
-- Run schema.sql and sample_data.sql before running this file.

USE fictional_crime_investigation;

-- 1. Display the crime-scene report.

SELECT
    crime_date,
    crime_type,
    description,
    city
FROM crime_scene_report
WHERE crime_date = 20240115
  AND city = 'Fiction City';


-- 2. Display the witness interviews.

SELECT
    p.name,
    i.transcript
FROM person AS p
JOIN interview AS i
    ON p.id = i.person_id;


-- 3. Find the person connected to plate number ABC123.

SELECT
    p.id,
    p.name,
    d.age,
    d.height,
    d.gender,
    d.eye_color,
    d.hair_color,
    d.plate_number,
    d.car_make,
    d.car_model
FROM person AS p
JOIN drivers_license AS d
    ON p.license_id = d.id
WHERE d.plate_number = 'ABC123';


-- 4. Find gold members who checked in on the crime date.

SELECT
    p.name,
    m.id AS membership_id,
    m.membership_status,
    c.check_in_date,
    c.check_in_time,
    c.check_out_time
FROM person AS p
JOIN get_fit_now_member AS m
    ON p.id = m.person_id
JOIN get_fit_now_check_in AS c
    ON m.id = c.membership_id
WHERE m.membership_status = 'gold'
  AND c.check_in_date = 20240115;


-- 5. Find people who attended the Tech Gala.

SELECT
    p.name,
    f.event_name,
    f.event_date
FROM person AS p
JOIN facebook_event_checkin AS f
    ON p.id = f.person_id
WHERE f.event_name = 'Tech Gala'
  AND f.event_date = 20240114;


-- 6. Combine all clues to identify the fictional suspect.

SELECT DISTINCT
    p.name AS fictional_suspect,
    d.plate_number,
    d.car_make,
    d.car_model,
    m.membership_status,
    c.check_in_date,
    c.check_in_time,
    f.event_name,
    f.event_date
FROM person AS p
JOIN drivers_license AS d
    ON p.license_id = d.id
JOIN get_fit_now_member AS m
    ON p.id = m.person_id
JOIN get_fit_now_check_in AS c
    ON m.id = c.membership_id
JOIN facebook_event_checkin AS f
    ON p.id = f.person_id
WHERE d.gender = 'male'
  AND d.plate_number = 'ABC123'
  AND m.membership_status = 'gold'
  AND c.check_in_date = 20240115
  AND c.check_in_time BETWEEN 1600 AND 1700
  AND f.event_name = 'Tech Gala'
  AND f.event_date = 20240114;


-- 7. Display the suspect's income information.

SELECT
    p.name,
    i.annual_income
FROM person AS p
JOIN income AS i
    ON p.ssn = i.ssn
WHERE p.name = 'Sam Smith';


-- 8. Check the stored fictional solution.

SELECT
    user_id,
    solution_value
FROM solution;
