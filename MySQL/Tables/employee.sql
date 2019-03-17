-- Table for holding the EMPLOYEE details in an organization.
/*
 * Also holds the MANAGER_ID, which is a self pointing foreign key within the same table
 * Holds the DEPARTMENT_ID, which is reference from the DEPARTMENT tables DEPARTMENT_ID
 */

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `date_of_joining` date DEFAULT (CURRENT_DATE),
  `department_id` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL
);