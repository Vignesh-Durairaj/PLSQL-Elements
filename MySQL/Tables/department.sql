-- Table for holding the DEPARTMENT details in an organization.

CREATE TABLE `department` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(100) NOT NULL,
  `date_intiated` date DEFAULT (CURRENT_DATE)
);