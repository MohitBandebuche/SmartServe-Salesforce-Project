@IsTest
private class SmartServeDashboardControllerTest {
    @IsTest
    static void returnsCaseSummary() {
        insert new Case(
            Subject = 'Open test case',
            Status = 'New',
            Priority = 'High'
        );

        insert new Case(
            Subject = 'Critical test case',
            Status = 'In Progress',
            Priority = 'Critical'
        );

        insert new Case(
            Subject = 'Resolved test case',
            Status = 'Resolved',
            Priority = 'Medium'
        );

        Test.startTest();
        SmartServeDashboardController.Summary result =
            SmartServeDashboardController.getSummary();
        Test.stopTest();

        System.assertEquals(3, result.total);
        System.assertEquals(2, result.open);
        System.assertEquals(1, result.resolved);
        System.assertEquals(1, result.critical);
    }
}
