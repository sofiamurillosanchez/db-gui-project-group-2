const knex = require('../database/knex');
const bcrypt = require('bcrypt');
const EVENT_TABLE = 'event';


//Should we create a class for this???? 
const createNewEvent = async (event_name, event_description, event_image, host_email, 
                              start_date, end_date, start_time, end_time, max_capacity, 
                              event_location, ticket_cost, min_age, event_category, 
                              ) => {

    const query = knex(EVENT_TABLE).insert({ event_name, event_description, event_image, host_email, 
                                             start_date, end_date, start_time, end_time, max_capacity, 
                                             event_location, ticket_cost, min_age, event_category, 
                                             });
    console.log('Raw query for createNewEvent:', query.toString());
    const result = await query;
    return result;
};

const findEventByName = async (event_name) => {
    const query = knex(EVENT_TABLE).where({event_name});
    const result = await query;
    return result;
};

const findEventByLocation = async (event_location) => {
    const query = knex(EVENT_TABLE).where({event_location});
    const result = await query;
    return result;
};

const findEventByLocationandDate = async (event_location, start_date) => {
    const query = knex(EVENT_TABLE).where({event_location, start_date});
    const result = await query;
    return result;
};

const findEventByCategory = async (event_category) => {
    const query = knex(EVENT_TABLE).where({event_category});
    const result = await query;
    return result;
};

const findEventByHost = async (host_email) => {
    const query = knex(EVENT_TABLE).where({host_email});
    const result = await query;
    return result;
};

const updateEventImage = async (event_name, event_image) => {
    const query = knex(EVENT_TABLE).where({event_name}).update({event_image});
    const result = await query;
    return result;
};

const updateEventDescription = async (event_name, event_description) => {
    const query = knex(EVENT_TABLE).where({event_name}).update({event_description});
    const result = await query;
    return result;
};

const updateEventDate = async (event_name, start_date, end_date) => {
    const query = knex(EVENT_TABLE).where({event_name}).update({start_date, end_date});
    const result = await query;
    return result;
};

const updateEventTime = async (event_name, start_time, end_time) => {
    const query = knex(EVENT_TABLE).where({event_name}).update({start_time, end_time});
    const result = await query;
    return result;
};

const updateEventCapacity = async (event_name, max_capacity) => {
    const query = knex(EVENT_TABLE).where({event_name}).update({max_capacity});
    const result = await query;
    return result;
};

const updateEventLocation = async (event_name, event_location) => {
    const query = knex(EVENT_TABLE).where({event_name}).update({event_location});
    const result = await query;
    return result;
};

const deleteEvent = async (event_name) => 
{
    const query = knex(EVENT_TABLE).where({event_name}).del();
    const result = await query;
    return result;
};

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
};