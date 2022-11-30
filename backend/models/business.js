const knex = require('../database/knex');
const bcrypt = require('bcrypt');
const BUSINESS_TABLE = 'Business';

const createBusiness = async (Business_ID, Business_Name, Business_Location, Email, Phone_Number, Rating) => {
    const query = knex(BUSINESS_TABLE).insert({ Business_ID, Business_Name, Business_Location, Email, Phone_Number, Rating});
    console.log('Raw query for createNewBusiness:', query.toString());
    const result = await query;
    return result;
}

const getAllBusinesses = async () => {
    const query = knex(BUSINESS_TABLE).select();
    console.log('Raw query for getAllBusinesses:', query.toString());
    const result = await query;
    return result;
}

const findBusinessByID = async (Business_ID) => {
    const query = knex(BUSINESS_TABLE).where({ Business_ID });
    const result = await query;
    return result;
}

const findBusinessByName = async (Business_Name) => {
    const query = knex(BUSINESS_TABLE).where({ Business_Name });
    const result = await query;
    return result;
}

const findBusinessByLocation = async (Business_Location) => {
    const query = knex(BUSINESS_TABLE).where({ Business_Location });
    const result = await query;
    return result;
}

const findBusinessByRating = async (Rating) => {
    const query = knex(BUSINESS_TABLE).where({ Rating });
    const result = await query;
    return result;
}

const updateBusinessName = async (Business_ID, Business_Name) => {
    const query = knex(BUSINESS_TABLE).where({ Business_ID }).update({ Business_Name });
    const result = await query;
    return result;
}

const updateBusinessLocation = async (Business_ID, Business_Location) => {
    const query = knex(BUSINESS_TABLE).where({ Business_ID }).update({ Business_Location });
    const result = await query;
    return result;
}

const updateBusinessEmail = async (Business_ID, Email) => {
    const query = knex(BUSINESS_TABLE).where({ Business_ID }).update({ Email });
    const result = await query;
    return result;
}

const updateBusinessPhoneNumber = async (Business_ID, Phone_Number) => {
    const query = knex(BUSINESS_TABLE).where({ Business_ID }).update({ Phone_Number });
    const result = await query;
    return result;
}

const updateBusinessRating = async (Business_ID, Rating) => {
    const query = knex(BUSINESS_TABLE).where({ Business_ID }).update({ Rating });
    const result = await query;
    return result;
}

const deleteBusiness = async (Business_ID) => {
    const query = knex(BUSINESS_TABLE).where({ Business_ID }).del();
    const result = await query;
    return result;
}

module.exports = {
    createBusiness,
    getAllBusinesses,
    findBusinessByID,
    findBusinessByName,
    findBusinessByLocation,
    findBusinessByRating,
    updateBusinessName,
    updateBusinessLocation,
    updateBusinessEmail,
    updateBusinessPhoneNumber,
    updateBusinessRating,
    deleteBusiness
}