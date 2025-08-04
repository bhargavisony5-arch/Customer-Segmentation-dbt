# Customer-Segmentation-dbt


This project performs customer segmentation using dbt and visualizes insights in Tableau.

---

## 🔍 Objective

To segment customers based on:
- Spend behavior (High, Medium, Low)
- Frequency and Recency of purchases
- Demographics and geography

---

## 🛠 Tech Stack
- **dbt Cloud**
- **SQL Warehouse**
- **Tableau Public**
- GitHub for version control

---

## 🧩 Project Structure

- `models/`
  - `staging/` – Cleansed staging models
  - `marts/` – Business logic for segmentation
  - `mart_customer_segments.sql` – Final customer segmentation
- `schema.yml` – Model descriptions and tests
- `dbt_project.yml` – Project config

---

## 📊 Visual Dashboard

Published Tableau Dashboard:  
👉 [https://public.tableau.com/app/profile/bhargavi.sura8086/viz/CustomerSegmentation-BhargaviSura/Dashboard1?publish=yes]

Key visuals:
- Spend Segment Distribution
- Frequency & Recency segmentation
- Top product categories per segment
- Geographic insights by country
- Monthly revenue trends

---

## 📁 How to Run Locally

1. Clone the repo  
2. Run `dbt deps`  
3. Run `dbt build`  
4. Use Tableau to connect to final tables and visualize

---

## 👤 Author

**Bhargavi Sura**  



