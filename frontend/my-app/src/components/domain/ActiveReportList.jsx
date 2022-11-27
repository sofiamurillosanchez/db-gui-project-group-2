export const ActiveReportList = ({reports}) => 
<div className="Event-Scroller">
<ul className="list-group mt-4 mb-4" style={{listStyleType: "none"}}>
    {
        
        reports.map((report, index) =>
        <li key={index} className="list-group-item">
            <h2>Report ID: {report.report_ID}</h2>
            <span className="float-end badge bg-primary">Type: {report.report_type}</span>
            <br></br>
            <span className="date">Date: {report.report_date}</span>
            <br></br>
            <span className="reason">Reason: {report.report_reason}</span>
            <br></br>
            <span className="entity-reported">Entity Reported ID: {report.entity_reported_ID}</span>
            <br></br>
            <span className="clearfix"></span>
        </li>
        )

    }
</ul>

</div>;

//report_ID, report_type, report_date, report_reason, entity_reported_id