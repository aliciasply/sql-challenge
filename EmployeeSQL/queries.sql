SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM titles;
SELECT * FROM salaries;

-- Data Analysis
-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT * FROM employees; -- emp_no, last_name, first_name, sex
SELECT * FROM salaries; -- salary
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary 
FROM employees AS emp
INNER JOIN salaries AS sal ON
emp.emp_no=sal.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT * FROM employees; -- first_name, last_name, hire_date
SELECT emp.first_name, emp.last_name, emp.hire_date 
FROM employees AS emp
WHERE extract(year from hire_date) = 1986
ORDER BY emp.first_name, emp.last_name, emp.hire_date 

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT * FROM departments; -- dept_no, dept_name
SELECT * FROM dept_manager; -- dept_no, emp_no
SELECT * FROM dept_emp; -- emp_no, dept_no
SELECT * FROM employees; -- emp_no, first_name, last_name

-- department number, department name, the manager's employee number, last name, first name.
SELECT dept.dept_no, dept.dept_name, 
	emp.emp_no, emp.last_name, emp.first_name
FROM employees AS emp
	INNER JOIN dept_emp ON dept_emp.emp_no = emp.emp_no
	INNER JOIN departments AS dept ON dept.dept_no = dept_emp.dept_no
	INNER JOIN dept_manager AS dman ON dman.emp_no = emp.emp_no
ORDER BY dept.dept_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT * FROM employees; -- emp_no, last_name, first_name
SELECT * FROM departments; -- dept_no, dept_name
SELECT * FROM dept_emp; -- emp_no, dept_no

SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM employees AS emp
	INNER JOIN dept_emp ON dept_emp.emp_no = emp.emp_no
	INNER JOIN departments AS dept ON dept.dept_no = dept_emp.dept_no
ORDER BY emp.emp_no, emp.last_name, emp.first_name, dept.dept_name;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees; -- first_name, last_name, sex, Hercules, B

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT * FROM departments; -- dept_no, dept_name, sales dept_no is d007
SELECT * FROM dept_emp;  -- emp_no, dept_no
SELECT * FROM employees; -- emp_no, last_name, first_name

SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM employees AS emp
	INNER JOIN dept_emp ON dept_emp.emp_no = emp.emp_no
	INNER JOIN departments AS dept ON dept.dept_no = dept_emp.dept_no
WHERE dept.dept_no = 'd007'
ORDER BY emp.emp_no, emp.last_name, emp.first_name, dept.dept_name;

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT * FROM departments; -- dept_no, dept_name, sales dept_no is d007, development dept_no is d005
SELECT * FROM dept_emp;  -- emp_no, dept_no
SELECT * FROM employees; -- emp_no, last_name, first_name

SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM employees AS emp
	INNER JOIN dept_emp ON dept_emp.emp_no = emp.emp_no
	INNER JOIN departments AS dept ON dept.dept_no = dept_emp.dept_no
WHERE dept.dept_no IN ('d007', 'd005')
ORDER BY emp.emp_no, dept.dept_name, emp.last_name, emp.first_name;

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT * FROM employees;

SELECT last_name, COUNT(first_name) AS shared_last_name_frequency
FROM employees
GROUP BY last_name
ORDER BY shared_last_name_frequency DESC;

