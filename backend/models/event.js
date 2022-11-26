const knex = require('../database/knex');
const bcrypt = require('bcrypt');
const EVENT_TABLE = 'Event';

const createNewEvent = async (Event_id, Event_name, Event_description, Host_Name, 
    Host_Contact_Information, Start_Date, End_Date, Start_Time, End_Time, Num_Expected_Attendees, Max_Capacity, 
    Event_Location_Name, Event_Location_Address, Dress_Code, Ticket_Cost,  Event_Type, Event_Category) => {

    const query = knex(EVENT_TABLE).insert({Event_id, Event_name, Event_description, Host_Name, 
        Host_Contact_Information, Start_Date, End_Date, Start_Time, End_Time, Num_Expected_Attendees, Max_Capacity, 
        Event_Location_Name, Event_Location_Address, Dress_Code, Ticket_Cost,  Event_Type, Event_Category});
    console.log('Raw query for createNewEvent:', query.toString());
    const result = await query;
    return result;
}

const getAllEvents = async () => {
    const query = knex(EVENT_TABLE).select();
    console.log('Raw query for getAllEvents:', query.toString());
    const result = await query;
    return result;
}

const findEventByName = async (Event_name) => {
    const query = knex(EVENT_TABLE).where({Event_name});
    const result = await query;
    return result;
}

const findEventByLocation = async (Event_Location_Name) => {
    const query = knex(EVENT_TABLE).where({Event_Location_Name});
    const result = await query;
    return result;
}

const findEventByLocationandDate = async (Event_Location_Name, Start_Date) => {
    const query = knex(EVENT_TABLE).where({Event_Location_Name, Start_Date});
    const result = await query;
    return result;
}

const findEventByCategory = async (Event_Category) => {
    const query = knex(EVENT_TABLE).where({Event_Category});
    const result = await query;
    return result;
}

const findEventByHost = async (Host_Name) => {
    const query = knex(EVENT_TABLE).where({Host_Name});
    const result = await query;
    return result;
}

const updateEvent = async (Event_id, Event_name, Start_Date, End_Date, Start_Time, End_Time, Event_Location_Name, Event_description) => {
    const query = knex(EVENT_TABLE).where({Event_id}).update({Event_name, Start_Date, End_Date, Start_Time, End_Time, Event_Location_Name, Event_description});
    const result = await query;
    return result;
}

const updateEventName = async (Event_id, Event_name) => {
    const query = knex(EVENT_TABLE).where({Event_id}).update({Event_name});
    const result = await query;
    return result;
}

const updateEventImage = async (Event_id, Event_Image) => {
    const query = knex(EVENT_TABLE).where({Event_id}).update({Event_Image});
    const result = await query;
    return result;
}

const updateEventDescription = async (Event_id, Event_description) => {
    const query = knex(EVENT_TABLE).where({Event_id}).update({Event_description});
    const result = await query;
    return result;
}

const updateEventDate = async (Event_id, Start_Date, End_Date) => {
    const query = knex(EVENT_TABLE).where({Event_id}).update({Start_Date, End_Date});
    const result = await query;
    return result;
}

const updateEventTime = async (Event_id, Start_Time, End_Time) => {
    const query = knex(EVENT_TABLE).where({Event_id}).update({Start_Time, End_Time});
    const result = await query;
    return result;
}

const updateEventCapacity = async (Event_id, Max_Capacity) => {
    const query = knex(EVENT_TABLE).where({Event_id}).update({Max_Capacity});
    const result = await query;
    return result;
}

const updateEventLocation = async (Event_id, Event_Location_Name, Event_Location_Address) => {
    const query = knex(EVENT_TABLE).where({Event_id}).update({Event_Location_Name, Event_Location_Address});
    const result = await query;
    return result;
}

const updateEventCost = async (Event_id, Ticket_Cost) => {
    const query = knex(EVENT_TABLE).where({Event_id}).update({Ticket_Cost});
    const result = await query;
    return result;
}

const updateHostContactInfo = async (Event_id, Host_Name, Host_Contact_Information) => {
    const query = knex(EVENT_TABLE).where({Event_id}).update({Host_Name, Host_Contact_Information});
    const result = await query;
    return result;
}

const deleteEvent = async (Event_id) => {
    const query = knex(EVENT_TABLE).where({Event_id}).del();
    const result = await query;
    return result;
}

module.exports = {
    createNewEvent,
    getAllEvents,
    findEventByName,
    findEventByLocation,
    findEventByLocationandDate,
    findEventByCategory,
    findEventByHost,
    updateEvent,
    updateEventName,
    updateEventImage,
    updateEventDescription,
    updateEventDate,
    updateEventTime,
    updateEventCapacity,
    updateEventLocation,
    updateEventCost,
    updateHostContactInfo,
    deleteEvent,
}