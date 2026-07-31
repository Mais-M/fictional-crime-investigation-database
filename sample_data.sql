-- Fictional sample data
-- Run schema.sql before running this file.

USE fictional_crime_investigation;

INSERT INTO drivers_license (
    id,
    age,
    height,
    eye_color,
    hair_color,
    gender,
    plate_number,
    car_make,
    car_model
)
VALUES
    (
        501,
        34,
        170,
        'blue',
        'brown',
        'male',
        'ABC123',
        'Toyota',
        'Corolla'
    ),
    (
        502,
        29,
        165,
        'green',
        'black',
        'female',
        'XYZ789',
        'Honda',
        'Civic'
    ),
    (
        503,
        45,
        178,
        'brown',
        'gray',
        'male',
        'LMN456',
        'Ford',
        'Focus'
    ),
    (
        504,
        38,
        172,
        'hazel',
        'blonde',
        'female',
        'QRS246',
        'Nissan',
        'Sentra'
    );

INSERT INTO person (
    id,
    name,
    license_id,
    address_number,
    address_street_name,
    ssn
)
VALUES
    (
        1001,
        'Sam Smith',
        501,
        25,
        'Oak Street',
        '111223333'
    ),
    (
        1002,
        'Maya Brown',
        502,
        18,
        'Main Street',
        '222334444'
    ),
    (
        1003,
        'Jordan Lee',
        503,
        77,
        'Pine Avenue',
        '333445555'
    ),
    (
        1004,
        'Alex Green',
        504,
        42,
        'Maple Road',
        '444556666'
    );

INSERT INTO interview (
    person_id,
    transcript
)
VALUES
    (
        1003,
        'I saw a man leaving the scene. His vehicle had the plate number ABC123.'
    ),
    (
        1004,
        'I heard that the suspect had a gold gym membership and attended the Tech Gala.'
    );

INSERT INTO get_fit_now_member (
    id,
    person_id,
    name,
    membership_start_date,
    membership_status
)
VALUES
    (
        'GF501',
        1001,
        'Sam Smith',
        20230105,
        'gold'
    ),
    (
        'GF502',
        1002,
        'Maya Brown',
        20230610,
        'silver'
    ),
    (
        'GF503',
        1003,
        'Jordan Lee',
        20220815,
        'gold'
    ),
    (
        'GF504',
        1004,
        'Alex Green',
        20230920,
        'bronze'
    );

INSERT INTO get_fit_now_check_in (
    membership_id,
    check_in_date,
    check_in_time,
    check_out_time
)
VALUES
    (
        'GF501',
        20240115,
        1640,
        1730
    ),
    (
        'GF502',
        20240115,
        1500,
        1600
    ),
    (
        'GF503',
        20240115,
        1200,
        1300
    ),
    (
        'GF504',
        20240114,
        1800,
        1900
    );

INSERT INTO facebook_event_checkin (
    person_id,
    event_id,
    event_name,
    event_date
)
VALUES
    (
        1001,
        9001,
        'Tech Gala',
        20240114
    ),
    (
        1002,
        9002,
        'City Book Fair',
        20240114
    ),
    (
        1003,
        9001,
        'Tech Gala',
        20231220
    ),
    (
        1004,
        9003,
        'Community Meeting',
        20240114
    );

INSERT INTO income (
    ssn,
    annual_income
)
VALUES
    (
        '111223333',
        120000
    ),
    (
        '222334444',
        72000
    ),
    (
        '333445555',
        85000
    ),
    (
        '444556666',
        68000
    );

INSERT INTO crime_scene_report (
    crime_date,
    crime_type,
    description,
    city
)
VALUES
    (
        20240115,
        'murder',
        'A witness saw a man leaving the scene in a vehicle with plate number ABC123. Investigators learned that the suspect had a gold gym membership and attended the Tech Gala the previous day.',
        'Fiction City'
    );

INSERT INTO solution (
    user_id,
    solution_value
)
VALUES
    (
        1,
        'Sam Smith'
    );
