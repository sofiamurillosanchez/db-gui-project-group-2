const User = require('../models/users');
const Event = require('../models/event');
const createModelsMiddleware = async (req, res, next) => {
   req.models = {
      users: User,
      event: Event
  }
  next();
}

module.exports = {
  createModelsMiddleware
}