module.exports = {
    development: {
      client: 'mysql',
      debug: true,
      connection: {
        host : 'database-1.ckuukf9ol4id.us-east-1.rds.amazonaws.com',
        port : 3306,
        user : 'admin',
        password : 'energyVeil2',
        insecureAuth: true,
        database : 'db'
      }
    },

//to use a database created in real world
   production: {
    client: 'mysql',
    debug: true,
    connection: {
      host : 'smudb-mysql.mysql.database.azure.com',           //change this
      port : 3306,
      user : 'dbrittain',
      password : 'Password!',
      ssl : true,
      database : 'smu'
    }
   }
  };
