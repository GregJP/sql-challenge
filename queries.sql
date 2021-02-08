create table departments (
	dept_no varchar primary key,
	dept_name varchar);
	
create table titles (
	title_id varchar primary key,
	title varchar);

create table employees (
	emp_no int primary key,
	emp_title_id varchar,
	birth_date date,
	first_name varchar,
	last_name varchar,
	sex varchar,
	hire_date date,
	foreign key (emp_title_id) references titles(title_id));
	
create table dept_emp (
	emp_no int,
	dept_no varchar,
	foreign key (emp_no) references employees(emp_no),
	foreign key (dept_no) references departments(dept_no));
	
create table dept_manager (
	dept_no varchar,
	emp_no int,
	foreign key (dept_no) references departments(dept_no),
	foreign key (emp_no) references employees(emp_no));
	
create table salaries (
	emp_no int,
	salary int,
	foreign key (emp_no) references employees(emp_no));
	
-- Challenge 1
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees e
join salaries s
on (e.emp_no = s.emp_no);

-- Challenge 2
select first_name, last_name, hire_date
from employees
where hire_date between '1986-01-01' and '1986-12-31';

-- Challenge 3
select m.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
from dept_manager m
join departments d
on (m.dept_no=d.dept_no)
join employees e
on (m.emp_no=e.emp_no);

-- Challenge 4
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
join dept_emp m
on (e.emp_no=m.emp_no)
join departments d
on (m.dept_no=d.dept_no);

-- Challenge 5
select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%';

-- Challenge 6
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
join dept_emp p
on (e.emp_no=p.emp_no)
join departments d
on (p.dept_no=d.dept_no)
where dept_name = 'Sales';

-- Challenge 7
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
join dept_emp p
on (e.emp_no=p.emp_no)
join departments d
on (p.dept_no=d.dept_no)
where dept_name = 'Sales' or dept_name = 'Development';

-- Challenge 8
select last_name, count(last_name) as "Last Name Frequency"
from employees
group by last_name
order by "Last Name Frequency" DESC;