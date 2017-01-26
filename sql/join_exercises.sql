# Using the example in the Associative Table Joins section as a guide, write a query that shows each department along
# with the name of the current manager for that department.

SELECT
  departments.dept_name                                  AS 'Department Name',
  concat(employees.first_name, ' ', employees.last_name) AS 'Department Manager'
FROM employees
  JOIN dept_manager
    ON employees.emp_no = dept_manager.emp_no
  JOIN departments
    ON dept_manager.dept_no = departments.dept_no
WHERE dept_manager.to_date LIKE '9999%'
ORDER BY `Department Name`;

# Find the name of all departments currently managed by women.
SELECT
  departments.dept_name                                  AS 'Department Name',
  concat(employees.first_name, ' ', employees.last_name) AS 'Department Manager'
FROM employees
  JOIN dept_manager
    ON employees.emp_no = dept_manager.emp_no
  JOIN departments
    ON dept_manager.dept_no = departments.dept_no
WHERE dept_manager.to_date LIKE '9999%'
  AND employees.gender = 'f'
ORDER BY `Department Name`;

# Find the current titles of employees currently working in the Customer Service department.
SELECT
  t.title AS 'Title',
  count(e.first_name) AS 'Count'
FROM employees AS e
JOIN titles AS t
  ON e.emp_no = t.emp_no
JOIN dept_emp AS d
  ON e.emp_no = d.emp_no
WHERE d.dept_no = 'd009'
  AND t.to_date LIKE '9999%'
GROUP BY t.title;

# Find the current salary of all current managers.
SELECT
  d.dept_name AS 'Department Name',
  concat(e.first_name, ' ', e.last_name) AS 'Department Manager',
  s.salary AS 'Salary'
FROM employees AS e
  JOIN dept_manager AS dm
    ON e.emp_no = dm.emp_no
  JOIN departments AS d
    ON dm.dept_no = d.dept_no
  JOIN salaries AS s
    ON e.emp_no = s.emp_no
WHERE dm.to_date LIKE '9999%'
  AND s.to_date LIKE '9999%'
ORDER BY `Department Name`;

# Bonus Find the names of all current employees, their department name,
#  and their current manager's name.
SELECT
  concat(e.first_name, ' ', e.last_name) AS 'Employee Name',
  d.dept_name AS 'Department',
  concat(managers.first_name, ' ', managers.last_name) AS 'Manager'
FROM employees AS e
JOIN dept_emp AS de
  ON e.emp_no = de.emp_no
JOIN departments AS d
  ON de.dept_no = d.dept_no
JOIN dept_manager AS dm
  ON d.dept_no = dm.dept_no
JOIN employees AS managers
  ON dm.emp_no = managers.emp_no
WHERE de.to_date LIKE '9999%'
  AND dm.to_date LIKE '9999%'
ORDER BY Department;

