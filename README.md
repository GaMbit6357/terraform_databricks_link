# Azure Databricks Security & Governance Pipeline (SAT)

An end-to-end deployment of the Databricks Security Analysis Tool (SAT) using Terraform, featuring legacy-to-Unity Catalog refactoring and automated SAST auditing via GitHub Actions.

##  Project Overview
This project demonstrates the deployment and configuration of an automated security governance framework within an Azure Databricks workspace. It covers the full lifecycle of a modern Data Engineering project, including Infrastructure-as-Code (IaC), DevSecOps history sanitization, and architectural modernization.

##  Technical Stack
* **Infrastructure**: Terraform, Azure Cloud
* **Data Governance**: Unity Catalog, Serverless SQL Warehouses
* **Languages**: Python, Spark SQL
* **Security**: Bandit (SAST), Databricks SAT (Infrastructure Audit)
* **CI/CD**: GitHub Actions

##  Key Implementation Phases

### 1. Infrastructure-as-Code (IaC)
* Deployed the Databricks workspace and SAT infrastructure using **Terraform**.
* Implemented secure secret management using `.tfvars` to handle Azure Service Principal credentials without exposing them in code.

### 2. DevSecOps & History Sanitization
* **The Problem**: Initial commits accidentally included sensitive `.tfvars` files and large binary Terraform state artifacts.
* **The Solution**: I performed a deep-clean of the repository history using `git-filter-repo` and `git push --force`. This ensured that no legacy credentials remained in the commit history, fulfilling the "Secret Scanning" best practices identified by the tool itself.

### 3. Unity Catalog & Serverless Refactoring
* **The Problem**: The legacy SAT SDK was hardcoded for the `hive_metastore` and traditional clusters, causing a `[UC_HIVE_METASTORE_DISABLED_EXCEPTION]` on modern Serverless SQL compute.
* **The Solution**: I manually refactored the Python logic in the initialization and driver notebooks to utilize the **3-level namespace** (Catalog > Schema > Table). I redirected data persistence to a managed catalog (`security_analysis_tool`) to ensure compliance with modern Databricks governance standards.



### 4. Automated Security Auditing
* **CI/CD Integration**: Established a **GitHub Action** using **Bandit** to perform Static Application Security Testing (SAST) on every commit.
* **Compliance Mapping**: Execoted audits against **78 security best practices** mapped to the **Data & AI Security Framework (DASF)**.
* **Result**: Validated a 100% compliant security posture with zero identified high-risk configuration drifts or secret exposures.

##  Security Insights & Visualization
The deployment includes an automated analytics dashboard within Databricks SQL to provide stakeholders with a high-level view of security coverage:

| Category Code | Security Domain | Description |
| :--- | :--- | :--- |
| **DP** | **Data Protection** | Encryption at rest, model encryption, and credential rotation. |
| **GOV** | **Governance** | Audit logging, library controls, and workspace compliance. |
| **IA / INFO** | **Identity & Access** | SSO, MFA enforcement, and Service Principal permissions. |
| **NS** | **Network Security** | IP Access Lists, Private Link status, and cluster isolation. |



##  How to Run
1. Initialize infrastructure: `terraform init && terraform apply`.
2. Run the **Initializer** notebook to establish Unity Catalog schemas.
3. Execute the **Driver** notebook to perform the workspace-wide audit.
4. View results via the provided Spark SQL reporting queries.
