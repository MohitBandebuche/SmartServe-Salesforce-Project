import { LightningElement, wire } from 'lwc';
import getSummary from '@salesforce/apex/SmartServeDashboardController.getSummary';

export default class SmartServeDashboard extends LightningElement {
    summary = { total: 0, open: 0, resolved: 0, critical: 0 };

    @wire(getSummary)
    wiredSummary({ data, error }) {
        if (data) {
            this.summary = data;
        } else if (error) {
            // Keep the component safe and readable if the query fails.
            this.summary = { total: 0, open: 0, resolved: 0, critical: 0 };
        }
    }

    get cards() {
        return [
            { label: 'Total Cases', value: this.summary.total },
            { label: 'Open Cases', value: this.summary.open },
            { label: 'Resolved Cases', value: this.summary.resolved },
            { label: 'Critical Cases', value: this.summary.critical }
        ];
    }
}
