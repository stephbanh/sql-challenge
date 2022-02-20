

-- DROP DATABASE IF EXISTS employees;


--if necessary for testing
--CREATE DATABASE employees
    --WITH 
    --OWNER = postgres
    --ENCODING = 'UTF8'
    --LC_COLLATE = 'English_United States.1252'
    --LC_CTYPE = 'English_United States.1252'
    --TABLESPACE = pg_default
    --CONNECTION LIMIT = -1;

--privledges were added due to file permission issues
--ALTER DEFAULT PRIVILEGES
--GRANT ALL ON TABLES TO pg_database_owner;

--ALTER DEFAULT PRIVILEGES
--GRANT ALL ON TABLES TO postgres;

-- if necessary for testing
-- cascade needed to clear away keys 
DROP TABLE IF EXISTS departments cascade;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employee_info cascade;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
CREATE TABLE "departments" (
    "dept_no" text   NOT NULL,
    "dept_name" text   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" text   NOT NULL
);

CREATE TABLE "employee_info" (
    "emp_no" int   NOT NULL,
    "emp_title" text NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" text   NOT NULL,
    "last_name" text   NOT NULL,
    "sex" text   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employee_info" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "dept_manager" (
    "dept_no" text   NOT NULL,
    "emp_no" int   NOT NULL
);

CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL
);

CREATE TABLE "titles" (
    "title_id" text   NOT NULL,
    "title" text   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

-- a way to do the imports manually 
-- pg admin does allow for this with its own features but for the sake of showing how to import, this was included
-- this also must be done before any foreign keys, else there will be issues

COPY departments
FROM 'C:\Users\steph\DataClass\UCI-VIRT-DATA-PT-11-2021-U-C\Homework\09-SQL\Instructions\data\departments.csv'
DELIMITER ','
CSV HEADER;

COPY dept_emp
FROM 'C:\Users\steph\DataClass\UCI-VIRT-DATA-PT-11-2021-U-C\Homework\09-SQL\Instructions\data\dept_emp.csv'
DELIMITER ','
CSV HEADER;

COPY dept_manager
FROM 'C:\Users\steph\DataClass\UCI-VIRT-DATA-PT-11-2021-U-C\Homework\09-SQL\Instructions\data\dept_manager.csv'
DELIMITER ','
CSV HEADER;

COPY employee_info
FROM 'C:\Users\steph\DataClass\UCI-VIRT-DATA-PT-11-2021-U-C\Homework\09-SQL\Instructions\data\employees.csv'
DELIMITER ','
CSV HEADER;

COPY salaries
FROM 'C:\Users\steph\DataClass\UCI-VIRT-DATA-PT-11-2021-U-C\Homework\09-SQL\Instructions\data\salaries.csv'
DELIMITER ','
CSV HEADER;

COPY titles
FROM 'C:\Users\steph\DataClass\UCI-VIRT-DATA-PT-11-2021-U-C\Homework\09-SQL\Instructions\data\titles.csv'
DELIMITER ','
CSV HEADER;

-- foreign keys are added here to allow for the import
--these were also taken from QuickDBD
ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employee_info" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employee_info" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employee_info" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employee_info" ("emp_no");




