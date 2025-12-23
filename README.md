# Product Analytics & Business Insights with SQL (Must-Have Portfolio Repo)

You are a data scientist supporting a product team (SaaS / e-commerce style).
Stakeholders ask:
- **Where are users dropping off?**
- **Which customers are most valuable (LTV)?**
- **Which features drive retention?**
- **Which plans churn more?**

This repo provides a complete SQL project:
✅ schema + synthetic dataset  
✅ advanced analytics queries (CTEs, windows, time analysis, funnels, cohorts)  
✅ a place to write product insights (not just SQL)

---

## Repo Structure
```
sql-product-analytics/
├── schema.sql
├── data.sql
├── queries/
│   ├── funnel_analysis.sql
│   ├── retention_cohorts.sql
│   ├── revenue_metrics.sql
│   └── window_functions.sql
├── README.md
└── insights.md
```

---

## ER Diagram (Logical)

```mermaid
erDiagram
  USERS ||--o{ EVENTS : generates
  USERS ||--o{ SUBSCRIPTIONS : has
  USERS ||--o{ PAYMENTS : makes

  USERS {
    int user_id PK
    date signup_date
    text country
  }
  EVENTS {
    bigint event_id PK
    int user_id FK
    text event_type
    timestamp event_time
    text session_id
  }
  SUBSCRIPTIONS {
    bigint subscription_id PK
    int user_id FK
    text plan
    date start_date
    date end_date
    text status
  }
  PAYMENTS {
    bigint payment_id PK
    int user_id FK
    numeric amount
    date payment_date
    text method
  }
```

---

## Setup (PostgreSQL)

1) Create a database (example):
```sql
CREATE DATABASE product_analytics;
```

2) Load schema + data:
```bash
psql -d product_analytics -f schema.sql
psql -d product_analytics -f data.sql
```

3) Run queries:
```bash
psql -d product_analytics -f queries/funnel_analysis.sql
```

> Tip: If you prefer a GUI, open the database in DBeaver or DataGrip and run each file.

---

## What this demonstrates (Recruiter Keywords)
- **CTEs** and readable multi-step analysis
- **Window functions** (lag, running totals, ranking, percentiles)
- **Complex joins** across user, event, subscription, payment tables
- **Time-based analysis** (monthly active users, MRR, churn-by-month)
- **Funnel analysis** (stage conversion and drop-off)
- **Retention & cohort analysis** (30-day retention + weekly curves)
- **LTV** and customer value segmentation

---

## Suggested “Key Insights” workflow
1) Run the funnel & retention queries.
2) Copy a few real numbers into `insights.md`.
3) Add: “If I were the PM, I would…” decisions.

This turns the repo from “SQL practice” into **business impact**.
