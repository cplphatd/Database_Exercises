SELECT concat(emp_no, ' - ', last_name, ', ', first_name) AS 'Full name',
  birth_date AS 'DOB'
FROM employees
LIMIT 10;