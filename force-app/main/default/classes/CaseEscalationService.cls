public with sharing class CaseEscalationService {
    /**
     * Escalates eligible Cases to a higher-priority support path.
     * Intended to be invoked by Flow/Apex automation.
     */
    @InvocableMethod(
        label='Escalate SmartServe Cases'
        description='Escalates critical or high-priority open cases.'
    )
    public static void escalateCases(List<Id> caseIds) {
        if (caseIds == null || caseIds.isEmpty()) {
            return;
        }

        List<Case> casesToUpdate = [
            SELECT Id, Priority, Status, Description
            FROM Case
            WHERE Id IN :caseIds
            FOR UPDATE
        ];

        for (Case c : casesToUpdate) {
            if (c.Status != 'Closed' && c.Status != 'Resolved' &&
                (c.Priority == 'Critical' || c.Priority == 'High')) {

                String note = 'SmartServe escalation: case requires higher-priority review.';
                if (String.isBlank(c.Description)) {
                    c.Description = note;
                } else if (!c.Description.contains(note)) {
                    c.Description += '\n' + note;
                }

                // Keep the record in an active state while flagging it for escalation.
                c.Status = 'In Progress';
            }
        }

        if (!casesToUpdate.isEmpty()) {
            update casesToUpdate;
        }
    }
}
