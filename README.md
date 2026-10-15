# SmartServe — Salesforce Customer Support & Service Management System

SmartServe is a Salesforce-based customer support management project designed to organize customer information, manage support requests, and simplify case management through Salesforce CRM capabilities.

The project demonstrates Salesforce development using Apex, SOQL, Lightning Web Components (LWC), custom objects, permission sets, and Salesforce CLI.

## 🎯 Project Objectives

- Centralize customer support information and requests.
- Organize customer issues using Salesforce Case management.
- Extend standard Salesforce functionality with custom fields and objects.
- Implement Apex business logic for case escalation.
- Provide a custom dashboard interface using Lightning Web Components.
- Apply permission-based access control for support users.
- Practice Salesforce development, testing, and metadata deployment.

## ✨ Features

### 1. Customer Support Management
Uses Salesforce standard objects to organize customer and support information.

- **Account:** Stores company or organization information.
- **Contact:** Stores information about customers and individuals.
- **Case:** Tracks customer issues and support requests.

### 2. Custom Objects

The project includes custom objects to support additional functionality.

- **Support Category (`Support_Category__c`):** Represents categories used to organize support requests.
- **Customer Feedback (`Customer_Feedback__c`):** Stores feedback associated with customer support cases.

### 3. Custom Case Fields

The standard Salesforce Case object is extended with custom fields:

- **Support Category (`Support_Category__c`):** Associates a case with a support category.
- **Assigned Support Agent (`Assigned_Support_Agent__c`):** Stores the assigned support agent information.
- **Resolution (`Resolution__c`):** Records information about the resolution of a case.

### 4. Apex Business Logic

The project includes Apex classes for server-side business logic.

- **CaseEscalationService:** Supports case escalation logic.
- **SmartServeDashboardController:** Provides data for the dashboard interface.
- **Apex Test Classes:** Includes tests for the Apex services and dashboard controller.

### 5. Lightning Web Component

The project includes a custom Lightning Web Component named `smartServeDashboard`.

It provides a foundation for presenting customer support information through a custom Salesforce interface.

### 6. Permission Set

The project includes a permission set named `SmartServe_Support_User` for defining access permissions for support users.

### 7. Salesforce Development and Deployment

The project uses Salesforce DX and Salesforce CLI to validate and deploy metadata to a Salesforce Developer Edition or Trailhead Playground org.

## 🛠️ Technology Stack

| Technology | Purpose |
|---|---|
| Salesforce CRM | Customer and case management |
| Apex | Server-side business logic |
| SOQL | Querying Salesforce records |
| Lightning Web Components (LWC) | Custom user interface |
| HTML | Component structure |
| JavaScript | Component behavior |
| XML | Salesforce metadata configuration |
| Salesforce CLI | Metadata validation and deployment |
| Git and GitHub | Version control and project hosting |
| Trailhead Playground | Salesforce development environment |

## 📂 Project Structure

```text
SmartServe-Salesforce-Project/
│
├── config/
│
├── data/
│
├── docs/
│
├── force-app/
│   └── main/
│       └── default/
│           ├── classes/
│           │   ├── CaseEscalationService.cls
│           │   ├── CaseEscalationServiceTest.cls
│           │   ├── SmartServeDashboardController.cls
│           │   └── SmartServeDashboardControllerTest.cls
│           │
│           ├── lwc/
│           │   └── smartServeDashboard/
│           │       ├── smartServeDashboard.html
│           │       ├── smartServeDashboard.js
│           │       └── smartServeDashboard.js-meta.xml
│           │
│           ├── objects/
│           │   ├── Customer_Feedback__c/
│           │   ├── Support_Category__c/
│           │   └── Case/
│           │
│           └── permissionsets/
│               └── SmartServe_Support_User.permissionset-meta.xml
│
├── .gitignore
├── README.md
└── sfdx-project.json
