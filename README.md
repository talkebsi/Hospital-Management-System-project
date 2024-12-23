# 🏥 Hospital Management System Project

This repository contains a structured SQL-based project aimed at managing the essential operations of a hospital database system. The project incorporates scripts for designing the database schema, implementing role-based access control, encrypting sensitive data, creating performance-enhancing indexes, automating tasks through jobs and alerts, and more. Below is a detailed overview of each file and its purpose.

---

## 📜 Contents
1. [Database Structure](#1-database-structure)
2. [Data Security](#2-data-security)
3. [Query Optimization](#3-query-optimization)
4. [Role-Based Access](#4-role-based-access)
5. [Data Backup and Recovery](#5-data-backup-and-recovery)
6. [Automated Processes and Notifications](#6-automated-processes-and-notifications)
7. [Pre-Built Views for Analytics](#7-pre-built-views-for-analytics)

---

## 1. 📂 Database Structure

The file **`Schema_Creation.sql`** establishes the foundation of the hospital database by defining its schema. It includes tables for managing:

- **Patients**: Captures patient details, including encrypted phone numbers.
- **Doctors**: Contains information about doctors, such as specialization and encrypted contact details.
- **Appointments**: Tracks patient-doctor appointments, including dates and statuses.
- **Medical Supplies**: Monitors inventory, such as stock levels and prices of supplies.
- **Billing**: Manages financial transactions related to appointments.
- **UserRoles and Users**: Implements user roles to ensure controlled access to database resources.

The schema connects these tables using **primary and foreign keys** to maintain a logical and reliable structure.


The diagram below represents the Entity Relationship Diagram (ERD) for the Hospital Management Database. It visualizes the relationships between various entities (tables) within the database, illustrating how they are interconnected.
![ERD](https://github.com/user-attachments/assets/63f8195f-919a-4a73-bd47-3c9d85238e09)

---

## 2. 🔐 Data Security

The file **`Encryption_&_Decryption.sql`** focuses on safeguarding sensitive data within the database. The scripts achieve this by:

- **Creating Encryption Keys and Certificates**: Setting up a secure encryption framework.
- **Encrypting Sensitive Data**: Securing patient and doctor phone numbers using **AES-256 encryption**.

This ensures the **confidentiality** of sensitive information while complying with **data protection standards**.

---

## 3. ⚡ Query Optimization

The file **`Indexes.sql`** includes scripts that improve the efficiency of database queries by creating indexes on key columns:

- **Patients' Names**: Optimizes searches for patient records.
- **Appointment Dates**: Speeds up scheduling queries.
- **Doctor Specializations**: Enhances the performance of queries involving doctor assignments.

These indexes reduce query execution time, especially for **frequently accessed fields**.

---

## 4. 🛡️ Role-Based Access

The file **`User_Role_Management.sql`** defines the roles and permissions for database users:

- **AdminRole**: Provides full database control for administrators.
- **DoctorRole**: Grants access to appointment and patient data.
- **NurseRole**: Allows access to medical supplies and patient information.
- **BillingRole**: Manages billing-related data.

Roles are mapped to specific permissions, ensuring each user has access only to the data relevant to their responsibilities.

---

## 5. 🗄️ Data Backup and Recovery

The file **`Backups.sql`** contains scripts to safeguard the database by creating different types of backups:

- **Full Backups**: Weekly backups of the entire database.
- **Differential Backups**: Daily backups capturing changes since the last full backup.
- **Transaction Log Backups**: Hourly backups of transaction logs to support point-in-time recovery.

These backups provide a robust recovery strategy in case of unexpected **data loss or corruption**.

---

## 6. 🤖 Automated Processes and Notifications

The file **`Jobs_&_Alerts.sql`** simplifies maintenance and monitoring by automating tasks and setting up alerts:

### Scheduled Jobs:
- **Weekly Full Backups**: Ensures a complete backup of the database every week.
- **Daily Differential Backups**: Captures incremental changes daily.
- **Hourly Transaction Log Backups**: Supports fine-grained recovery with hourly transaction log backups.

### Alerts:
- Configures notifications, such as a **"Low Memory Alert"**, to inform administrators of critical system conditions.

These features reduce manual intervention and ensure the system runs smoothly.

---

## 7. 📊 Pre-Built Views for Analytics

The file **`Views_For_Analytics.sql`** provides views to support data analysis and reporting:

- **MonthlyAppointments**: Aggregates the total number of appointments for each month, enabling **trend analysis**.
- **DoctorPerformance**: Summarizes the workload of doctors by counting the number of appointments handled by each.


---

## 🚀 Getting Started

### 1. Download the Repository:
- Clone or download this repository to your local environment.

### 2. Run the SQL Scripts:
- Execute the files in order, starting with the schema creation.

### 3. Set Up Security and Automation:
- Apply encryption to secure sensitive data and set up jobs and alerts for automation.

### 4. Utilize Pre-Built Views:
- Leverage the provided views for analyzing data and generating insights.

### 5. Test the Backup Process:
- Run the backup scripts and verify the recovery process for reliability.

---



Contributions are highly encouraged! If you have any suggestions for improvements 🤝
