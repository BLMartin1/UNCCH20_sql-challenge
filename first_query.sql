CREATE TABLE Departments (
    dept_no VARCHAR NOT NULL,
    dept_name VARCHAR(225) NOT NULL,
    PRIMARY KEY (dept_no)
);
CREATE TABLE Titles (
    title_no VARCHAR NOT NULL,
    title VARCHAR(255) NOT NULL,
    PRIMARY KEY (title_no)
);
CREATE TABLE Employees (
    emp_no INTEGER NOT NULL,
    title_no VARCHAR NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    sex VARCHAR NULL,
    hire_date DATE NOT NULL,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (title_no) REFERENCES Titles (title_no)
);
CREATE TABLE Salaries (
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    PRIMARY KEY (emp_no)
);
CREATE TABLE Department_Employees (
    emp_no INT NOT NULL,
    dept_no VARCHAR NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES Employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES Departments (dept_no)
);
CREATE TABLE Department_Managers (
    dept_no VARCHAR NOT NULL,
    emp_no INT NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES Departments (dept_no),
    FOREIGN KEY (emp_no) REFERENCES Employees (emp_no)
);