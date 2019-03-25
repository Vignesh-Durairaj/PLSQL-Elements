-- Deletes the department entry from the master table and remove any references in the employee or other related tables

CREATE OR REPLACE 
PROCEDURE p_remove_department (p_dept_id NUMBER) AS
BEGIN
    
    UPDATE employee SET department_id = NULL WHERE department_id = p_dept_id;
    
    DELETE FROM department WHERE DEPARTMENT_ID = p_dept_id;
    
END p_remove_department;
/