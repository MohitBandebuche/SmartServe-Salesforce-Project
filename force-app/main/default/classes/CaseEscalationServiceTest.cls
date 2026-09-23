@IsTest
private class CaseEscalationServiceTest {
    @IsTest
    static void escalatesHighPriorityOpenCase() {
        Account a = new Account(Name = 'SmartServe Test Account');
        insert a;

        Contact c = new Contact(
            FirstName = 'Rahul',
            LastName = 'Sharma',
            Email = 'rahul.smartserve@example.com',
            AccountId = a.Id
        );
        insert c;

        Case cs = new Case(
            AccountId = a.Id,
            ContactId = c.Id,
            Subject = 'Payment issue',
            Description = 'Customer payment issue',
            Priority = 'High',
            Status = 'New'
        );
        insert cs;

        Test.startTest();
        CaseEscalationService.escalateCases(new List<Id>{cs.Id});
        Test.stopTest();

        Case actual = [
            SELECT Status, Description
            FROM Case
            WHERE Id = :cs.Id
        ];

        System.assertEquals('In Progress', actual.Status);
        System.assert(actual.Description.contains('SmartServe escalation'));
    }

    @IsTest
    static void ignoresClosedCase() {
        Account a = new Account(Name = 'SmartServe Closed Account');
        insert a;

        Case cs = new Case(
            AccountId = a.Id,
            Subject = 'Closed issue',
            Priority = 'Critical',
            Status = 'Closed'
        );
        insert cs;

        Test.startTest();
        CaseEscalationService.escalateCases(new List<Id>{cs.Id});
        Test.stopTest();

        Case actual = [SELECT Status, Description FROM Case WHERE Id = :cs.Id];
        System.assertEquals('Closed', actual.Status);
        System.assert(!String.valueOf(actual.Description).contains('SmartServe escalation'));
    }
}
