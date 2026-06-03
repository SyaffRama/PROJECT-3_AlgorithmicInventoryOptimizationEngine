-- ====================================================================================
-- PROJECT 3: ALGORITHMIC INVENTORY OPTIMIZATION ENGINE
-- PRESCRIPTIVE ANALYTICS: DYNAMIC REORDER POINTS & WORKING CAPITAL MANAGEMENT
-- ====================================================================================

SELECT * FROM supply_chain LIMIT 5;

-- STEP 1: Aggregate Transactional Metrics & Volatility Signals via Base CTE
WITH inventory_metrics AS (
    SELECT 
        location AS warehouse_hub,
        product_type AS product_category,
        AVG(stock_levels) AS current_avg_stock,
        AVG(number_of_products_sold) AS avg_daily_demand,
        STDDEV(number_of_products_sold) AS demand_standard_deviation,
        AVG(lead_times) AS average_lead_time,
        AVG(costs) AS average_unit_cost
    FROM 
        supply_chain
    GROUP BY 
        location, 
        product_type
),

-- STEP 2: Calculate Mathematical Operational Guardrails (Safety Stock & ROP)
inventory_guardrails AS (
    SELECT
        warehouse_hub,
        product_category,
        current_avg_stock,
        avg_daily_demand,
        average_lead_time,
        average_unit_cost,
        
        -- Safety Stock = Z-Score (1.65 for 95% service level) * Demand Volatility * SQRT(Lead Time)
        ROUND((1.65 * demand_standard_deviation * SQRT(average_lead_time))::numeric, 2) AS safety_stock,
        
        -- Reorder Point (ROP) = (Average Daily Demand * Average Lead Time) + Safety Stock
        ROUND(
            ((avg_daily_demand * average_lead_time) + 
            (1.65 * demand_standard_deviation * SQRT(average_lead_time)))::numeric, 
            2
        ) AS reorder_point
    FROM
        inventory_metrics
),

-- STEP 3: Diagnose Capital Efficiency & Overstock Ceilings
inventory_financial_audit AS (
    SELECT
        *,
        -- Overstock Limit is defined as twice the calculated Reorder Point threshold
        ROUND((reorder_point * 2)::numeric, 2) AS overstock_max_limit,
        
        -- Explicitly cast the double precision calculation to numeric before rounding
        CASE 
            WHEN current_avg_stock > (reorder_point * 2) 
            THEN ROUND(((current_avg_stock - (reorder_point * 2)) * average_unit_cost)::numeric, 2)
            ELSE 0.00
        END AS frozen_working_capital
    FROM
        inventory_guardrails
)

-- STEP 4: Final Selection and Execution of the Live Action-Item Pipeline
SELECT
    warehouse_hub AS "Warehouse Hub",
    product_category AS "Product Category",
    ROUND(current_avg_stock::numeric, 0) AS "Current Stock On Hand",
    ROUND(reorder_point::numeric, 0) AS "Calculated Reorder Point (ROP)",
    ROUND(safety_stock::numeric, 0) AS "Calculated Safety Stock Buffer",
    ROUND(overstock_max_limit::numeric, 0) AS "Overstock Ceiling Limit",
    '$' || TO_CHAR(frozen_working_capital, 'FM999,999.00') AS "Frozen Working Capital ($)",
    
    -- Automated Live Operational Status Scoring Logic Engine
    CASE 
        WHEN current_avg_stock = 0 THEN 'CRITICAL STOCKOUT'
        WHEN current_avg_stock <= reorder_point THEN 'REORDER IMMEDIATELY'
        WHEN current_avg_stock > reorder_point AND current_avg_stock <= overstock_max_limit THEN 'HEALTHY'
        WHEN current_avg_stock > overstock_max_limit THEN 'OVERSTOCKED (CAPITAL CRUNCH)'
        ELSE 'UNKNOWN'
    END AS "Operational Health Status"
FROM
    inventory_financial_audit
ORDER BY
    frozen_working_capital DESC,
    "Calculated Reorder Point (ROP)" DESC;