# Algorithmic Inventory Optimization & Capital Efficiency Matrix

## 📊 Visual Workspace & Executive Interface

<img width="1184" height="664" alt="DASHBOARD" src="https://github.com/user-attachments/assets/e8f77eaf-1ee8-4446-8fa2-6362ea172ace" />
*Figure 1.1: Comprehensive Executive View displaying Trapped Capital, Warehouse Performance Hierarchies, and Interactive Slicers.*

---

## 1. Introduction
This project establishes an end-to-end data analytics and engineering pipeline that transforms raw supply chain transaction records into an automated, executive-facing asset optimization application. The system integrates a relational **PostgreSQL database infrastructure**, a robust **Power Query ETL layer**, and an interactive **Power BI dashboard** to monitor real-time warehouse holding metrics across global networks.

## 2. The Problem
Enterprise procurement teams frequently operate without data-validated inventory thresholds, leading to emotional or historically unbacked purchasing behaviors. This lack of guardrails triggers two opposing operational failures:
* **Over-Purchasing Liability:** Excess inventory unnecessarily ties up liquid working capital on physical shelves, driving up warehousing footprint costs.
* **Under-Purchasing Risk:** Inadequate buffers cause revenue-killing stockouts and degrade customer retention metrics.
* **Technical Skewing:** Standard textbook stochastic formulas fail when applied directly to raw transaction files because large bulk distribution orders heavily skew standard deviation variables, blinding standard models to physical warehouse constraints.

## 3. The Solution
To resolve this data-scaling clash and establish automated network governance, an **Empirical Threshold Model** was engineered using defensive Power Query M-code logic (`try...otherwise` error traps):
* **Normalized Reorder Points (ROP):** Calculates precisely when warehouse managers must trigger a replenishment order using a standardized 30-day demand velocity script:
  $$\text{Reorder Point} = \left(\frac{\text{Daily Demand}}{30} \times \text{Lead Time}\right) + (\text{Current Stock} \times 0.10)$$
* **The Overstock Ceiling:** Based on empirical network distributions showing historical snapshot inventory hovering at a mean of ~50 units, a strict target operational ceiling of **45 units** was hard-coded into the evaluation script.
* **Capital Risk Logic:** Implemented dynamic tracking equations to isolate the precise financial volume of stagnant inventory:
  $$\text{Frozen Capital} = \text{IF } \text{Current Stock} > 45 \text{ THEN } (\text{Current Stock} - 45) \times \text{Unit Cost} \text{ ELSE } 0$$

## 4. Quantifiable Impact / Results
* **Capital Liberation:** Successfully isolated and exposed **$362,553.07** in non-value-adding, stagnant inventory holding liabilities across the supply network.
* **Bottleneck Isolation:** Mapped financial liability to specific regional distribution points, identifying that **Chicago and Houston** carry the highest trapped capital risk.
* **Segment Remediation:** Pinpointed specialized high-value manufacturing lines (**skincare and cosmetics**) as the root cause of systemic bulk over-purchasing behavior.
* **Frictionless Cross-Filtering:** Compressed executive decision-making cycles from hours to seconds by implementing multi-dimensional dropdown slicers for real-time warehouse-level auditing.
