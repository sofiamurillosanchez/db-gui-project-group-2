const knex = require('../database/knex');
const bcrypt = require('bcrypt');
const USER_TABLE = 'users';
const createNewUser = async (email, name, dob, password, company, phone_number,  role, location, zip_code, ip_address) => {
   console.log('Raw password:', password);
   const salt = await bcrypt.genSalt(10);
   console.log('Password salt', salt);
   const hashedPassword = await bcrypt.hash(password, salt);
   console.log('Hashed password', hashedPassword);
   const query = knex(USER_TABLE).insert({ email, name, dob, password: hashedPassword, company, 
                                           phone_number, role, location, zip_code, ip_address});
   console.log('Raw query for createNewUser:', query.toString());
   const result = await query;
   return result;
};

const findUserByEmail = async (email) => {
    const query = knex(USER_TABLE).where({ email });
    const result = await query;
    return result;
 };

 const findUserByName = async (name) => {
      const query = knex(USER_TABLE).where({ name });
      const result = await query;
      return result;
};

const findUserByLocation = async (location) => {
      const query = knex(USER_TABLE).where({ location });
      const result = await query;
      return result;
};

const findUserByIP = async (ip_address) => {
      const query = knex(USER_TABLE).where({ ip_address });
      const result = await query;
      return result;
};

const updateCompany = async (email, company) => {
      const query = knex(USER_TABLE).where({ email }).update({ company });
      const result = await query;
      return result;
};

const updateRole = async (email, role) => {
      const query = knex(USER_TABLE).where({ email }).update({ role });
      const result = await query;
      return result;
};

const updateLocation = async (email, location) => {
      const query = knex(USER_TABLE).where({ email }).update({ location });
      const result = await query;
      return result;
};

const updateUsername = async(name)=>{ 
      const results = await this.DBQuery('UPDATE user SET name = ? WHERE email = ?', [name, email]); //NOTE: Email is the primary Key for User now
      return results;
};

const deleteUser=async(email)=> {
      const results = await this.DBQuery('DELETE FROM user WHERE email = ?', [email]);
      return results;
};

 const authenticateUser = async (email, password) => {
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
 };

 module.exports = {
    createNewUser,
    findUserByEmail,
    authenticateUser,
    findUserByName,
    findUserByLocation,
    findUserByIP,
    updateCompany,
    updateRole,
    updateLocation,
    updateUsername,
    deleteUser
 };