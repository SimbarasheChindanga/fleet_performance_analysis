# 🚛 Fleet Performance Analytics Platform

![Python](https://img.shields.io/badge/Python-3.11-blue?logo=python)
![Power
BI](https://img.shields.io/badge/Power%20BI-Dashboard-F2C811?logo=powerbi)
![SQLite](https://img.shields.io/badge/Database-SQLite-003B57?logo=sqlite)
![Scikit-Learn](https://img.shields.io/badge/Machine%20Learning-Scikit--Learn-F7931E?logo=scikit-learn)
![License](https://img.shields.io/badge/License-MIT-green)

An end-to-end **fleet performance analytics project** that simulates the
operations of a Zimbabwean trucking company.

The project combines **Python, SQL, statistical analysis, machine
learning, and Power BI** to transform operational data into business
insights covering fleet performance, profitability, fuel consumption,
maintenance, downtime, drivers, routes, and operational risk.

------------------------------------------------------------------------

## 👤 Author

### **Simbarashe Chindanga**
**Data Science & Transport Technology Specialist**

Final-year **Data Science and Systems (HDSC)** student at the **University of Zimbabwe — Faculty of Science**, focused on applying data science and technology to the transport, trucking, logistics, and supply-chain industries.

**Areas of Focus**
- 🚛 Fleet Analytics & Transport Technology
- 📊 Data Science & Business Intelligence
- 🧠 Machine Learning & Predictive Analytics
- 🗄️ SQL & Data Engineering
- 📈 Power BI & Data Visualization
- 🔗 Supply Chain & Logistics Analytics

**Education**
- **University of Zimbabwe — Faculty of Science**
- **BSc Data Science and Systems (HDSC)**
- **Final-Year Student**

**Professional Links**
- 💼 **GitHub:** [SimbarasheChindanga](https://github.com/SimbarasheChindanga)
- 📧 **Email:** [chindangasimbarashe02@gmail.com](mailto:chindangasimbarashe02@gmail.com)
- 🇿🇼 **Location:** Zimbabwe

---

## 📑 Table of Contents

-   [Project Overview](#-project-overview)
-   [Objectives](#-project-objectives)
-   [Business Problem](#-business-problem)
-   [Dataset](#-synthetic-dataset)
-   [Technology Stack](#-technology-stack)
-   [Project Workflow](#-project-workflow)
-   [Project Structure](#-project-structure)
-   [Seven-Notebook Pipeline](#-seven-notebook-pipeline)
-   [SQL Analytics](#-sql-analytics)
-   [Statistical Analysis](#-statistical-analysis)
-   [Machine Learning](#-machine-learning)
-   [Power BI Dashboard](#-power-bi-dashboard)
-   [Dashboard Screenshots](#-dashboard-screenshots)
-   [Current Dashboard KPIs](#-current-dashboard-kpis)
-   [Key Findings](#-key-findings)
-   [Business Recommendations](#-business-recommendations)
-   [Limitations](#-limitations)
-   [Skills Demonstrated](#-skills-demonstrated)
-   [Future Improvements](#-future-improvements)
-   [Acknowledgements](#-acknowledgements)
-   [License](#-license)

------------------------------------------------------------------------

# 🌍 Project Overview

Transportation companies generate large amounts of operational data from
trips, vehicles, drivers, fuel purchases, maintenance activities, and
financial transactions. When this information remains fragmented across
operational records, management can struggle to identify inefficiencies,
monitor performance, and make evidence-based decisions.

This project demonstrates how operational fleet data can be transformed
into an integrated analytics workflow:

``` text
Business Problem
      ↓
Synthetic Dataset Generation
      ↓
Data Cleaning & Validation
      ↓
Exploratory Data Analysis
      ↓
SQL Business Analysis
      ↓
Statistical Analysis
      ↓
Machine Learning
      ↓
Power BI Dashboard
      ↓
Business Insights & Recommendations
```

The objective is not simply to build a dashboard. The project
demonstrates the complete process of moving from **data generation and
preparation to analytical findings, predictive modelling, visualization,
and business decision support**.

------------------------------------------------------------------------

# 🎯 Project Objectives

The project aims to:

-   Analyze overall fleet operational performance.
-   Evaluate truck productivity, utilization, and profitability.
-   Analyze fuel consumption and fuel efficiency.
-   Analyze maintenance expenditure and vehicle downtime.
-   Investigate driver performance and route profitability.
-   Identify relationships between operational variables using
    statistical analysis.
-   Develop predictive machine-learning models for selected operational
    outcomes.
-   Build an interactive Power BI dashboard for management reporting.
-   Demonstrate an end-to-end analytics workflow using industry-relevant
    tools.

------------------------------------------------------------------------

# 📋 Business Problem

Fleet operators must balance revenue generation with fuel expenditure,
maintenance costs, vehicle availability, driver performance, route
profitability, and delivery reliability.

The simulated business environment addresses:

-   Rising fuel costs affecting operational profitability.
-   Increasing maintenance expenditure.
-   Unplanned vehicle downtime.
-   Differences in truck utilization and profitability.
-   Variations in driver performance.
-   Limited visibility into fleet-wide KPIs.
-   Limited predictive insight for proactive operational planning.

The simulated company operates across transport corridors including
**Harare, Bulawayo, Mutare, Gweru, Masvingo, Beitbridge, and Chirundu**.

------------------------------------------------------------------------

# 🧪 Synthetic Dataset

Real trucking-company operational data can contain commercially
sensitive information such as vehicle financial records, fuel
expenditure, driver performance, customer information, maintenance
costs, and profitability. For portfolio purposes, this project therefore
uses a carefully designed **synthetic dataset**.

The dataset is designed with business rules intended to create realistic
relationships between vehicles, drivers, trips, fuel consumption,
maintenance, delays, and profitability. It does **not** represent
records from a real Zimbabwean trucking company.

## Dataset Overview

  ------------------------------------------------------------------------
  Dataset                                    Records Purpose
  --------------------- ---------------------------- ---------------------
  Trucks                                      **35** Fleet inventory and
                                                     vehicle
                                                     characteristics

  Drivers                                     **45** Driver information
                                                     and performance
                                                     attributes

  Trips                                    **1,500** Transport operations,
                                                     distance, cargo,
                                                     revenue, costs, fuel,
                                                     delays and profit

  Maintenance                                **350** Maintenance events,
                                                     categories, costs and
                                                     downtime

  Fuel Purchases                             **500** Fuel transactions,
                                                     litres, prices and
                                                     expenditure
  ------------------------------------------------------------------------

### Synthetic Data Design

Business rules include relationships such as:

-   Vehicle mileage changes with operational activity.
-   Fuel consumption varies with distance and operating conditions.
-   Vehicle age and mileage are associated with maintenance activity.
-   Revenue varies with transport activity and cargo characteristics.
-   Delivery delays depend on several operational conditions.
-   Maintenance severity influences downtime and repair cost.
-   Vehicle utilization differs across the fleet.
-   Trip profitability varies because revenue and operating costs vary
    across trips.

### Machine-Learning Integrity

Target leakage was considered during model development. Variables that
directly encode a prediction target are not used as predictors for that
target.

For example:

``` text
Fuel Efficiency = Total Distance ÷ Total Fuel Consumed
```

Fuel efficiency therefore should not be used as a predictor when the
target is fuel consumed because it directly contains information about
that target.

------------------------------------------------------------------------

# 🛠 Technology Stack

  Category                    Technologies
  --------------------------- --------------------------------------------------
  Programming                 Python
  Data Processing             Pandas, NumPy
  Synthetic Data Generation   Faker, custom business logic
  Database                    SQLite
  SQL Analytics               SQL, joins, aggregations, CTEs, window functions
  Statistical Analysis        SciPy, Statsmodels
  Machine Learning            Scikit-learn
  Visualization               Matplotlib, Seaborn
  Business Intelligence       Power BI
  Development Environment     Jupyter Notebook

------------------------------------------------------------------------

# 🔄 Project Workflow

### 1. Data Generation

Generate realistic synthetic fleet datasets using predefined operational
business rules.

### 2. Data Cleaning & Preparation

Validate and prepare the generated datasets, including missing-value
checks, duplicate checks, type conversion, derived variables, and
data-quality validation.

### 3. SQL Analysis

Use SQLite and SQL to answer practical fleet-management questions and
generate reusable business metrics.

### 4. Exploratory Data Analysis

Investigate distributions, relationships, trends, anomalies, fleet
performance, fuel consumption, maintenance, drivers, and routes.

### 5. Statistical Analysis

Use correlation analysis, hypothesis testing, ANOVA, and group
comparisons to investigate operational relationships.

### 6. Machine Learning

Develop regression and classification models for fuel consumption,
maintenance cost, delivery delay, and trip profitability.

### 7. Power BI

Transform the analytical data into an interactive management dashboard.

### 8. Business Interpretation

Translate analytical results into evidence-based operational findings
and recommendations.

------------------------------------------------------------------------

# 📁 Project Structure

``` text
fleet_performance_analytics/
│
├── README.md
├── License.txt
├── Project_Proposal_FPA.pdf
├── requirements.txt
│
├── data/
│   ├── raw/
│   │   ├── trucks.csv
│   │   ├── drivers.csv
│   │   ├── trips.csv
│   │   ├── maintenance.csv
│   │   ├── fuel_purchases.csv
│   │   └── generation_summary.json
│   │
│   └── processed/
│       ├── trucks_clean.csv
│       ├── drivers_clean.csv
│       ├── trips_clean.csv
│       ├── maintenance_clean.csv
│       └── fuel_purchases_clean.csv
│
├── notebooks/
│   ├── 01_Data_Generation.ipynb
│   ├── 02_Data_Cleaning_Preparation.ipynb
│   ├── 03_SQL_Analysis.ipynb
│   ├── 04_EDA.ipynb
│   ├── 05_Statistical_Analysis.ipynb
│   ├── 06_Machine_Learning.ipynb
│   └── 07_Power_BI_Dashboard.ipynb
│
├── sql/
│   └── fleet_analysis_queries.sql
│
├── reports/
│   ├── delay_confusion_matrix.csv
│   ├── delay_feature_importance.csv
│   ├── delay_model_results.csv
│   ├── fuel_model_results.csv
│   ├── maintenance_feature_importance.csv
│   ├── maintenance_model_results.csv
│   ├── model_results.csv
│   ├── profitability_confusion_matrix.csv
│   ├── profitability_feature_importance.csv
│   └── profitability_model_results.csv
│
├── screenshots/
│   ├── fleet_performance.png
│   ├── fuel_consumption.png
│   └── maintenance_analysis.png
│
└── powerbi/
    └── Fleet_Performance_Dashboard.pbix
```

------------------------------------------------------------------------

# 📓 Seven-Notebook Pipeline

  --------------------------------------------------------------------------
  Notebook                               Purpose
  -------------------------------------- -----------------------------------
  `01_Data_Generation.ipynb`             Generate the synthetic fleet
                                         datasets using business rules.

  `02_Data_Cleaning_Preparation.ipynb`   Clean, validate, transform and
                                         prepare analytical datasets.

  `03_SQL_Analysis.ipynb`                Execute the 21 business SQL
                                         questions.

  `04_EDA.ipynb`                         Explore distributions,
                                         relationships, trends and
                                         operational patterns.

  `05_Statistical_Analysis.ipynb`        Perform correlation, hypothesis
                                         testing and ANOVA analysis.

  `06_Machine_Learning.ipynb`            Train, compare and evaluate
                                         predictive models.

  `07_Power_BI_Dashboard.ipynb`          Document the Power BI dashboard
                                         workflow and analytical outputs.
  --------------------------------------------------------------------------

The repository intentionally presents **one clean seven-notebook
workflow** rather than exposing historical V1/V2 development copies.

------------------------------------------------------------------------

# 🗄️ SQL Analytics

The project contains **21 business SQL queries** covering:

### Fleet Overview

-   Total trucks.
-   Total trips.
-   Total distance.
-   Total revenue.
-   Total profit.

### Truck Performance

-   Truck revenue.
-   Truck trip count.
-   Truck fuel efficiency.
-   Truck maintenance cost.
-   Truck profitability.

### Driver Performance

-   Driver deliveries.
-   Driver revenue.
-   Driver fuel efficiency.
-   Driver delay rate.
-   Driver profitability.

### Route Analysis

-   Route revenue.
-   Route profitability.
-   Loss-making routes.

### Time-Based Analysis

-   Monthly revenue.
-   Top revenue months.
-   Monthly profit.
-   Rolling profit averages.

### Fuel-Efficiency Methodology

Fuel efficiency is calculated from aggregated totals:

``` text
Fuel Efficiency = Total Distance ÷ Total Fuel Consumed
```

This avoids distortion from simply averaging individual trip-level
efficiency ratios.

------------------------------------------------------------------------

# 📈 Statistical Analysis

The statistical workflow investigates relationships within the synthetic
operational data using:

-   Pearson correlation analysis.
-   Hypothesis testing.
-   Welch t-tests.
-   Chi-square tests.
-   One-way ANOVA.
-   Effect-size interpretation.
-   Multiple-testing caution.

Because the dataset is synthetic, statistical results demonstrate
analytical methodology rather than representing conclusions about a real
trucking population.

------------------------------------------------------------------------

# 🤖 Machine Learning

Machine learning demonstrates how predictive analytics can support fleet
operations.

## Modelling Tasks

  -----------------------------------------------------------------------
  Task                    Models                  Purpose
  ----------------------- ----------------------- -----------------------
  Fuel Consumption        Linear Regression,      Predict trip fuel
                          Random Forest           consumption

  Maintenance Cost        Random Forest           Predict maintenance
                          Regression              cost

  Delivery Delay          Logistic Regression,    Predict whether a trip
                          Random Forest           is delayed

  Profitability           Random Forest           Classify trip
                          Classification          profitability
  -----------------------------------------------------------------------

## Model Results

  Task               Model                 Key Metric        Result
  ------------------ --------------------- ------------ -----------
  Fuel Consumption   Linear Regression     R²             **0.980**
  Fuel Consumption   Random Forest         R²             **0.984**
  Maintenance Cost   Random Forest         R²             **0.957**
  Delivery Delay     Logistic Regression   F1             **0.608**
  Delivery Delay     Random Forest         F1             **0.482**
  Profitability      Random Forest         F1             **0.874**

The individual model reports in `reports/` contain the detailed
evaluation metrics and feature-importance outputs.

### Interpretation

-   Random Forest produced the strongest fuel-consumption R² among the
    tested fuel models.
-   Maintenance-cost prediction achieved an R² of approximately 0.957 on
    the synthetic dataset.
-   Logistic Regression produced the stronger F1 score for
    delivery-delay prediction among the tested delay models.
-   Profitability classification produced an F1 score of approximately
    0.874.

These results are demonstrations on synthetic data and should not be
treated as production performance estimates.

------------------------------------------------------------------------

# 📊 Power BI Dashboard

The Power BI dashboard is the business-intelligence layer of the
project. It converts the analytical datasets into four
management-focused pages.

## Dashboard Pages

  -----------------------------------------------------------------------
  Page                                Focus
  ----------------------------------- -----------------------------------
  **Executive Summary**               High-level fleet KPIs and overall
                                      financial and operational
                                      performance

  **Fleet Performance Analysis**      Truck profitability, distance, fuel
                                      consumption, operating costs,
                                      maintenance cost and downtime

  **Fuel Consumption Analysis**       Fuel consumption, fuel purchase
                                      expenditure, fuel efficiency and
                                      fuel purchase cost per kilometre

  **Maintenance Analysis**            Maintenance expenditure,
                                      maintenance events, downtime and
                                      maintenance categories
  -----------------------------------------------------------------------

### ⚡ Interactive Dashboard

**[Open/download the Power BI `.pbix`
dashboard](powerbi/Fleet_Performance_Dashboard.pbix)**

The PBIX file is included in the repository so a reviewer with **Power
BI Desktop** can open the dashboard and interact with the visuals,
filters, and analytical pages in real time.

> **Requirement:** Power BI Desktop is required to open the `.pbix`
> file. You can obtain it from [Microsoft Power BI
> Desktop](https://powerbi.microsoft.com/desktop/).

------------------------------------------------------------------------

# 📸 Dashboard Screenshots

The screenshots below are the dashboard screenshots captured from the completed Power BI project. The filenames in this section match the files currently stored in the `screenshots/` folder.

## Executive Summary

[![Executive Summary](screenshots/Executive%20Summary.png)](screenshots/Executive%20Summary.png)

The Executive Summary provides the high-level fleet KPIs and management overview.

**[Open full-size Executive Summary screenshot](screenshots/Executive%20Summary.png)**

## Fleet Performance Analysis

[![Fleet Performance Analysis](screenshots/Fleet%20Performance%20Analysis.png)](screenshots/Fleet%20Performance%20Analysis.png)

The fleet-performance view focuses on truck profitability, distance travelled, fuel consumption, operating cost, maintenance cost, and downtime.

**[Open full-size Fleet Performance screenshot](screenshots/Fleet%20Performance%20Analysis.png)**

## Fuel Consumption Analysis

[![Fuel Consumption Analysis](screenshots/Fuel%20Consumption%20Analysis.png)](screenshots/Fuel%20Consumption%20Analysis.png)

The fuel view covers total fuel consumption, fuel purchase expenditure, fleet fuel efficiency, fuel purchase cost per kilometre, and truck-level comparisons.

**[Open full-size Fuel Consumption screenshot](screenshots/Fuel%20Consumption%20Analysis.png)**

## Maintenance Analysis

[![Maintenance Analysis](screenshots/Maintenance%20Analysis.png)](screenshots/Maintenance%20Analysis.png)

The maintenance view covers maintenance expenditure, maintenance-event volume, downtime, truck-level maintenance patterns, and maintenance categories.

**[Open full-size Maintenance screenshot](screenshots/Maintenance%20Analysis.png)**


# 📌 Current Dashboard KPIs

  KPI                                Current Result
  --------------------------- ---------------------
  Total Trucks                               **35**
  Total Trips                             **1,500**
  Total Distance                      **\~639K km**
  Total Revenue                       **\$877.95K**
  Total Profit                         **\$94.86K**
  Profit Margin                        **\~10.81%**
  Total Fuel                          **241.04K L**
  Fleet Fuel Efficiency               **2.65 km/L**
  Total Fuel Purchase Cost            **\$229.20K**
  Fuel Purchase Cost per KM           **\$0.36/km**
  Maintenance Cost                     **\~\$355K**
  Maintenance Events                        **350**
  Downtime                             **714 days**
  Average Maintenance Cost      **\~\$1.01K/event**

## Metric Definitions

**Fleet Fuel Efficiency**

``` text
Total Distance ÷ Total Fuel Consumed
```

**Fuel Purchase Cost per KM**

``` text
Total Fuel Purchase Expenditure ÷ Total Distance
```

**Profit Margin**

``` text
Total Profit ÷ Total Revenue × 100
```

------------------------------------------------------------------------

# 📌 Key Findings

## Fleet Performance

-   The simulated fleet contains **35 trucks** and **1,500 recorded
    trips**.
-   Total recorded distance is approximately **639K km**.
-   Truck-level profitability and utilization vary across the fleet.
-   Several high-distance trucks also record high fuel consumption,
    making fuel efficiency an important complementary measure to
    utilization.
-   Some high-profit trucks also demonstrate strong fuel efficiency;
    this is an observed association and does not establish causation.

## Financial Performance

-   Total recorded revenue is approximately **\$877.95K**.
-   Total recorded profit is approximately **\$94.86K**.
-   Overall profit margin is approximately **10.81%**.
-   Profitability varies across trucks and operational activities.

## Fuel Performance

-   Total recorded fuel consumption is approximately **241.04K litres**.
-   Aggregate fleet fuel efficiency is approximately **2.65 km/L**.
-   Fuel purchase expenditure is approximately **\$229.20K**.
-   Overall fuel purchase expenditure is approximately **\$0.36/km**.
-   Fuel efficiency and fuel purchase expenditure vary across trucks.

## Maintenance

-   The dataset contains **350 maintenance events**.
-   Total maintenance expenditure is approximately **\$355K**.
-   Recorded maintenance downtime totals **714 days**.
-   Maintenance expenditure and downtime vary across trucks and
    maintenance categories.

------------------------------------------------------------------------

# 💡 Business Recommendations

### Fleet Management

-   Prioritize trucks with persistently high maintenance costs and
    downtime for inspection.
-   Investigate underutilized vehicles before reallocating fleet
    capacity.
-   Evaluate profitability, utilization, fuel efficiency, and
    maintenance together when making fleet decisions.

### Fuel Management

-   Monitor fuel efficiency by truck and route.
-   Investigate trucks with persistently high fuel purchase expenditure
    per kilometre.
-   Use fuel-efficiency trends to identify operational improvement
    opportunities.

### Maintenance

-   Monitor maintenance events and downtime by truck and category.
-   Prioritize preventive maintenance for vehicles showing repeated
    maintenance or downtime patterns.
-   Use predictive maintenance models as decision-support tools rather
    than automatic replacement decisions.

### Profitability

-   Investigate low-profit and loss-making routes before changing route
    allocation.
-   Evaluate revenue together with operating costs and profit when
    comparing routes.
-   Use historical trip performance to support scheduling and fleet
    allocation decisions.

### Business Intelligence

-   Automate dashboard refreshes when live operational data becomes
    available.
-   Integrate GPS and vehicle telemetry data in future versions.
-   Expand predictive analytics as additional operational data becomes
    available.

------------------------------------------------------------------------

# ⚠️ Limitations

### Synthetic Data

The entire dataset is synthetic and was created for portfolio
demonstration purposes. It should not be interpreted as actual
operational or financial data from a real trucking company.

### Causality

Observed correlations or patterns do not automatically establish causal
relationships.

### Machine Learning

Predictive model performance on synthetic data does not guarantee
performance on real-world fleet data.

### Financial Definitions

Trip-level financial variables and fuel-purchase records are stored in
separate operational datasets. Their business definitions should
therefore be reviewed before using them for consolidated accounting
decisions.

### Decision Support

The dashboard is intended to support operational decision-making.
Management decisions should also consider operational context, business
policies, and real-world constraints.

------------------------------------------------------------------------

# 🧠 Skills Demonstrated

  -----------------------------------------------------------------------
  Domain                              Skills
  ----------------------------------- -----------------------------------
  Data Engineering                    Data generation, preprocessing,
                                      cleaning, validation, relational
                                      data modelling

  SQL                                 Joins, aggregations, CTEs,
                                      subqueries, window functions, KPI
                                      generation

  Data Analysis                       EDA, descriptive statistics, trend
                                      analysis, correlation analysis

  Statistical Analysis                Correlation, ANOVA, hypothesis
                                      testing, effect-size interpretation

  Machine Learning                    Regression, classification, feature
                                      engineering, model evaluation

  Data Visualization                  Matplotlib, Seaborn, Power BI

  Business Intelligence               Dashboard development, KPI
                                      reporting, executive reporting

  Business Analysis                   Operational analytics, decision
                                      support, business recommendations

  Communication                       Translating analytical findings
                                      into business insights
  -----------------------------------------------------------------------

------------------------------------------------------------------------

# 🔮 Future Improvements

## Real-Time Fleet Monitoring

-   Integrate live GPS tracking.
-   Stream operational data through APIs or IoT devices.
-   Build near-real-time fleet monitoring dashboards.

## Advanced Machine Learning

Future modelling work could include:

-   Vehicle breakdown prediction.
-   Maintenance scheduling.
-   Fuel-consumption forecasting.
-   Driver risk assessment.
-   Delivery-delay prediction.
-   Route demand forecasting.

## Route Optimization

Future optimization capabilities could:

-   Recommend fuel-efficient routes.
-   Reduce travel time.
-   Minimize operating costs.
-   Improve fleet utilization.

Potential technologies include OpenStreetMap, OR-Tools, and NetworkX.

## Cloud Deployment

Deploy the analytics platform to a cloud environment for improved
accessibility and scalability using platforms such as Microsoft Azure or
AWS.

## Interactive Web Application

A future version could provide a browser-based analytics interface using
Streamlit, Dash, Flask, or FastAPI.

## IoT Integration

Future telemetry integration could include GPS location, engine
diagnostics, fuel sensors, driver behaviour, and vehicle health
indicators.

------------------------------------------------------------------------

# 🙏 Acknowledgements

This project was developed as a personal portfolio project to
demonstrate practical skills in data analytics, SQL, machine learning,
statistical analysis, and business intelligence using a realistic
fleet-management scenario.

The synthetic dataset was generated exclusively for educational and
portfolio purposes and does not represent data from a real
transportation company.

------------------------------------------------------------------------

# 📄 License

This project is licensed under the MIT License.

------------------------------------------------------------------------

# ⭐ Final Remarks

This project demonstrates an end-to-end fleet analytics workflow:

**Synthetic Data → Data Preparation → SQL → EDA → Statistics → Machine
Learning → Power BI → Business Insights**

The project demonstrates not only technical implementation, but also the
ability to structure an operational problem, create a defensible
analytical dataset, evaluate performance, communicate findings, and
translate data into practical business recommendations.
