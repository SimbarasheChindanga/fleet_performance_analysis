# Fleet Performance Analytics Platform

An end-to-end fleet analytics portfolio project built around a synthetic Zimbabwean trucking operation. The project demonstrates a complete workflow from data generation and preparation through SQL, exploratory and statistical analysis, machine learning, and Power BI business intelligence.

> **Data note:** All operational records are synthetic and are used for portfolio/educational demonstration. They do not represent confidential records from a real trucking company.

## Project objectives

The platform is designed to answer practical fleet-management questions around:

- fleet utilization and truck performance;
- revenue and profitability;
- fuel consumption and fuel efficiency;
- fuel purchase expenditure;
- maintenance cost and downtime;
- driver and route performance;
- statistical relationships between operational variables; and
- predictive modelling for selected operational outcomes.

## Dataset

| Dataset | Records | Purpose |
|---|---:|---|
| Trucks | 35 | Fleet inventory and vehicle attributes |
| Drivers | 45 | Driver information and performance attributes |
| Trips | 1,500 | Transport operations, distance, revenue, cost, fuel and profit |
| Maintenance | 350 | Maintenance events, categories, cost and downtime |
| Fuel Purchases | 500 | Fuel transactions, litres, prices and expenditure |

The datasets are linked through operational identifiers such as `truck_id` and `driver_id`.

## Analytical workflow

```text
Synthetic Data
      ↓
Data Cleaning & Preparation
      ↓
SQL Business Analysis (21 queries)
      ↓
Exploratory Data Analysis
      ↓
Statistical Analysis
      ↓
Machine Learning
      ↓
Power BI Dashboard
      ↓
Business Insights & Decision Support
```

## Repository structure

```text
Fleet_Performance_Analytics/
│
├── data/
│   ├── raw/
│   │   ├── trucks.csv
│   │   ├── drivers.csv
│   │   ├── trips.csv
│   │   ├── maintenance.csv
│   │   ├── fuel_purchases.csv
│   │   └── generation_summary.json
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
├── powerbi/
│   └── Fleet_Performance_Dashboard.pbix
│
├── Project_Proposal_FPA.pdf
├── requirements.txt
├── License.txt
└── README.md
```

## Seven notebooks

| Notebook | Purpose |
|---|---|
| `01_Data_Generation.ipynb` | Generates the synthetic operational datasets. |
| `02_Data_Cleaning_Preparation.ipynb` | Cleans, validates and prepares the analytical datasets. |
| `03_SQL_Analysis.ipynb` | Executes 21 SQL business questions and KPI analyses. |
| `04_EDA.ipynb` | Explores distributions, relationships, outliers and operational patterns. |
| `05_Statistical_Analysis.ipynb` | Applies correlation analysis, hypothesis tests, chi-square tests and ANOVA. |
| `06_Machine_Learning.ipynb` | Builds and evaluates predictive regression and classification models. |
| `07_Power_BI_Dashboard.ipynb` | Documents the Power BI dashboard workflow and analytical layer. |

## SQL analysis

The SQL layer contains **21 business queries** covering:

- total trucks, trips, distance, revenue and profit;
- truck revenue, trip count, fuel efficiency, maintenance cost and profitability;
- driver deliveries, revenue, fuel efficiency, delay rate and profitability;
- route revenue, route profitability and loss-making routes; and
- monthly revenue/profit analysis, including a rolling three-month profit average.

Truck and driver fuel efficiency use the aggregate definition:

```text
Fuel Efficiency = Total Distance ÷ Total Fuel Consumed
```

This avoids treating an arithmetic average of trip-level ratios as the fleet-level efficiency measure.

## Statistical analysis

The statistical notebook investigates operational relationships using:

- Pearson correlation;
- Welch's t-test;
- chi-square tests of association;
- one-way ANOVA; and
- effect-size interpretation and multiple-testing caution.

Because the data are synthetic, statistical findings demonstrate analytical methodology and should not be interpreted as population-level evidence about a real fleet.

## Machine learning

The modelling workflow covers four operational use cases:

| Use case | Model approach | Reported result |
|---|---|---:|
| Fuel consumption prediction | Linear Regression / Random Forest Regression | Random Forest R² ≈ 0.984 |
| Maintenance cost prediction | Random Forest Regression | R² ≈ 0.957 |
| Delivery delay prediction | Logistic Regression / Random Forest Classification | Logistic Regression F1 ≈ 0.608 |
| Trip profitability classification | Random Forest Classification | F1 ≈ 0.874 |

These results are portfolio-model results on synthetic data. They are not claims of production-ready predictive accuracy.

## Power BI dashboard

The final PBIX contains exactly **four pages**:

1. **Executive Summary** — high-level fleet, financial and operational KPIs.
2. **Fleet Performance Analysis** — truck profitability, distance, fuel consumption, operating cost, maintenance cost and downtime.
3. **Fuel Consumption Analysis** — fuel volume, fuel purchase expenditure, fleet fuel efficiency and fuel purchase spend per kilometre.
4. **Maintenance Analysis** — maintenance expenditure, events, downtime and maintenance categories.

No Route Analysis or Time Trends pages are included in the final dashboard.

### Current dashboard KPIs

| KPI | Current result |
|---|---:|
| Total Trucks | **35** |
| Total Trips | **1,500** |
| Total Distance | **~639K km** |
| Total Revenue | **$877.95K** |
| Total Profit | **$94.86K** |
| Profit Margin | **~10.81%** |
| Total Fuel | **241.04K L** |
| Fleet Fuel Efficiency | **2.65 km/L** |
| Total Fuel Purchase Cost | **$229.20K** |
| Fuel Purchase Cost per KM | **$0.36/km** |
| Maintenance Cost | **~$355K** |
| Maintenance Events | **350** |
| Downtime | **714 days** |
| Average Maintenance Cost | **~$1.01K/event** |

### Metric definitions

**Fleet Fuel Efficiency**

```text
Total Distance ÷ Total Fuel Consumed
```

**Fuel Purchase Cost per KM**

```text
Total Fuel Purchase Expenditure ÷ Total Distance
```

**Profit Margin**

```text
Total Profit ÷ Total Revenue × 100
```

The dashboard keeps trip-level financial measures separate from fuel-purchase and maintenance transaction measures. These datasets should not be combined into a single accounting cost bridge without confirming the underlying business definitions.

## Key findings

### Fleet performance

- The simulated fleet contains 35 trucks and 1,500 recorded trips.
- Total recorded distance is approximately 639K km.
- Truck-level utilization and profitability vary across the fleet.
- Several high-distance trucks also have high fuel consumption, making fuel efficiency an important complementary measure to utilization.
- Some high-profit trucks also demonstrate strong fuel efficiency; this is an observed association, not evidence of causation.

### Financial performance

- Total recorded revenue is approximately $877.95K.
- Total recorded profit is approximately $94.86K.
- Overall profit margin is approximately 10.81%.
- Profitability varies across trucks and operational activities.

### Fuel performance

- Total recorded fuel consumption is approximately 241.04K litres.
- Aggregate fleet fuel efficiency is approximately 2.65 km/L.
- Fuel purchase expenditure is approximately $229.20K.
- Overall fuel purchase expenditure is approximately $0.36/km.
- Fuel efficiency and fuel purchase expenditure vary across trucks.

### Maintenance

- The dataset contains 350 maintenance events.
- Total maintenance expenditure is approximately $355K.
- Recorded maintenance downtime totals 714 days.
- Maintenance expenditure and downtime vary across trucks and maintenance categories.

## Business recommendations

- Prioritize trucks with persistently high maintenance cost and downtime for inspection.
- Monitor fuel efficiency and fuel purchase spend per kilometre by truck.
- Investigate low-profit and loss-making routes before changing route allocation.
- Evaluate profitability together with utilization, fuel efficiency and maintenance burden when comparing trucks.
- Use predictive models as decision-support tools rather than automatic replacement or scheduling decisions.
- Integrate GPS, telemetry and real operational records in future iterations when those data become available.

## Limitations

- The dataset is synthetic and does not represent a real trucking company's financial or operational records.
- Correlation and statistical association do not establish causality.
- Machine-learning performance on synthetic data does not guarantee performance on real-world data.
- Trip-level financial fields and transaction-level fuel/maintenance costs have separate operational definitions and should not be treated as a consolidated accounting model without further validation.

## Skills demonstrated

**Python · Pandas · NumPy · Matplotlib · Seaborn · SQL · SQLite · Statistical Analysis · Scikit-learn · Machine Learning · Power BI · DAX · Data Visualization · Business Intelligence · Fleet Analytics**

## Project status

This repository represents the cleaned portfolio version of the Fleet Performance Analytics project. The dashboard, analytical notebooks, SQL layer, datasets and model outputs are organized as one coherent workflow; earlier development versions and superseded dashboard pages are intentionally excluded.
