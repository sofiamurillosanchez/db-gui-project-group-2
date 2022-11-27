export class Event {

    constructor(event_name, event_start_date, event_start_time, event_location, event_description,
                event_type, dress_code, event_location_address, event_location_name,
                host_user_id, host_contact, host_name, event_image, event_ID, event_category,
                event_end_date, event_end_time, event_status, expected_attendees,
                actual_attendees, max_capacity, ticket_cost, min_age, activities
                ){
        this.event_name = event_name;
        this.event_start_date = event_start_date;
        this.event_start_time = event_start_time;
        this.event_location = event_location;
        this.event_description = event_description;
        this.event_type =event_type;
        this.dress_code =dress_code;
        this.event_location_address =event_location_address;
        this.event_location_name =event_location_name;
        this.host_user_id =host_user_id;
        this.host_contact =host_contact;
        this.host_name =host_name;
        this.event_image =event_image;
        this.event_ID =event_ID;
        this.event_category =event_category;
        this.event_end_date =event_end_date;
        this.event_end_time =event_end_time;
        this.event_status =event_status;
        this.expected_attendees =expected_attendees;
        this.actual_attendees =actual_attendees;
        this.max_capacity =max_capacity;
        this.ticket_cost =ticket_cost;
        this.min_age =min_age;
        this.activities =activities;
    }
}