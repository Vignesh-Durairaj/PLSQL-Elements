/*
 * Table for holding the department in an organisations. This has the master list of departments
 */

CREATE TABLE department (
	department_id	NUMBER			NOT NULL,
	department_name	VARCHAR2(100)	NOT NULL, 
	active_from		DATE 			DEFAULT SYSDATE
);