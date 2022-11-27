export class Report {

    constructor(report_ID, report_type, report_date, report_reason, entity_reported_ID){
        this.report_ID = report_ID;
        this.report_type =report_type;
        this.report_date =report_date;
        this.report_reason =report_reason;
        this.entity_reported_ID =entity_reported_ID;
    }
}