# SmartServe Interview Notes

## 1. What problem does it solve?
It centralizes customer information and support requests so a company can track issues from creation to resolution.

## 2. Why Salesforce?
Salesforce provides CRM, data management, automation, security, reporting and AI capabilities on one platform.

## 3. Workflow
Customer → Contact/Account → Case → Assignment → Flow automation → Apex escalation when required → Agentforce assistance → Resolution → Feedback → Dashboard.

## 4. Data model
Account stores organization information. Contact stores people associated with an Account. Case stores support issues. Support Category and Customer Feedback provide additional structure.

## 5. Why Account, Contact and Case?
They map naturally to a customer-support process and are standard Salesforce objects.

## 6. What is Flow?
Flow is Salesforce's declarative automation tool.

## 7. Why Flow?
For straightforward business automation such as assignment, notifications and status-based actions.

## 8. Why Apex?
For custom logic that is better handled programmatically, such as reusable escalation logic.

## 9. Flow vs Apex
Flow is declarative and easier to configure for many business automations. Apex is programmatic and is useful for complex or reusable logic.

## 10. What is Agentforce?
Salesforce's platform for building and deploying AI agents that can work with authorized business data and actions.

## 11. How does the agent work?
It receives a request, determines the appropriate configured topic/action, uses authorized Salesforce data/actions, and returns a response. It should not invent case information.

## 12. AI Agent vs Chatbot
A chatbot generally responds to questions/conversations. An AI agent can use tools/actions and work through a task toward a goal.

## 13. Security
Use Salesforce object/field permissions, profiles, permission sets, roles and record access. Agentforce actions should also respect authorization.

## 14. Profiles vs Permission Sets
Profiles provide baseline permissions. Permission sets grant additional permissions without changing the user's profile.

## 15. Reports/Dashboard
Open, resolved and critical cases; category/priority/status breakdowns; support-agent workload; escalated cases.

## 16. Biggest challenge
Choosing when to use declarative automation versus Apex and making sure the AI agent only performs authorized actions.

## 17. What did you learn?
How Salesforce combines CRM data, automation, custom code, security, reporting and AI.

## 18. Improvements
Add SLA monitoring, knowledge articles, customer portal, richer Agentforce actions, better analytics and integration with external systems.

## 19. Scaling
Use queues, bulk-safe Apex, optimized flows, proper sharing/security, monitoring, integration patterns and modular automation.
