# Healthcare Management System
<img alt="project" src="https://github.com/v-abhishek/healthcare-management-system/blob/main/images/project-theme.png" />

### PROJECT DESCRIPTION

Healthcare center have multiple departments and each of them tend to maintain their own individual system for record maintenance. This architecture of system design leads to inefficient data sharing, lack data consistency, excessive program maintenance etc.
In order to eliminate these problems, we have designed a centralised database for Healthcare management system to help healthcare providers collect, store, retrieve and exchange patient healthcare information more efficiently and enable better patient care.


---

### Enhanced Entity-Relationship Diagram (EERD)

<img alt="EER" src="https://github.com/v-abhishek/healthcare-management-system/blob/main/images/EER.png" />

---

### Project Structure

1. Scripts folder contains -
	1. HealthCare(DDL) - Script to create database and tables for the associated entities
	2. HealthCare(Programmability) - Script contains Stored Procedures, Views, Triggers, Encryption for SSN, Non-clustered Index of the database
	3. HealthCare(DML) - Script adds mock data into the database
2. Visualization folder contains Dashboards designed using Power BI

---

### Visualization

1. Count of patients for each Doctor
	<img alt="viz1" src="https://github.com/v-abhishek/healthcare-management-system/blob/main/images/viz1.png" />
2. Count of patients associated with each Insurance company
	<img alt="viz2" src="https://github.com/v-abhishek/healthcare-management-system/blob/main/images/viz2.png" />
3. Diagnosis
	<img alt="viz3" src="https://github.com/v-abhishek/healthcare-management-system/blob/main/images/viz3.png" />
4. Medicine Usage
	<img alt="viz4" src="https://github.com/v-abhishek/healthcare-management-system/blob/main/images/viz4.png" />
5. Financial Transactions
	<img alt="viz5" src="https://github.com/v-abhishek/healthcare-management-system/blob/main/images/viz5.png" />
	
---

### LANGUAGE AND TOOLS

- TSQL
- Microsoft SQL Server
- Power BI

### INSTALL AND EXECUTE

- Install Microsoft SQL Server
- Import HealthCare(DDL).sql and execute the script to create database and tables
- Import HealthCare(DML).sql and execute the script to add mock data
- Import HealthCare(Programmability).sql and execute the script to create Stored Procedures, Views, Triggers, Encryption for SSN, Non-clustered Index of the database
- Install Power BI
- Connect to database and open the visualization.pbix to view dashboards