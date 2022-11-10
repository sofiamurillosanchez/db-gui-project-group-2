const knex = require('../database/knex');
const bcrypt = require('bcrypt');
const EVENT_REQUEST_TABLE = 'Event_Request';

//probbaly need to add date and time for this in the table
const createEventRequest = async (Request_ID, Business_ID, Host_ID, Description) => {
    const query = knex(EVENT_REQUEST_TABLE).insert({Request_ID, Business_ID, Host_ID, Description});
    console.log('Raw query for createEventRequest:', query.toString());
    const result = await query;
    return result;
}

const findEventRequestByID = async (Request_ID) => {
    const query = knex(EVENT_REQUEST_TABLE).where({Request_ID});
    console.log('Raw query for findEventRequestByID:', query.toString());
    const result = await query;
    return result;
}

const findEventRequestByBusinessID = async (Business_ID) => {
    const query = knex(EVENT_REQUEST_TABLE).where({Business_ID});
    console.log('Raw query for findEventRequestByBusinessID:', query.toString());
    const result = await query;
    return result;
}

const findEventRequestByHostID = async (Host_ID) => {
    const query = knex(EVENT_REQUEST_TABLE).where({Host_ID});
    console.log('Raw query for findEventRequestByHostID:', query.toString());
    const result = await query;
    return result;
}

const updateDescription = async (Request_ID, Description) => {
    const query = knex(EVENT_REQUEST_TABLE).where({Request_ID}).update({Description});
    console.log('Raw query for updateDescription:', query.toString());
    const result = await query;
    return result;
}

const deleteEventRequest = async (Request_ID) => {
    const query = knex(EVENT_REQUEST_TABLE).where({Request_ID}).del();
    console.log('Raw query for deleteEventRequest:', query.toString());
    const result = await query;
    return result;
}

module.exports = {
    createEventRequest,
    findEventRequestByID,
    findEventRequestByBusinessID,
    findEventRequestByHostID,
    updateDescription,
    deleteEventRequest
}