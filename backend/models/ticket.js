const knex = require('../database/knex');
const bcrypt = require('bcrypt');
const TICKET_TABLE = 'Ticket';

const createNewTicket = async (Ticket_ID, User_Email, Event_ID) => {
    const query = knex(TICKET_TABLE).insert({Ticket_ID, User_Email, Event_ID});
    console.log('Raw query for createNewTicket:', query.toString());
    const result = await query;
    return result;
}

const findTicketByID = async (Ticket_ID) => {
    const query = knex(TICKET_TABLE).where({Ticket_ID});
    console.log('Raw query for findTicketByID:', query.toString());
    const result = await query;
    return result;
}

const findTicketByUserEmail = async (User_Email) => {
    const query = knex(TICKET_TABLE).where({User_Email});
    console.log('Raw query for findTicketByEmail:', query.toString());
    const result = await query;
    return result;
}

const findTicketByEventID = async (Event_ID) => {
    const query = knex(TICKET_TABLE).where({ Event_ID });
    console.log('Raw query for findTicketByEventName:', query.toString());
    const result = await query;
    return result;
}

const deleteTicket = async (Ticket_ID) => {
    const query = knex(TICKET_TABLE).where({Ticket_ID}).del();
    console.log('Raw query for deleteTicket:', query.toString());
    const result = await query;
    return result;
}

module.exports = {
    createNewTicket,
    findTicketByID,
    findTicketByUserEmail,
    findTicketByEventID,
    deleteTicket
}