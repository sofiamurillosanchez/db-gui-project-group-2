const mysql = require('mysql');
const util = require('util');
const connectToDatabase = async () => {
   try {
       const DBConnection = mysql.createConnection({
           host: 'database-1.ckuukf9ol4id.us-east-1.rds.amazonaws.com',
           user: 'admin',
           password: 'energyVeil2',
           insecureAuth: true,
           database: 'db'
       });
       // Create the connection
       const DBCreateConnection = util.promisify(DBConnection.connect).bind(DBConnection);
       await DBCreateConnection();
       // We return two things: a function that lets us run queries, and another to
       // disconnect from the DB at the end of a route
       const DBQuery = util.promisify(DBConnection.query).bind(DBConnection);
       const disconnect = () => DBConnection.end();
       return { DBQuery, disconnect };
   } catch (err) {
       console.error('There was an error with the DB', err);
       throw err;
   }
};
module.exports = connectToDatabase;