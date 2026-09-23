public with sharing class SmartServeDashboardController {
    public class Summary {
        @AuraEnabled public Integer total;
        @AuraEnabled public Integer open;
        @AuraEnabled public Integer resolved;
        @AuraEnabled public Integer critical;
    }

    @AuraEnabled(cacheable=true)
    public static Summary getSummary() {
        Summary s = new Summary();

        s.total = [SELECT COUNT() FROM Case];
        s.open = [
            SELECT COUNT()
            FROM Case
            WHERE Status NOT IN ('Resolved', 'Closed')
        ];
        s.resolved = [
            SELECT COUNT()
            FROM Case
            WHERE Status = 'Resolved'
        ];
        s.critical = [
            SELECT COUNT()
            FROM Case
            WHERE Priority = 'Critical'
            AND Status NOT IN ('Resolved', 'Closed')
        ];

        return s;
    }
}
