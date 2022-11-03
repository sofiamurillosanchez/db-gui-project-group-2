const knex = require('../database/knex');
const bcrypt = require('bcrypt');
const USER_TABLE = 'users';


class user  
{
  createNewUser = async (email, password) => {
   console.log('Raw password:', password);
   const salt = await bcrypt.genSalt(10);
   console.log('Password salt', salt);
   const hashedPassword = await bcrypt.hash(password, salt);
   console.log('Hashed password', hashedPassword);
   const query = knex(USER_TABLE).insert({ email, password: hashedPassword });
   console.log('Raw query for createNewUser:', query.toString());
   const result = await query;
   return result;
};



 findUserByEmail = async (email) => {
    const query = knex(USER_TABLE).where({ email });
    const result = await query;
    return result;
 }

  authenticateUser = async (email, password) => {
    const users = await findUserByEmail(email);
    console.log('Results of users query', users);
    if (users.length === 0) {
        console.error(`No users matched the email: ${email}`);
        return null;
    }
    const user = users[0];
    const validPassword = await bcrypt.compare(password, user.password);
    if (validPassword) {
        delete user.password;
        return user;
    }
    return null;
 }
 async deleteuser(id)
 {
   const results = await this.DBQuery('DELETE FROM user WHERE id = ?', [id]);
   return results;
 }

 async updateuser(name, id) 
{
   const results = await this.DBQuery('UPDATE user SET name = ? WHERE id = ?', [name, id]);
   return results;
}

async fetchStudentsByName (name) //if trying to implement username search?
{
   const results = await this.DBQuery('SELECT * FROM user WHERE name = ?', [name]);
   return results;
}


}

module.export = user;
//  module.exports = {
//     createNewUser,
//     findUserByEmail,
//     authenticateUser
//  };