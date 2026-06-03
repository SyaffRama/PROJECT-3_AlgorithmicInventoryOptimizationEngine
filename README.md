# Algorithmic Inventory Optimization & Capital Efficiency Pipeline

## 📌 Executive Summary
In modern enterprise retail operations, inventory mismanagement directly suppresses profitability. Excess inventory unnecessarily ties up liquid cash on warehouse shelves (**Frozen Working Capital**), while insufficient inventory causes revenue-killing stockouts. 

This project establishes an end-to-end data analytics and engineering pipeline that transforms raw supply chain transaction records into an automated, executive-facing **Risk Radar & Asset Optimization Dashboard**. By implementing an empirical threshold model to bypass raw transactional data skew, this system isolates specific regional warehouse bottlenecks, identifies under-performing product categories, and surfaces thousands of dollars in trapped working capital liability—empowering procurement teams to make immediate, data-backed inventory adjustments.

---

## 📊 Visual Workspace & Executive Interface

<img width="1184" height="664" alt="DASHBOARD" src="https://github.com/user-attachments/assets/e8f77eaf-1ee8-4446-8fa2-6362ea172ace" />
*Figure 1.1: Comprehensive Executive View displaying Trapped Capital, Warehouse Performance Hierarchies, and the Live Procurement Action Ledger.*

---

## 🎯 Project Objectives & Business Goals
1. **Automate Data Ingestion & Transformation:** Migrate raw unstructured/flat-file transactional data into a robust, relational database architecture.
2. **Establish Operational Guardrails:** Construct mathematical thresholds (`Safety Stock` and `Reorder Points`) to define baseline inventory health parameters.
3. **Isolate Capital Inefficiencies:** Quantify the exact dollar value of excess inventory sitting idle across regional distribution centers to maximize asset turnover.
4. **Deliver Actionable Prescriptive Analytics:** Create a high-fidelity visual interface allowing executives to immediately identify and halt wasteful procurement workflows.

---

## 🛠️ Technical Architecture & Toolkit
* **Data Layer / Storage:** PostgreSQL Relational Database Management System (RDBMS)
* **ETL & Data Engineering Engine:** Power Query (M Language) for data type coercion, normalization, and conditional logic computation.
* **Data Visualization & Analytics BI Layer:** Microsoft Power BI Desktop
* **Statistical Logic Modeling:** Empirical baseline thresholding based on historical operational distributional means.

---

## 🏗️ The Data Pipeline Workflow
[Raw Transactional Data] ➔ [PostgreSQL DB Gate] ➔ [Power Query Ingestion & Type Coercion] ➔ [Empirical Business Logic Engine] ➔ [Power BI Executive Dashboard]

### Phase 1: Database Ingestion & Network Connectivity 
To mirror a realistic enterprise infrastructure, raw supply chain datasets were natively piped into a local **PostgreSQL instance**. Power BI was securely connected via an internal database gateway connection to query live tables directly from the public schema, decoupling the physical storage layer from the presentation layer. 

### Phase 2: Data Engineering & Type Normalization 
Upon initial ingestion, raw transactional aggregation caused massive statistical skewing—individual wholesale bulk orders heavily inflated standard deviation metrics, causing textbook stochastic supply chain formulas to break. 
To bypass this roadblock and ensure data pipeline stability, the engine was re-engineered inside the **Power Query Editor**: 
1. **Data Type Coercion:** Explicitly cast string elements and aggregated general formats into explicit decimal numbers (`1.2`) to prevent downstream equation crashes. 
2. **Defensive M-Coding:** Wrapped mathematical equations in `try ... otherwise` error-handling syntax to guarantee a zero-row breakdown during live database refreshes. 

### Phase 3: The Empirical Optimization Logic 
To provide realistic capital audits, an **Empirical Optimization Model** was developed. Given that snapshot warehouse volumes hovered tightly around a historical baseline mean of ~50 units, an **Optimal Maximum Ceiling of 45 units** was established as our 90th percentile threshold limit. 
The custom core formulas implemented inside the ETL pipeline include: 
* **Safety Stock Buffer:** Evaluated as a strict 10% operating margin against snapshot availability to absorb unexpected vendor shipment delays: 
$$\text{Safety Stock} = \text{Current Stock} \times 0.10$$ 
* **Reorder Point (ROP):** Calculates precisely when warehouse managers must trigger a replenishment order, utilizing a normalized 30-day velocity script: 
$$\text{Reorder Point} = \left(\frac{\text{Daily Demand}}{30} \times \text{Lead Time}\right) + \text{Safety Stock}$$ 
* **Frozen Working Capital (The Capital Crunch Metric):** Flags when current stock breaches the target operational ceiling, multiplying the dead inventory units by their manufacturing unit cost: 
$$\text{Frozen Capital} = \text{IF } \text{Current Stock} > 45 \text{ THEN } (\text{Current Stock} - 45) \times \text{Unit Cost} \text{ ELSE } 0$$ 

--- 

## 📊 Key Findings & Executive Insights 
* **The Trapped Capital Footprint:** Across the regional supply network, thousands of dollars in liquid capital are actively trapped on warehouse shelves due to historically blind procurement habits. 
* **Worst-Offending Regional Hub:** The primary bar chart visual instantly isolates specific regional hubs (such as Chicago and Houston) that represent the vast majority of the company's financial holding liabilities. 
* **High-Risk Product Segments:** The category breakdown matrix reveals that specialized divisions (such as skincare or cosmetics) hold severely mismatched supply-to-demand balances compared to more predictable product lines, indicating over-purchasing by raw volume. 
