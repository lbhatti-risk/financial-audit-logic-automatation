# Financial Audit Logic & Automation

This repository contains anonymised **Power Query (M)** and **SQL** logic used to automate Completeness & Accuracy (C&A) testing for G-SIB (Global Systemically Important Banks) and high-risk financial audits.

## 🚀 The Problem
During large-scale financial audits, manual reconciliation of transactional data across disparate systems (GCP, BigQuery, Tableau) is prone to human error and logic gaps, especially during mid-period system migrations.

## 🛠️ The Solution: Automated Reconciliation
I developed this logic to perform a **Full Outer Join** between front-end reporting layers and back-end database sources. This ensures:

*   **Completeness**: Identifying "Orphan" records that exist in the source but failed to reach the report.
*   **Accuracy**: Validating field-level integrity (Account IDs, Exposure amounts, Run UUIDs) across 180,000+ records.
*   **Logic Consistency**: Verifying that SQL-based alert configurations remain consistent after cloud migrations (e.g., GCP to BigQuery).

## 📊 Technical Logic Preview
Below is a visual representation of the reconciliation join logic. 

![Automated Reconciliation Logic](Automated-Reconciliation-Logic.png)

### 📂 [View Raw Power Query (M) Script](reconciliation_logic.m)
*Click the link above to view the documented, copy-ready code used for this automation.*

## 💻 Technical Implementation
The logic in this repo demonstrates:
*   **Power Query (M)**: Nested joins and column expansion for multi-source reconciliation.
*   **SQL**: Logic integrity checks and data profiling.
*   **Tools**: Alteryx, BigQuery, Visual Studio Code.

---
**Note on Confidentiality**: All data, account identifiers, and client-specific parameters have been anonymised or replaced with mock values to maintain strict data privacy and professional ethics. These artefacts represent personal methodology and best practices.

---
**Return to main profile**: [github.com/lbhatti-risk](https://github.com/lbhatti-risk)
