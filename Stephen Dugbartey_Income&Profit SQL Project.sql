-- CREATING BANK REVENUE AND PRODUCT PROFITABILITY DATABASE AND TABLES
create database Branch_Rev_Prof_Database;
Use Branch_Rev_Prof_Database;

create table Branch_List
(
	branch_code int primary key,
    branch_name varchar (50),
    branch_location varchar (50),
    branch_manager_name varchar (50),
    branch_region varchar (50),
    province varchar (20),
    open_date date,
    branch_status varchar (10)
);
insert into Branch_List (branch_code, branch_name, branch_location, branch_manager_name, branch_region, province, open_date, branch_status)
values
(001, 'Bow Valley Branch', 'Bow Valley', 'Emery Elliott', 'Calgary', 'AB', '2004-01-09', 'Open'),
(002, 'Calgary Rural Branch', 'Calgary Rural', 'Stella Duncan', 'Calgary', 'AB', '2005-01-03', 'Open'),
(003, 'Calgary West Branch', 'Calgary West', 'Amari Correa', 'Calgary', 'AB', '2005-06-13', 'Open'),
(004, 'Calgary South Branch', 'Calgary South', 'Kimber Strong', 'Calgary', 'AB', '2012-10-10', 'Open'),
(005, 'Mosaic Branch', 'Mosaic', 'Fallon Edwards', 'Calgary', 'AB', '2013-04-01', 'Open'),
(006, 'Calgary Foothills Branch', 'Calgary Foothills', 'Jemma Rosario', 'Calgary', 'AB', '2013-04-25','Open'),
(007, 'Lloydminster Branch', 'Lloydminster', 'Zariyah Roach', 'Central', 'AB', '2007-11-07', 'Open'),
(008, 'Wetaskiwin Branch', 'Wetaskiwin', 'Liberty Jenkins', 'Central', 'AB', '2012-04-24', 'Open'),
(009, 'Camrose Branch', 'Camrose', 'Mya Lane', 'Central', 'AB', '2013-05-03', 'Open'),
(010, 'Drayton Valley Branch', 'Drayton Valley', 'Skyla Boyd', 'Central', 'AB', '2014-12-31', 'Open'),
(011, 'Rocky Mountain Branch', 'Rocky Mountain', 'Kora Lu', 'Calgary', 'AB','2015-02-24', 'Open'),
(012, 'Red Deer Branch', 'Red Deer', 'Elina Sellers', 'Central', 'AB', '2017-08-30', 'Open'),
(013, 'Edmonton North Branch', 'Edmonton North', 'Amanda Sloan', 'Edmonton', 'AB', '2018-02-21', 'Open'),
(014, 'Edmonton South Branch', 'Edmonton South', 'Lyric Jenkins', 'Edmonton', 'AB', '2019-03-29', 'Open'),
(015, 'Leduc Branch', 'Leduc', 'Ivanna Berry', 'Edmonton', 'AB', '2020-06-29', 'Open'),
(016, 'Sherwood Park Branch', 'Sherwood', 'Blair Keith', 'Edmonton', 'AB', '2021-09-03', 'Open'),
(017, 'St. Albert Branch', 'St. Albert', 'Kira Parra', 'Edmonton', 'AB', '2021-09-13', 'Open'),
(018, 'Northwest Branch', 'Northwest', 'Anika Hicks', 'North', 'AB', '2021-09-21', 'Open'),
(019, 'Lakeland Branch', 'Lakeland', 'Marilyn Burch', 'North', 'AB', '2021-12-31', 'Open'),
(020, 'Bonnyvile Branch', 'Bonnyville', 'Amoura Potter', 'North', 'AB', '2022-10-14', 'Open'),
(021, 'Cold Lake Branch', 'Cold Lake', 'Blake Rich', 'North', 'AB', '2023-09-26', 'Open'),
(022, 'Wood Buffalo Branch', 'Wood Buffalo', 'Avery Mullen', 'North', 'AB', '2024-05-31', 'Open'),
(023, 'Grand Prairie Branch', 'Grand Prairie', 'Zakai Doyle', 'North', 'AB', '2024-01-24', 'Open'),
(024, 'Bighorn Branch', 'Bighorn', 'Caspian Palmer', 'North', 'AB', '2021-08-06', 'Open'),
(025, 'Aspen Branch', 'Aspen', 'Declan Bradshaw', 'North', 'AB', '2019-12-24', 'Open'),
(026, 'Borealis Branch', 'Borealis', 'Duncan O’Connor', 'North', 'AB', '2013-05-03', 'Open'),
(027, 'Mcleod River Branch', 'Mcleod River', 'Jedidiah Lu', 'North', 'AB', '2007-11-07', 'Open'),
(028, 'Chinook Branch', 'Chinook', 'Dean Rowe', 'South', 'AB', '2015-02-24', 'Open'),
(029, 'Palliser Branch', 'Palliser', 'Gerald Wong', 'South', 'AB', '2020-06-29', 'Open');
update branch_list set branch_code = 15, branch_name = 'Leduc Branch', branch_region = 'Edmonton', branch_manager_name = 'Ivanna Berry' where branch_code = 15;

select * from branch_rev_prof_database.branch_list;

create table Product_List
(
	product_id int primary key,
    product_name varchar (25),
    product_category varchar (50),
    product_risk_rating varchar (20),
    launch_date date
);
alter table branch_rev_prof_database.Product_List modify product_id varchar (5);
insert into Product_List (product_id, product_name, product_category, product_risk_rating, launch_date)
values
('P1', 'Checking', 'Deposit', 2, '2004-01-09'),
('P2', 'Saving', 'Deposit', 1, '2004-01-09'),
('P3', 'Personal Loan', 'Loan', 3, '2004-01-09'),
('P4', 'Mortgage','Loan', 3,'2004-01-09'),
('P5', 'Credit Card', 'Cards', 3, '2004-01-09'),
('P6', 'Line of Credit', 'Loans', 3, '2004-01-09'),
('P7', 'GIC', 'Deposit', 2, '2004-01-09');
select * from branch_rev_prof_database.product_list;

create table Segment_List
(
	segment_id int primary key,
    segment_name varchar (25),
    segment_description varchar (50),
    segment_risk_rating varchar (50)
);
alter table branch_rev_prof_database.segment_list modify segment_id varchar (5);
insert into segment_list (segment_id, segment_name, segment_description, segment_risk_rating)
values
('SEG1', 'Retail', 'Focus on individuals', 2),
('SEG2', 'SME', 'Focus on small and medium sized enterprises', 2),
('SEG3', 'Corporate', 'Focus on  large corporations', 3),
('SEG4', 'Prestige', 'Focus on high networth individuals', 1);
select * from segment_list;

select * from income_statement_summary;
select * from product_income;
select * from product_cost;
select * from branch_list;
select * from segment_list;
select * from segment_income;
select * from product_list;


select branch_code, branch_name, reporting_period, total_income, operating_expense, net_profit_or_loss from income_statement_summary;

-- BRANCH PROFITABILITY
select income_statement_summary.branch_code, income_statement_summary.branch_name, branch_list.branch_manager_name, income_statement_summary.reporting_period, income_statement_summary.total_income, income_statement_summary.operating_expense, income_statement_summary.net_profit_or_loss 
from income_statement_summary 
left join branch_list 
on income_statement_summary.branch_name=branch_list.branch_name
order by net_profit_or_loss desc;

-- PRODUCT PROFITABILITY
select product_income.branch_code, product_income.branch_name, product_income.reporting_period, 
round((product_income.checking_income - product_cost.checking_cost), 2) as checking_profit,
round((product_income.savings_income - product_cost.savings_cost), 2) as savings_profit,
round((product_income.personal_loan_income - product_cost.personal_loan_cost), 2) as personal_income_profit,
round((product_income.mortgage_income - mortgage_cost), 2) as mortgage_profit,
round((product_income.credit_card_income - product_cost.credit_card_cost), 2) as credit_card_profit,
round((product_income.line_of_credit_income - product_cost.line_of_credit_cost), 2) as line_of_credit_profit,
round((product_income.GIC_income - product_cost.GIC_cost), 2) as GIC_profit
from product_income
left join product_cost 
on product_income.branch_code = product_cost.branch_code
order by checking_profit desc;

-- SEGMENT INCOME
select segment_name, round(sum(segment_income), 2) as segment_income
from segment_income
group by segment_name;

-- REGIONAL PROFITABILITY
select branch_list.branch_region, round(sum(income_statement_summary.net_profit_or_loss), 2) as region_profit
from branch_list
left join income_statement_summary
on branch_list.branch_name = income_statement_summary.branch_name
group by branch_region;





