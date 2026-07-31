-- Fictional Crime Investigation Database
-- This script creates the database structure.
-- Running it again will delete and recreate the project tables.

CREATE DATABASE IF NOT EXISTS fictional_crime_investigation;

USE fictional_crime_investigation;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS solution;
DROP TABLE IF EXISTS crime_scene_report;
DROP TABLE IF EXISTS income;
DROP TABLE IF EXISTS facebook_event_checkin;
DROP TABLE IF EXISTS get_fit_now_check_in;
DROP TABLE IF EXISTS get_fit_now_member;
DROP TABLE IF EXISTS interview;
DROP TABLE IF EXISTS person;
DROP TABLE IF EXISTS drivers_license;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE drivers_license (
    id INT PRIMARY KEY,
    age INT NOT NULL,
    height INT NOT NULL,
    eye_color VARCHAR(20) NOT NULL,
    hair_color VARCHAR(20) NOT NULL,
    gender VARCHAR(20) NOT NULL,
    plate_number VARCHAR(20) NOT NULL UNIQUE,
    car_make VARCHAR(20) NOT NULL,
    car_model VARCHAR(20) NOT NULL
);

CREATE TABLE person (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    license_id INT NOT NULL UNIQUE,
    address_number INT NOT NULL,
    address_street_name VARCHAR(100) NOT NULL,
    ssn CHAR(9) NOT NULL UNIQUE,

    CONSTRAINT fk_person_license
        FOREIGN KEY (license_id)
        REFERENCES drivers_license(id)
);

CREATE TABLE interview (
    person_id INT PRIMARY KEY,
    transcript TEXT NOT NULL,

    CONSTRAINT fk_interview_person
        FOREIGN KEY (person_id)
        REFERENCES person(id)
);

CREATE TABLE get_fit_now_member (
    id VARCHAR(20) PRIMARY KEY,
    person_id INT NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL,
    membership_start_date INT NOT NULL,
    membership_status VARCHAR(20) NOT NULL,

    CONSTRAINT fk_member_person
        FOREIGN KEY (person_id)
        REFERENCES person(id)
);

CREATE TABLE get_fit_now_check_in (
    membership_id VARCHAR(20) PRIMARY KEY,
    check_in_date INT NOT NULL,
    check_in_time INT NOT NULL,
    check_out_time INT NOT NULL,

    CONSTRAINT fk_checkin_member
        FOREIGN KEY (membership_id)
        REFERENCES get_fit_now_member(id)
);

CREATE TABLE facebook_event_checkin (
    person_id INT PRIMARY KEY,
    event_id INT NOT NULL,
    event_name VARCHAR(100) NOT NULL,
    event_date INT NOT NULL,

    CONSTRAINT fk_event_person
        FOREIGN KEY (person_id)
        REFERENCES person(id)
);

CREATE TABLE income (
    ssn CHAR(9) PRIMARY KEY,
    annual_income INT NOT NULL,

    CONSTRAINT fk_income_person
        FOREIGN KEY (ssn)
        REFERENCES person(ssn)
);

CREATE TABLE crime_scene_report (
    crime_date INT NOT NULL,
    crime_type VARCHAR(50) NOT NULL,
    description TEXT NOT NULL,
    city VARCHAR(100) NOT NULL
);

CREATE TABLE solution (
    user_id INT PRIMARY KEY,
    solution_value VARCHAR(100) NOT NULL
);
