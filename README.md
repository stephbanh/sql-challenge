#### Context

Providing queries and feedback to a hypotehtical company about its employees. These queries and subsequent database were made largely in the interest of the HR department.

#### Data Modeling

Inspected the CSVs and sketch out an ERD of the tables. Via [http://www.quickdatabasediagrams.com].

![Alt text](https://github.com/stephbanh/sql-for-hr/blob/main/Schema%20Visual.png)

#### Data Engineering

Created a table schema for each of the six CSV files. Assigned data types, primary keys, foreign keys, and other constraints.

Imported each CSV file into the corresponding SQL table. 

**Note** be sure to import the data in the same order that the tables were created and account for the headers when importing to avoid errors.

#### Data Analysis

Queries after completing database--

1. List the following details of each employee: employee number, last name, first name, sex, and salary.

2. List first name, last name, and hire date for employees who were hired in 1986.

3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

4. List the department of each employee with the following information: employee number, last name, first name, and department name.

5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

## In progress: Data Visualization via SQL Alchemy

Offered code via UCI

   ```sql
   from sqlalchemy import create_engine
   engine = create_engine('postgresql://localhost:5432/<your_db_name>')
   connection = engine.connect()
   ```

* Password is in gitignore

(Complete) Create a histogram to visualize the most common salary ranges for employees.
(Incomplete) Create a bar chart of average salary by title.
