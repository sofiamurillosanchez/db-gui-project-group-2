export const EventDetails = ({event}) =>
    <div className="Event-Detail-Container">
        <h2>{event.event_name}</h2>
        <h4>{event.event_description}</h4>
        <div className="location-details">
            <h4>{event.event_location}</h4>
            <h4>{event.event_location_name}</h4>
            <h4>{event.event_location_address}</h4>
        </div>
        <div className="host-details">

            <h4>{event.host_name}</h4>
            <button>view {event.host_name}'s profile</button>
        </div>
        <div className="time-details">
            <h4>{event.event_start_time}</h4>
            <h4>{event.event_end_time}</h4>
            <h4>{event.event_start_date}</h4>
            <h4>{event.event_end_date}</h4>
        </div>
        <div className="guest-numbers">
            <h4>Expected Attendees: {event.expected_attendees}</h4>
            <h4>Max Capacity: {event.max_capacity}</h4>
        </div>
        <button class="buy-ticket">Buy Ticket</button>

    </div>
    //
    //event_name, event_start_date, event_start_time, event_location, event_description,
    // event_type, dress_code, event_location_address, event_location_name,
    // host_user_id, host_contact, host_name, event_image, event_ID, event_category,
    // event_end_date, event_end_time, event_status, expected_attendees,
    // actual_attendees, max_capacity, ticket_cost, min_age, activities
    //