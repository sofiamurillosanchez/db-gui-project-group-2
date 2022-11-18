const knex = require('../database/knex');
const bcrypt = require('bcrypt');
const USER_TABLE = 'User';

const createNewUser = async (email, name, dob, password, company, phone_number,  role, location, zip_code, ip_address, tagged_user) => {
   console.log('Raw password:', password);
   const salt = await bcrypt.genSalt(10);
   console.log('Password salt', salt);
   const hashedPassword = await bcrypt.hash(password, salt);
   console.log('Hashed password', hashedPassword);
   const query = knex(USER_TABLE).insert({ email, name, dob, password: hashedPassword, company, 
                                           phone_number, role, location, zip_code, ip_address, tagged_user});
   console.log('Raw query for createNewUser:', query.toString());
   const result = await query;
   return result;
}

const getAllUsers = async () => {
      const query = knex(USER_TABLE).select();
      console.log('Raw query for getAllUsers:', query.toString());
      const result = await query;
      return result;
}

const findUserByEmail = async (email) => {
      console.log(email);
    const query = knex(USER_TABLE).where({ email: email });
    const result = await query;
    return result;
 }

const findUserByName = async (name) => {
      const query = knex(USER_TABLE).where({ name: name });
      const result = await query;
      return result;
}

const findUserByLocation = async (location) => {
      const query = knex(USER_TABLE).where({ location: location });
      const result = await query;
      return result;
}

const findUserByIP = async (ip_address) => {
      const query = knex(USER_TABLE).where({ ip_address });
      const result = await query;
      return result;
}

const findTaggedUser = async (tagged_user) => {
      const query = knex(USER_TABLE).where({ tagged_user: tagged_user });
      const result = await query;
      return result;
}

const updatePassword = async (email, password) => {
      const salt = await bcrypt.genSalt(10);
      const hashedPassword = await bcrypt.hash(password, salt);
      const query = knex(USER_TABLE).where({ email: email}).update({ password: hashedPassword });
      const result = await query;
      return result;
}

const updateCompany = async (email, company) => {
      const query = knex(USER_TABLE).where({ email: email }).update({ company: company });
      const result = await query;
      return result;
}

const updateRole = async (email, role) => {
      const query = knex(USER_TABLE).where({ email: email }).update({ role: role });
      const result = await query;
      return result;
}

const updateLocation = async (email, location) => {
      const query = knex(USER_TABLE).where({ email: email }).update({ location: location });
      const result = await query;
      return result;
}


const updateUsername = async(email, name)=>{ 
      const query = knex(USER_TABLE).where({ email: email }).update({ name: name });
      const result = await query;
      return result;
}

const updateTaggedUser = async (email, tagged_user) => {
      const query = knex(USER_TABLE).where({ email: email }).update({ tagged_user: tagged_user });
      const result = await query;
      return result;
}

const deleteUser=async(email)=> {
      const query = knex(USER_TABLE).where({ email: email }).del();
      const result = await query;
      return result;
}

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
 }


 module.exports = {
    createNewUser,
    getAllUsers,
    findUserByEmail,
    authenticateUser,
    findUserByName,
    findUserByLocation,
    findUserByIP,
    updatePassword,
    updateCompany,
    updateRole,
    updateLocation,
    updateUsername,
    deleteUser,
    updateTaggedUser,
    findTaggedUser
 }      