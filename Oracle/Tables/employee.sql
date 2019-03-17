/* Table for holding the EMPLOYEE details in an organization.
 * 
 * Also holds the MANAGER_ID, which is a self pointing foreign key within the same table
 * Holds the DEPARTMENT_ID, which is reference from the DEPARTMENT tables DEPARTMENT_ID
 */

CREATE TABLE employee (
  employee_id 		NUMBER 			NOT NULL,
  first_name 		VARCHAR2(50) 	NOT NULL,
  middle_name 		VARCHAR2(50),
  last_name 		VARCHAR2(50) 	NOT NULL,
  date_of_birth 	DATE,
  date_of_joining 	DATE 			DEFAULT SYSDATE,
  department_id 	NUMBER,
  manager_id 		NUMBER
);