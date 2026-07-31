# Fictional Crime Investigation Database

This project is a fictional crime-investigation database created in MySQL Workbench.

I used the SQL Murder Mystery ERD as a structural reference and independently created the database tables, relationships, and fictional records.

## Project Features

- Relational database design
- Primary and foreign keys
- Fictional sample records
- Connected tables for people, driving licences, interviews, gym activity, events, and income
- SQL JOIN queries combining information from multiple tables

## Main Tables

- `person`
- `drivers_license`
- `interview`
- `get_fit_now_member`
- `get_fit_now_check_in`
- `facebook_event_checkin`
- `income`
- `crime_scene_report`
- `solution`

## Example JOIN Query

```sql
SELECT
    p.name,
    d.age,
    d.height,
    d.plate_number,
    d.car_make,
    d.car_model
FROM person AS p
JOIN drivers_license AS d
    ON p.license_id = d.id;
