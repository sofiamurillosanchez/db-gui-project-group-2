const User = require('../models/user');
const Event = require('../models/events');
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
