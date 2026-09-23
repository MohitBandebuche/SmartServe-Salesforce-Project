# SmartServe — Salesforce Customer Support & Service Management System

A Salesforce DX-style project blueprint for a fresher-level Salesforce portfolio/interview project.

## Features
- Account → Contact → Case data model
- Custom Support Category and Customer Feedback objects
- Case assignment and critical-case automation with Flow metadata
- Apex case-escalation service
- Lightning Web Component dashboard summary
- Permission-set examples
- Agentforce setup/instructions
- Sample data and test plan
- Reports/dashboard implementation guide

## Important
This repository contains deployable Salesforce metadata plus setup documentation. Agentforce configuration and some declarative UI/report/dashboard setup are intentionally documented because those features are configured through the Salesforce UI/Agent Builder and can vary by org/edition.

## Prerequisites
- Salesforce Developer Edition or suitable Salesforce org
- Salesforce CLI (`sf`)
- VS Code + Salesforce Extension Pack
- Authorize your org before deployment

## Deploy
1. Create/open a Salesforce DX project.
2. Copy the `force-app` directory into the project.
3. Run:
   `sf project deploy start --source-dir force-app/main/default`
4. Run Apex tests:
   `sf apex run test --test-level RunLocalTests --wait 10`
5. Follow `docs/SETUP.md` for Flow, sample data, reports/dashboard and Agentforce configuration.

## Suggested interview demo
Create an Account and Contact, then create a Case with Category and Priority. Show the automation, Apex escalation action, security, dashboard, and Agentforce assistant.

## Safety
Do not expose real customer data. Use fictional sample records.
