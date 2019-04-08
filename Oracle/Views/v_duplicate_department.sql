CREATE OR REPLACE 
VIEW v_duplicate_department AS 
    SELECT 
        department_id, department_name 
    FROM department 
    WHERE 
        UPPER(department_name) in (
            SELECT UPPER(department_name) FROM department 
            GROUP BY UPPER(department_name) 
            HAVING COUNT(UPPER(department_name)) > 1);