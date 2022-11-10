const knex = require('../database/knex');
const bcrypt = require('bcrypt');
const EVENT_TABLE = 'Event';

const createNewEvent = async (Event_id, Event_name, Event_description, Event_Image, Host_Name, 
                Host_Contact_Information, Start_Date, End_Date, Start_Time, End_Time, Num_Expected_Attendees, Max_Capacity, 
                Event_Location_Name, Event_Location_Address, Dress_Code, Ticket_Cost, Minimum_Age_Requirement,  Event_Type, Event_Category,
                Event_Activities, Status) => {

    const query = knex(EVENT_TABLE).insert({Event_id, Event_name, Event_description, Event_Image, Host_Name, 
        Host_Contact_Information, Start_Date, End_Date, Start_Time, End_Time, Num_Expected_Attendees, Max_Capacity, 
        Event_Location_Name, Event_Location_Address, Dress_Code, Ticket_Cost, Minimum_Age_Requirement,  Event_Type, Event_Category,
        Event_Activities, Status});
    console.log('Raw query for createNewEvent:', query.toString());
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

const deleteEvent = async (Event_id) => {
    const query = knex(EVENT_TABLE).where({Event_id}).del();
    const result = await query;
    return result;
}

module.exports = {
    createNewEvent,
    findEventByName,
    findEventByLocation,
    findEventByLocationandDate,
    findEventByCategory,
    findEventByHost,
    updateEventImage,
    updateEventDescription,
    updateEventDate,
    updateEventTime,
    updateEventCapacity,
    updateEventLocation,
    deleteEvent,
}