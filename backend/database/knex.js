const knexConfig = require('../knexfile');
const knex = require('../database/knex');
module.exports = knexConfig.production;