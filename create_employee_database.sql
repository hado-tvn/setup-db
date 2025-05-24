-- Create Employee Database Schema
-- This script creates a comprehensive employee management database

-- Create database (run this separately as a superuser)
-- CREATE DATABASE employee;

-- Connect to employee database and create schema
-- \c employee;

-- Create employees table (central table)
CREATE TABLE IF NOT EXISTS public.employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20),
    date_of_birth DATE,
    hire_date DATE NOT NULL DEFAULT CURRENT_DATE,
    employment_status VARCHAR(50) DEFAULT 'Active',
    department VARCHAR(100)
);

-- Create addresses table
CREATE TABLE IF NOT EXISTS public.addresses (
    address_id SERIAL PRIMARY KEY,
    employee_id INTEGER NOT NULL,
    address_line1 VARCHAR(255) NOT NULL,
    city VARCHAR(100),
    country VARCHAR(100),
    address_type VARCHAR(50) DEFAULT 'Home',
    FOREIGN KEY (employee_id) REFERENCES public.employees(employee_id) ON DELETE CASCADE
);

-- Create awards table
CREATE TABLE IF NOT EXISTS public.awards (
    award_id SERIAL PRIMARY KEY,
    employee_id INTEGER NOT NULL,
    achievement_type VARCHAR(100),
    award_name VARCHAR(255) NOT NULL,
    date_received DATE NOT NULL DEFAULT CURRENT_DATE,
    FOREIGN KEY (employee_id) REFERENCES public.employees(employee_id) ON DELETE CASCADE
);

-- Create loans table
CREATE TABLE IF NOT EXISTS public.loans (
    loan_id SERIAL PRIMARY KEY,
    employee_id INTEGER NOT NULL,
    loan_type VARCHAR(100),
    amount NUMERIC(15, 2) NOT NULL,
    interest_rate NUMERIC(5, 2),
    FOREIGN KEY (employee_id) REFERENCES public.employees(employee_id) ON DELETE CASCADE
);

-- Create roles table
CREATE TABLE IF NOT EXISTS public.roles (
    role_id SERIAL PRIMARY KEY,
    employee_id INTEGER NOT NULL,
    reporting_to INTEGER,
    role_title VARCHAR(255),
    department VARCHAR(100),
    FOREIGN KEY (employee_id) REFERENCES public.employees(employee_id) ON DELETE CASCADE,
    FOREIGN KEY (reporting_to) REFERENCES public.employees(employee_id) ON DELETE SET NULL
);

-- Create salary_details table
CREATE TABLE IF NOT EXISTS public.salary_details (
    salary_id SERIAL PRIMARY KEY,
    employee_id INTEGER NOT NULL,
    base_salary NUMERIC(15, 2) NOT NULL,
    bonus NUMERIC(15, 2) DEFAULT 0,
    effective_date DATE NOT NULL DEFAULT CURRENT_DATE,
    FOREIGN KEY (employee_id) REFERENCES public.employees(employee_id) ON DELETE CASCADE
);

-- Create work_history table
CREATE TABLE IF NOT EXISTS public.work_history (
    work_history_id SERIAL PRIMARY KEY,
    employee_id INTEGER NOT NULL,
    company_name VARCHAR(255),
    position_held VARCHAR(255),
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (employee_id) REFERENCES public.employees(employee_id) ON DELETE CASCADE
);

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_employees_email ON public.employees(email);
CREATE INDEX IF NOT EXISTS idx_employees_department ON public.employees(department);
CREATE INDEX IF NOT EXISTS idx_addresses_employee_id ON public.addresses(employee_id);
CREATE INDEX IF NOT EXISTS idx_awards_employee_id ON public.awards(employee_id);
CREATE INDEX IF NOT EXISTS idx_loans_employee_id ON public.loans(employee_id);
CREATE INDEX IF NOT EXISTS idx_roles_employee_id ON public.roles(employee_id);
CREATE INDEX IF NOT EXISTS idx_roles_reporting_to ON public.roles(reporting_to);
CREATE INDEX IF NOT EXISTS idx_salary_details_employee_id ON public.salary_details(employee_id);
CREATE INDEX IF NOT EXISTS idx_work_history_employee_id ON public.work_history(employee_id);

-- Add comments to tables
COMMENT ON TABLE public.employees IS 'Main employee information table';
COMMENT ON TABLE public.addresses IS 'Employee addresses (home, office, etc.)';
COMMENT ON TABLE public.awards IS 'Employee awards and achievements';
COMMENT ON TABLE public.loans IS 'Employee loans and financial assistance';
COMMENT ON TABLE public.roles IS 'Employee roles and reporting structure';
COMMENT ON TABLE public.salary_details IS 'Employee salary and compensation history';
COMMENT ON TABLE public.work_history IS 'Employee previous work experience';

-- Add column comments
COMMENT ON COLUMN public.employees.employment_status IS 'Active, Inactive, Terminated, etc.';
COMMENT ON COLUMN public.addresses.address_type IS 'Home, Office, Emergency Contact, etc.';
COMMENT ON COLUMN public.loans.interest_rate IS 'Annual interest rate as percentage';
COMMENT ON COLUMN public.roles.reporting_to IS 'Employee ID of direct supervisor';
COMMENT ON COLUMN public.salary_details.effective_date IS 'Date when this salary became effective'; 