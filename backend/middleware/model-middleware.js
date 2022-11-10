const User = require('../models/user');
const Event = require('../models/event');
const Ticket = require('../models/ticket');
const Business = require('../models/business');
const Report = require('../models/report');
const Event_Request = require('../models/event_request');
const createModelsMiddleware = async (req, res, next) => {
   req.models = {
      user: User,
      event: Event,
      ticket: Ticket,
      business: Business,
      report: Report,
      event_request: Event_Request
  }
  next();
}

module.exports = {
  createModelsMiddleware
}