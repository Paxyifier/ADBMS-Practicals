-- create a table employee with attributes emp_id, emp_name, dept, emp_salary, dept_location
-- attribute salary should have basic, da, hra, p
-- attribute dept_location should have city, state, pincode
CREATE TYPE salaryType AS OBJECT(
    basic NUMBER(10,2),
    da NUMBER(10,2),
    hra NUMBER(10,2),
    pf NUMBER(10,2)
);
CREATE OR REPLACE TYPE locationType AS OBJECT(
    city VARCHAR2(20),
    state VARCHAR2(20),
    pincode NUMBER(6)
);

CREATE TABLE employee_adt_prathamesh(
    emp_id NUMBER(6),
    emp_name VARCHAR2(20),
    dept VARCHAR2(20),
    emp_salary salaryType,
    dept_location locationType
);
INSERT INTO employee_adt_prathamesh VALUES (10001, 'Employee 1','Dep1',salaryType(40000.00,13000.00,12000.00,15000.00),locationType('Chembur','Maharashtra',400001));

SELECT * FROM employee_adt_prathamesh;
SELECT 'Employee ID is  '||emp_id||' AND Employee Name is '|| emp_name AS op FROM employee_adt_prathamesh;
SELECT 'Employee '|| emp_name || ' earns '|| e.emp_salary.basic || ' as basic. ' AS op FROM employee_adt_prathamesh e;

SELECT 'Employee '|| emp_name || ' earns '|| e.emp_salary.basic+e.emp_salary.da+e.emp_salary.hra || ' in total. ' AS op FROM employee_adt_prathamesh e;