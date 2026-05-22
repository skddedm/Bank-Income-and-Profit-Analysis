# Table of Content
* [1.0 Executive Summary](https://github.com/skddedm/Bank-Income-and-Profit-Analysis/blob/main/README.md#10-executive-summary)
* [2.0 Methodology](https://github.com/skddedm/Bank-Income-and-Profit-Analysis/blob/main/README.md#20-methodology)
* [3.0 Project Outcomes](https://github.com/skddedm/Bank-Income-and-Profit-Analysis/blob/main/README.md#30-project-outcomes)
* [4.0 Details of Key Performance Areas Identified](https://github.com/skddedm/Bank-Income-and-Profit-Analysis/edit/main/README.md#30-project-outcomes)
* [5.0 Strategy Recommendation](https://github.com/skddedm/Bank-Income-and-Profit-Analysis/edit/main/README.md#50-strategy-recommendations)

# 1.0 Executive Summary
Banks cannot exist without the customer. It needs to make enough income and profit to be able to operate into the foreseable future at the minimum risk acceptable. The bank’s operations in the country is broken into provinces, regions and branches. Each of these divisions perform financially to positively impact the bank-wide financial performance. An imaginary bank - Assurance Bank was used in this project.

### 1.1 Problem Statement:
The Alberta province of the bank has not met its income and profit KPI for some business areas for the financial year 2025

### 1.2 Project Objective:
The objective of this project analyzes the performance of the bank at the branch, regional and provincial levels in order to optimize cost and improve profitability through appropriate pricing and cost strategies. The key determinants are:
* Provincial Level: Determine the top and worst profitable branches within the province of Alberta. 
* Regional Level: Determine top and worst income-generating and profitable regions in the province of Alberta
* Branch Level: Determine the most and least profitable products for each branch to aid product scaling or retiring decisions
* Segment Level: Determine the top and worst income-generating and profitable segments in the province of Alberta
* Establish reasons for the worst performing products, branches, segments and regions 
* Recommend management strategies to deploy to aid weaker performing products, branches, segments and regions improve performance

### 1.3 Project Scope:
* The province of Alberta is the focus 
* The province of Alberta is divided into 5 business regions as below:
<img width="687" height="150" alt="image" src="https://github.com/user-attachments/assets/584e803c-4236-46bb-8a47-0d20e7c47a31" />

* 29 branches operate within the province
* 4 customer segments exist
* 7 products are run across the province

Tools Deployed:
* SQL
* Microsoft Excel
* Pivot Tables
* Excel charts

Summary Project Findings:
5 strengths and 3 weaknesses were identified with bank’s performance in the Alberta province. Red Deer Branch stands out as most profitable. The mortgage product is most profitable for most branches but a market performance is also required to maintain its gains whiles diversifying the products lines for diversified income and stronger value gains.
3 branches were total loss making for FY 2025. The savings products exhibits losses for 25 out of the 29 branches assessed which requires a product engineering and 8 branches shows income to cost ratio below 1. Strategies were recommended to improve the financial situations of the 3 weaknesses identified guided by management impact possible risk to be considered. 

# 2.0 Methodology
The following methods were deployed:
* Branch income and profitability database was created using SQL: branch_rev_prof_database
* 7 tables were created under the database: branch_list, product_list, segment_list, income_statement_summary, segment_income, product_income, product_cost

```SQL
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
```

* The various key indicators defined in the object statement were manipulated with SQL and analyzed using Excel
* Dashboards summary was created using Excel charts with descriptive interpretations.
* Recommendations, management impact and risks to be considered were suggested to aid resolve weaknesses discovered after the data analysis.

Data Limitations 
* Aggregate Data Constraints: Branch-level aggregation of the data mask out customer-level profitability differences.  
* Cost Allocation Assumptions: Certain costs may be allocated using estimates rather than direct attribution, affecting precision.
* Limited Time Horizon: Analysis based on a single period (FY2025) may not capture seasonality or long-term trends over a range of years
* Exclusion of External Factors: Market conditions, competitors’ pricing and macroeconomics impacts were not fully incorporated. 

# 3.0 Project Outcomes
Based on the project objective, the following key performance areas was discovered: 
Strengths
* Red Deer branch is the top income making branch in Alberta: $5,372,857.33
* Red Deer branch is the most profitable branch in Alberta: $4,614,393.34
* SME is the top income making segment in Alberta: $32,998,423.35
* Central is the most profitable region within the province: $7,172,463.69
* Mortgage is the most profitable product in Alberta. Red Deer, St. Albert and Sheerwood Park branches the made top 3 profit with mortgage as a product 

Weaknesses
* 3 branches made losses for the reporting year
Significant variation exists in net profit of the branches indicating inefficiencies in cost management and optimal 	product mix and income generation but Leduc, Bonnyville,and Borealis branches were most hit with larger losses. 
* 25 branches made losses over the savings product totaling 
Revenue in some branches is heavily concentrated in a small number of products, increasing exposure to income 	volatility and limiting growth opportunities from diversified offerings whiles the savings products generated lesser 	income relative to cost resulting in losses for 25 branches. A total of -$891,325.26 loss was accrued for the savings 	products to the 25 branches
* 8 branches have income to cost ratio below 1
8 branches exhibited operating expenses growing faster than income, resulting in elevated cost-to-income ratios less 	than 1. This suggests opportunities for cost optimization and improved operational efficiency.

The dashboard below summarizes the findings of the analysis. 
<img width="862" height="557" alt="image" src="https://github.com/user-attachments/assets/0a7b34c7-f1c6-433e-b451-fa3b8eb240a3" />

# 4.0 Details of Key Performance Areas Identified
### 4.1 Branch income performance by branch
The 3 best performing and the 3 worst performing branches by income are relatively close in terms of performance, painting a fair income performance across the branches. 

Best Performing Branches by Income
| Row Labels             | Sum of Income |
|------------------------|----------------|
| Red Deer Branch        | $5,372,857.33 |
| St. Albert Branch      | $3,991,337.80 |
| Grand Prairie Branch   | $3,778,639.08 |

Worst Performing Branches by Income
| Row Labels               | Sum of Income |
|--------------------------|----------------|
| Leduc Branch             | $1,169,121.47 |
| Rocky Mountain Branch    | $1,127,087.08 |
| Bonnyvile Branch         | $500,247.08 |

### 4.2 Branch profit performance by branch
The 3 most profitable branches have closely performed in match to each other. The 3 loss making branches give a need for market assessment and customer service evaluation.

Best Performing Branches by Profit
| Row Labels              | Profit |
|-------------------------|----------------|
| Red Deer Branch         | $4,614,393.34 |
| Grand Prairie Branch    | $2,901,585.29 |
| Edmonton North Branch   | $2,553,392.87 |

Worst Performing Branches by Profit
| Row Labels            | Profit |
|-----------------------|----------------|
| Leduc Branch          | -$994,622.48 |
| Bonnyvile Branch      | -$1,143,633.64 |
| Borealis Branch       | -$1,356,792.63 |

### 4.3 Product Performance by Profitability
While mortgage expresses to be the most profitable product, the same product is loss making for Borealis and Bonnyville. An assessment needs to be done to seek opportunities to boost the mortgage profit numbers in Borealis and Bonnyville.  

Best Performing Product by Profit
| Product Name | Branch Name    | Sum of Value |
|---------------|-----------------|----------------|
| Mortgage      | Red Deer        | $1,434,496.31 |
| Mortgage      | St. Albert      | $1,109,463.08 |
| Mortgage      | Sherwood Park   | $708,881.13 |

Worst Performing Product by Profit
| Product Name | Branch Name   | Sum of Value |
|---------------|----------------|----------------|
| Credit Card   | Bonnyville     | -$243,590.34 |
| Mortgage      | Borealis       | -$326,353.91 |
| Mortgage      | Bonnyville     | -$612,889.45 |

### 3.4 Income by Segments
SME is the top profit making segment possibly due to larger number of SME in various parts of the province seeking banking services continuously. The other 3 segments fairly performed in match against the SME segment.

Income by Customer Segment
| Row Labels | Income |
|-------------|----------------|
| SME         | $32,998,423.35 |
| retail      | $19,952,535.04 |
| corporate   | $14,580,698.69 |
| prestige    | $9,208,862.33 |
| **Grand Total** | **$76,740,519.41** |

### 4.5 Regional Performance by Profitability
The uneven spread of regional profitability is of a great concern, particularly with Calgary which is expected to make higher profit due to its cosmopolitan structure and huge banking opportunities as a major city in Alberta. 

Profit by Region
| Region       | Profit |
|---------------|----------------|
| Central       | $7,172,463.69 |
| Edmonton      | $7,140,142.83 |
| North         | $5,563,110.96 |
| Calgary       | $2,425,064.28 |
| South         | $1,219,318.24 |
| **Grand Total** | **$23,520,100.00** |

### 4.6 List of Severe Loss Making Branches
25 branches out of 29 made losses with the savings products. The loss making characteristics of this product across a larger branch network give reasons for product assessment and quick managerial management decision making.

## Loss on Savings Product by Branch

| Branch Name                | Loss on Savings Product |
|----------------------------|--------------------------|
| Lloydminster Branch        | -$7,191.36 |
| Aspen Branch               | -$10,454.61 |
| Bighorn Branch             | -$12,065.32 |
| Calgary South Branch       | -$13,020.05 |
| Mosaic Branch              | -$14,112.87 |
| Chinook Branch             | -$18,451.56 |
| Edmonton South Branch      | -$18,508.29 |
| Mcleod River Branch        | -$19,385.00 |
| Bow Valley Branch          | -$21,213.06 |
| Camrose Branch             | -$23,047.64 |
| Palliser Branch            | -$23,458.05 |
| Calgary West Branch        | -$24,316.51 |
| Rocky Mountain Branch      | -$24,346.67 |
| Calgary Foothills Branch   | -$27,606.54 |
| Leduc Branch               | -$27,880.64 |
| Cold Lake Branch           | -$30,158.81 |
| Wood Buffalo Branch        | -$33,102.84 |
| Wetaskiwin Branch          | -$35,397.71 |
| Northwest Branch           | -$37,443.45 |
| Edmonton North Branch      | -$56,929.91 |
| Lakeland Branch            | -$68,941.67 |
| Calgary Rural Branch       | -$77,803.92 |
| Drayton Valley Branch      | -$84,676.19 |
| Borealis Branch            | -$88,943.38 |
| Bonnyvile Branch           | -$92,869.21 |
| **Grand Total**            | **-$891,325.26** |

# 5.0 Strategy Recommendations
The following strategies have been recommended to aid resolve the identified weaknesses with the performance analysis of Assurance Bank in Alberta. 

 Identified Weaknesses | Recommendation | Management Impact | Risk to be Considered |
|---|---|---|---|
| **3 branches made losses for the reporting year: Leduc, Bonnyville, and Borealis** | - Deep-dive analysis of fixed versus variable costs to ensure expenses are captured under the correct account types<br>- Review staff levels and branch operating hours to reduce operational costs<br>- Evaluate local market dynamics to align branch capabilities with market demand<br>- Introduce real-time performance monitoring and reporting systems | - Enables corrective actions such as cost restructuring, staff optimization, and targeted income initiatives to improve profitability of loss-making branches<br>- Supports decisions to reprice, redesign, or terminate underperforming savings products<br>- Redirects capital, budget, and staffing efforts toward more profitable branches and products<br>- Refines branch revenue and cost strategies to improve income-to-cost ratios below 1<br>- Encourages digitization and technology adoption to improve customer service delivery | **A. Financial Risks**<br>- Customer attrition from pricing changes or product redesigns<br>- Revenue concentration risk from overreliance on highly profitable products<br>- Short-term profit volatility during turnaround initiatives<br><br>**B. Operational Risks**<br>- Execution risk from inconsistent implementation across branches<br>- Staff resistance to changes in performance metrics or incentives<br>- Service quality risk from aggressive cost reductions |
| **25 branches made losses on savings products totaling -$891,325.26** | - Review interest rates paid on savings accounts against market offerings<br>- Introduce tiered interest rates based on account balances<br>- Reduce operational costs through digital self-service channels<br>- Introduce real-time performance monitoring and reporting systems | - Improves product profitability through better pricing strategies<br>- Encourages operational efficiency and reduced servicing costs<br>- Enhances visibility into branch-level product performance for timely decision-making | - Customer dissatisfaction if interest rates become less competitive<br>- Increased implementation costs for digital transformation initiatives<br>- Potential reduction in branch traffic affecting cross-selling opportunities |
| **8 branches have income-to-cost ratios below 1** | - Cross-sell credit cards, personal loans, and GICs to existing savings customers to recover lost income opportunities<br>- Set branch-specific targets based on local demographics<br>- Introduce staff incentives based on net income instead of gross income<br>- Introduce real-time performance monitoring and reporting systems | - Strengthens branch profitability through diversified revenue streams<br>- Aligns branch goals with regional customer behavior and profitability objectives<br>- Improves accountability and performance-driven culture among staff | - Risk of over-aggressive sales practices impacting customer trust<br>- Incentive structures may create internal competition or morale issues<br>- Additional monitoring systems may increase operational complexity |

