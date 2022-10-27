const User = require('../models/users');
const createModelsMiddleware = async (req, res, next) => {
   req.models = {
      users: User
  }
  next();
}
module.exports = {
  createModelsMiddleware
}