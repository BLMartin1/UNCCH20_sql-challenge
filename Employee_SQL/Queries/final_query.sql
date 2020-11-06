--FINAL ANALYSIS QUERY

--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT*
FROM employees

SELECT*
FROM salaries

SELECT employees.emp_no, last_name, first_name, sex, salaries
FROM salaries
INNER JOIN employees ON
	employees.emp_no=salaries.emp_no;
	
--List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees WHERE
	hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT departments.dept_no,
	departments.dept_name,
	department_managers.emp_no,
	employees.last_name,
	employees.first_name
FROM departments
INNER JOIN department_managers ON
	department_managers.dept_no = departments.dept_no
INNER JOIN employees ON
	employees.emp_no = department_managers.emp_no;
--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
INNER JOIN department_employees ON 
	employees.emp_no = department_employees.emp_no
INNER JOIN departments ON 
	department_employees.dept_no = departments.dept_no;
-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name,
	last_name,
	sex
FROM employees WHERE 
	first_name = 'Hercules'
	AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no,
	last_name,
	first_name,
	dept_name
FROM employees
INNER JOIN department_employees ON
	employees.emp_no = department_employees.emp_no
INNER JOIN departments ON
	department_employees.dept_no = departments.dept_no
	WHERE dept_name = 'Sales'

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no,
	last_name,
	first_name,
	dept_name
FROM employees
INNER JOIN department_employees ON
	employees.emp_no = department_employees.emp_no
INNER JOIN departments ON
	department_employees.dept_no = departments.dept_no
	WHERE dept_name = 'Sales' OR dept_name = 'Development'

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT DISTINCT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;