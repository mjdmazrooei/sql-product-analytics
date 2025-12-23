# Key Insights (Example Narrative)

> This file is meant to show “product thinking” beyond SQL.

## 1) Funnel: where users drop off
**Observation:** Biggest drop-offs typically happen between `view_product → add_to_cart` and `checkout → purchase`.
- If `p_cart_given_view` is low, the product page is not convincing (pricing, UX, trust signals).
- If `p_purchase_given_checkout` is low, checkout friction is likely (payment failures, shipping surprises, too many steps).

**If I were the PM:**
- Run UX experiments on the product page (social proof, clearer value prop, faster performance).
- Reduce checkout steps and add more payment methods; instrument error events.

## 2) Retention by cohort
**Observation:** Newer cohorts often show slightly better week-1 retention if onboarding improves over time.
- A weak week-1 retention curve usually indicates onboarding doesn’t activate users.

**If I were the PM:**
- Define activation as “used `feature_search` + `feature_recommendations` in first 3 days”.
- Build onboarding nudges that drive users to those features early.

## 3) LTV & pricing
**Observation:** `pro` and `enterprise` dominate LTV but have fewer users.
- Improving conversion into `starter` can grow top-of-funnel; improving upgrade to `pro` can grow LTV.

**If I were the PM:**
- Add an upgrade moment after users hit a usage limit (export/reporting).
- For enterprise: invest in sales-assisted onboarding + invoicing reliability.

## 4) Churn by plan
**Observation:** `starter` churn may be highest due to price sensitivity; `enterprise` churn lowest.
- Churn aligned with time-to-value: users cancel if they never activate.

**If I were the PM:**
- Create churn risk scoring: low feature adoption + low session frequency.
- Trigger win-back campaigns before renewal (discount, training, concierge setup).

---

## How to regenerate these insights
Run the queries in `queries/` after loading `schema.sql` and `data.sql`.
Summarize outputs here with numbers and decisions.
