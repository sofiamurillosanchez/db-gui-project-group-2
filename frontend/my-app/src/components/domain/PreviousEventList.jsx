export const PreviousEventList = ({events}) =>
    <div className="Event-Scroller">
        <ul className="list-group mt-4 mb-4" style={{listStyleType: "none"}}>
            {
                
                events.map((event, index) =>
                <li key={index} className="list-group-item">
                    <h2>{event.event_name}</h2>
                    <span className="float-end badge bg-primary">Description: {event.event_description}</span>
                    <br></br>
                    <span className="date">Date: {event.event_date}</span>
                    <br></br>
                    <span className="time">Time: {event.event_time}</span>
                    <br></br>
                    <span className="location">Location: {event.event_location}</span>
                    <br></br>
                    <span className="clearfix"></span>
                </li>
                )

            }
        </ul>

    </div>;
    //event_name, event_date, event_time, event_location, event_description