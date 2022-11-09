const knex = require('../database/knex');
const bcrypt = require('bcrypt');
const TICKET_TABLE = 'ticket';
const EVENT_TABLE = 'event';

const createNewTicket = async (user_email, event_id, cost) => {
    const query = knex(TICKET_TABLE).insert({user_email, event_id, cost});
    console.log('Raw query for createNewTicket:', query.toString());
    const result = await query;
    return result;
};

const findTicketByID = async (ticket_id) => {
    const query = knex(TICKET_TABLE).where({ ticket_id });
    console.log('Raw query for findTicketByID:', query.toString());
    const result = await query;
    return result;
};

const findTicketByEmail = async (user_email) => {
    const query = knex(TICKET_TABLE).where({ ticket_email });
    console.log('Raw query for findTicketByEmail:', query.toString());
    const result = await query;
    return result;
};

const findTicketByEventID = async (event_ID) => {
    const query = knex(TICKET_TABLE).where({ event_ID });
    console.log('Raw query for findTicketByEventName:', query.toString());
    const result = await query;
    return result;
}