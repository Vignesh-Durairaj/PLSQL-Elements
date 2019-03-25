/*
 * A function that returns the grade of an employee based on the time they are with the company
 */

CREATE OR REPLACE
FUNCTION get_employee_grade (p_emp_id NUMBER) 
RETURN VARCHAR2 
IS 
    v_manager_id    employee.manager_id%TYPE;
    v_doj           employee.date_of_joining%TYPE;
    v_emp_cnt       NUMBER;
    v_grade         VARCHAR2(1);
BEGIN
    
    v_grade := NULL;
    
    SELECT COUNT(1) INTO v_emp_cnt FROM employee WHERE employee_id = p_emp_id;
    
    IF v_emp_cnt > 0 THEN
        SELECT manager_id, TRUNC(date_of_joining) 
        INTO v_manager_id, v_doj
        FROM employee 
        WHERE 
            employee_id = p_emp_id;
        
        v_grade := CASE 
                      WHEN v_manager_id = p_emp_id THEN '1'
                      WHEN TRUNC(SYSDATE) - v_doj > 365 THEN '4'
                      WHEN TRUNC(SYSDATE) - v_doj > 730 THEN '3'
                      WHEN TRUNC(SYSDATE) - v_doj > 1825 THEN '2'
                      ELSE '5'
                    END;
    END IF;
    
    RETURN v_grade;
END get_employee_grade;
/