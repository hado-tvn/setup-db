-- Sample Data for Employee Database
-- This script inserts sample data into all tables

-- Insert sample employees
INSERT INTO public.employees (first_name, last_name, email, phone, date_of_birth, hire_date, employment_status, department) VALUES
('John', 'Doe', 'john.doe@company.com', '+1-555-0101', '1985-03-15', '2020-01-15', 'Active', 'Engineering'),
('Jane', 'Smith', 'jane.smith@company.com', '+1-555-0102', '1990-07-22', '2021-03-01', 'Active', 'Marketing'),
('Mike', 'Johnson', 'mike.johnson@company.com', '+1-555-0103', '1988-11-08', '2019-06-10', 'Active', 'Sales'),
('Emily', 'Brown', 'emily.brown@company.com', '+1-555-0104', '1992-04-18', '2022-01-20', 'Active', 'HR'),
('David', 'Wilson', 'david.wilson@company.com', '+1-555-0105', '1983-09-03', '2018-04-12', 'Active', 'Finance'),
('Sarah', 'Lee', 'sarah.lee@company.com', '+1-555-0106', '1991-12-25', '2020-08-05', 'Active', 'Engineering'),
('Robert', 'Taylor', 'robert.taylor@company.com', '+1-555-0107', '1987-06-14', '2019-11-18', 'Inactive', 'Operations');

-- Insert sample addresses
INSERT INTO public.addresses (employee_id, address_line1, city, country, address_type) VALUES
(1, '123 Main St', 'New York', 'USA', 'Home'),
(1, '456 Corporate Blvd', 'New York', 'USA', 'Office'),
(2, '789 Oak Ave', 'Los Angeles', 'USA', 'Home'),
(3, '321 Pine St', 'Chicago', 'USA', 'Home'),
(4, '654 Elm Dr', 'Houston', 'USA', 'Home'),
(5, '987 Cedar Ln', 'Phoenix', 'USA', 'Home'),
(6, '147 Maple St', 'Philadelphia', 'USA', 'Home'),
(7, '258 Birch Ave', 'San Antonio', 'USA', 'Home');

-- Insert sample awards
INSERT INTO public.awards (employee_id, achievement_type, award_name, date_received) VALUES
(1, 'Performance', 'Employee of the Month', '2023-06-01'),
(2, 'Innovation', 'Marketing Excellence Award', '2023-08-15'),
(3, 'Sales', 'Top Sales Performer Q3', '2023-09-30'),
(1, 'Leadership', 'Team Leadership Award', '2023-12-01'),
(5, 'Service', '5 Years Service Award', '2023-04-12'),
(6, 'Innovation', 'Technical Innovation Award', '2023-10-20');

-- Insert sample loans
INSERT INTO public.loans (employee_id, loan_type, amount, interest_rate) VALUES
(1, 'Education Loan', 15000.00, 3.5),
(3, 'Emergency Loan', 5000.00, 2.0),
(4, 'Housing Loan', 25000.00, 4.0),
(5, 'Vehicle Loan', 12000.00, 3.8),
(6, 'Personal Loan', 8000.00, 4.5);

-- Insert sample roles
INSERT INTO public.roles (employee_id, reporting_to, role_title, department) VALUES
(1, 6, 'Senior Software Engineer', 'Engineering'),
(2, NULL, 'Marketing Manager', 'Marketing'),
(3, NULL, 'Sales Director', 'Sales'),
(4, NULL, 'HR Manager', 'HR'),
(5, NULL, 'Finance Director', 'Finance'),
(6, NULL, 'Engineering Manager', 'Engineering'),
(7, 5, 'Operations Specialist', 'Operations');

-- Insert sample salary details
INSERT INTO public.salary_details (employee_id, base_salary, bonus, effective_date) VALUES
(1, 95000.00, 8000.00, '2023-01-01'),
(2, 85000.00, 6000.00, '2023-01-01'),
(3, 110000.00, 15000.00, '2023-01-01'),
(4, 75000.00, 4000.00, '2023-01-01'),
(5, 120000.00, 18000.00, '2023-01-01'),
(6, 130000.00, 20000.00, '2023-01-01'),
(7, 65000.00, 3000.00, '2023-01-01'),
-- Previous salary records for some employees
(1, 85000.00, 5000.00, '2022-01-01'),
(3, 100000.00, 12000.00, '2022-01-01'),
(5, 110000.00, 15000.00, '2022-01-01');

-- Insert sample work history
INSERT INTO public.work_history (employee_id, company_name, position_held, start_date, end_date) VALUES
(1, 'TechCorp Inc', 'Software Developer', '2018-06-01', '2019-12-31'),
(1, 'StartupXYZ', 'Junior Developer', '2017-01-15', '2018-05-31'),
(2, 'Marketing Pro LLC', 'Marketing Coordinator', '2019-03-01', '2021-02-28'),
(3, 'Sales Solutions Inc', 'Sales Representative', '2016-08-01', '2019-06-09'),
(4, 'HR Consultants Ltd', 'HR Assistant', '2020-01-01', '2022-01-19'),
(5, 'Financial Services Corp', 'Financial Analyst', '2015-09-01', '2018-04-11'),
(6, 'Software Systems LLC', 'Lead Developer', '2016-04-01', '2020-08-04'),
(7, 'Operations Excellence Inc', 'Operations Coordinator', '2017-02-01', '2019-11-17'); 