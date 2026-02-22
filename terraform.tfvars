databricks_url     = "https://dbc-b19eaa89-8cd7.cloud.databricks.com"
workspace_id       = "1721321229624186"
account_console_id = "ffc76eee-f665-402e-9727-0100b29f5e91"

# Analysis Schema Name Should follow this format: YourUnityCatalogName.SchemaName 
# Catalog must exist, schema will be created by SAT
# Hive Metastore is no longer supported
analysis_schema_name = "security_analysis_tool" #example: sat.security_analysis_tool 

### Azure Specific Variables
client_id       = "2a2a14d5-4ba8-4d2d-a18c-a79fe11bcdf6"
client_secret   = "7f187863-1d81-4943-b1a9-bc3695bd7201"
tenant_id       = "03817453-71e3-41f1-9eba-c7661f7094d3"
subscription_id = "3051c1bf-08ce-4ae4-9332-944d57485da0"

# Scheduling
job_compute_num_workers = 3
job_schedule_timezone_id = "America/New_York"
driver_cron_expression = "0 0 8 ? * Mon,Wed,Fri" # Every Monday, Wednesday, and Friday at 8:00 AM
secrets_scanner_cron_expression = "0 0 8 ? * *" # Every day at 8:00 AM

# If you are behind a proxy, you can specify the proxy server here, if not leave this with the default value
# Example:
# {
#   "http": "http://proxy.example.com:8080",
#   "https": "http://proxy.example.com:8080"
# }
proxies = {}

#Flag to run SAT initializer/Driver on Serverless
run_on_serverless = false # [Only monitor current workspace]

# SQL Warehouse ID (Optional)
# Default: "new" - Will create a new SQL warehouse
# To use an existing warehouse, provide its 16-character ID
# Example: "782228d75bf63e5c"
# sqlw_id = "new"
# sql_warehouse_enable_serverless = true
# sql_warehouse_auto_stop_mins = 120

# Secret Scope Name (Optional)
# Default: "sat_scope"
# Customize to use a different scope name (useful for multiple SAT instances or naming conventions)
# Example: "sat_scope_prod" or "sat_scope_scan1"
# secret_scope_name = "sat_scope"



