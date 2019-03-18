/*
 * A function that returns the manager id for the input employee id passed as argument
 */
 
CREATE OR REPLACE
FUNCTION get_manager_id (p_emp_id NUMBER)
RETURN NUMBER
IS
	v_manager_id	employee.manager_id%type;
	v_count			  NUMBER;
BEGIN
	SELECT COUNT(1) INTO v_count FROM employee WHERE employee_id = p_emp_id;
	
	IF v_count > 0 THEN
		SELECT
			manager_id INTO v_manager_id
		FROM employee
		WHERE manager_id = p_emp_id;
	ELSE
		v_manager_id := NULL;
	END IF;
	
	RETURN v_manager_id;
END;
/