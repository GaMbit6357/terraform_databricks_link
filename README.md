# Azure Databricks Security & Governance Pipeline (SAT)

An end-to-end deployment of the Databricks Security Analysis Tool (SAT) using Terraform, featuring legacy-to-Unity Catalog refactoring and automated SAST auditing via GitHub Actions.

## Project Overview
This project demonstrates the deployment and configuration of an automated security governance framework within an Azure Databricks workspace. It covers the full lifecycle of a modern Data Engineering project, including Infrastructure-as-Code (IaC), DevSecOps history sanitization, and architectural modernization.

##  Technical Stack
* **Infrastructure**: Terraform, Azure Cloud
* **Data Governance**: Unity Catalog, Serverless SQL Warehouses
* **Languages**: Python, Spark SQL
* **Security**: Bandit (SAST), Databricks SAT (Infrastructure Audit)
* **CI/CD**: GitHub Actions

## Key Implementation Phases

### 1. Infrastructure-as-Code (IaC)
* Deployed the Databricks workspace and SAT infrastructure using **Terraform**.
* Implemented secure secret management using `.tfvars` to handle Azure Service Principal credentials without exposing them in code.

### 2. DevSecOps & History Sanitization
* Identified and remediated high-risk security leaks (exposed `.tfvars`) in the Git history.
* Utilized advanced Git history scrubbing techniques to remove large binary artifacts and credentials, ensuring a clean, production-ready repository.

### 3. Unity Catalog & Serverless Refactoring
* **Challenge**: The legacy SAT SDK was hardcoded for the `hive_metastore` and traditional clusters, causing failures on modern Serverless SQL compute.
* **Solution**: Refactored the Python logic to support **Unity Catalog** namespaces. Re-routed data persistence to a managed catalog (`security_analysis_tool`) to ensure compliance with modern Databricks governance standards.

### 4. Automated Security Auditing
* **CI/CD Integration**: Established a **GitHub Action** using **Bandit** to perform Static Application Security Testing (SAST) on every commit.
* **Compliance Mapping**: Executed audits against **78 security best practices** mapped to the **Data & AI Security Framework (DASF)**.
* **Result**: Validated a 100% compliant security posture with zero identified high-risk configuration drifts or secret exposures.

## Security Control Mapping
The deployment validates the following DASF Control Domains:
* **DASF-33**: Secure Credential Management
* **DASF-1**: SSO and MFA Enforcement
* **DASF-4**: Private Link & Network Isolation
* **DASF-43**: Fine-grained Access Control Lists (ACLs)

## How to Run
1.  Initialize infrastructure: `terraform init && terraform apply`.
2.  Run the **Initializer** notebook to establish Unity Catalog schemas.
3.  Execute the **Driver** notebook to perform the workspace-wide audit.
4.  View results via the provided Spark SQL reporting queries.
