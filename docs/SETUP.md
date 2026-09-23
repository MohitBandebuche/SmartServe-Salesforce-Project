# SmartServe Setup Guide

## 1. Deploy metadata
Deploy the `force-app/main/default` directory with Salesforce CLI.

## 2. Assign permission set
Assign `SmartServe_Support_User` to your test user.

## 3. Create sample data
Create:
- Account: ABC Technologies
- Contact: Rahul Sharma
- Cases:
  - Payment Failed / Payment / High / New
  - Unable to Login / Account / Medium / In Progress
  - Payment Deducted but Order Failed / Payment / Critical / New
  - Product Not Delivered / Delivery / High / Resolved

## 4. Flow configuration
Create these record-triggered flows in Flow Builder.

### SmartServe Case Assignment
Object: Case
Trigger: after save, when created or category changes.

Decision:
- Payment → Payment Support Queue/User
- Technical → Technical Support
- Account → Account Support
- Delivery → Delivery Support
- Refund → Refund Support
- Otherwise → General Support

Then update Case.OwnerId.

### SmartServe Critical Case Notification
Object: Case
Trigger: after save, when Priority becomes Critical.
Action: send an email/custom notification to the manager/support lead.

### SmartServe Resolution Feedback
Object: Case
Trigger: after save, when Status becomes Resolved.
Action: create Customer Feedback record or send a feedback request.

## 5. Apex escalation
`CaseEscalationService` exposes `escalateCases(Set<Id>)`.
For a production implementation, invoke it from a Flow Apex Action or another approved automation entry point.

## 6. Reports
Create:
- All Support Cases
- Open Cases
- Critical Cases
- Cases by Category
- Cases by Priority
- Cases by Support Agent
- Escalated Cases

## 7. Dashboard
Create a dashboard called `SmartServe Support Dashboard` with:
- Total Cases
- Open Cases
- Resolved Cases
- Critical Cases
- Cases by Category
- Cases by Priority
- Cases by Status
- Cases by Support Agent

## 8. Agentforce
Create an Agentforce agent named `SmartServe Customer Support Assistant`.

Suggested instructions:
- Help users with authorized customer-support tasks.
- Never reveal information the current user is not authorized to access.
- Ask for a Case Number before discussing a specific case when required.
- Use Salesforce data/actions rather than inventing case details.
- Confirm important record-changing actions before executing them when appropriate.
- Escalate uncertain or sensitive requests to a human support employee.

Suggested actions:
- Get Case
- Create Case
- Update Case
- Search Cases

Test:
"What is the status of case 00001001?"
"I need help with a payment problem."
"Create a case for my failed payment."

## 9. LWC
Add `smartServeDashboard` to a Lightning App/Home page using Lightning App Builder.

## 10. Testing
Verify:
- Cases can be created.
- Category and priority fields work.
- Apex tests pass.
- Permission set is assigned.
- LWC loads.
- Flows are activated and tested.
- Agentforce only performs configured/authorized actions.
