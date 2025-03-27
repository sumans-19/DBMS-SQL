CREATE DATABASE COMPANY;
USE COMPANY;

CREATE TABLE EMPLOYEE(SSN INT PRIMARY KEY , NAME VARCHAR2(20),ADDRESS VARCHAR2(20),GENDER VARCHAR(20) , SALARY INT , SUPER_SSN INT REFERENCES EMPLOYEE(SSN) ON DELETE CASCADE );
CREATE TABLE DEPARTMENT(DNO INT PRIMARY KEY , DNAME VARCHAR2(20) , MGRSSN INT REFERENCES EMPLOYEE(SSN) ON DELETE CASCADE , MGRSTARTDATE INT);
CREATE TABLE DLOCATION(DNO INT REFERENCES DEPARTMENT(DNO) ON DELETE CASCADE , DLOC VARCHAR(20) );
CREATE TABLE PROJECT(PNO INT PRIMARY KEY , PNAME VARCHAR2(20) , PLOCATION VARCHAR2(20) , DNO INT REFERENCES DEPARTMENT(DNO) ON DELETE CASCADE);
CREATE TABLE WORKS_ON (SSN INT REFERENCES EMPLOYEE(SSN) ON DELETE CASCADE  , PNO INT REFERENCES PROJECT(PNO) ON DELETE CASCADE, HOURS INT );


INSERT INTO EMPLOYEE VALUES
