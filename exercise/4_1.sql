-- create database assignment4
-- \c assignment4
-- \i [filepath]\4_1.sql

drop table student;

CREATE TABLE student (
    name VARCHAR(50),
    id VARCHAR(50) PRIMARY KEY,
    admission_year INT,
    dept_name VARCHAR(50),
    phone_number VARCHAR(11),
    address VARCHAR(50),
    tot_credits FLOAT DEFAULT 0,
    average_gpa FLOAT DEFAULT 0.0,
    is_enrolled BOOLEAN DEFAULT TRUE
);