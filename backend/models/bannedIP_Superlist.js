//NOTE:: This is the Models File!

const knex = require('../database/knex');
const bcrypt = require('bcrypt');
const bannedIP_Superlist_TABLE = 'bannedIP_Superlist';

const getbanneduserByIP_Address = async (IP_Address)=>
{
    const query = knex(bannedIP_Superlist_TABLE).where({ IP_Address });
    const result = await query;
    return result;
}

const getUserbyReport_ID = async(Report_ID)=>
{
    const query = knex(bannedIP_Superlist_TABLE).where({ Report_ID });
    const result = await query;
    return result;
}


const addtobanlist = async(IP_Address, Report_ID)=>
{
    const query = knex(bannedIP_Superlist_TABLE).insert({ IP_Address, Report_ID});
    console.log('Raw query for addtobanlist:', query.toString());
    const result = await query;
    return result;
}

const removefrombanlist = async(IP_Address, Report_ID)=>
{

    const query = knex(bannedIP_Superlist_TABLE).delete({ IP_Address, Report_ID});
    console.log('Raw query for removefrombanlist:', query.toString());
    const result = await query;
    return result;

}

const updatebannedIP = async(IP_Address, Report_ID)=> //Are the parameters correct for this operation? I am assuming Report ID will also be unique like the IP_Address???
{
    const query = knex(bannedIP_Superlist_TABLE).where({ Report_ID }).update({ IP_Address });
    const result = await query;
    return result;
}

const deter_location_of_Ip = async()=>
{
    jQuery.get("http://ipinfo.io", function(response) {
        console.log(response.city);
        const result = response.city;
    }, "jsonp");

    return result;
}

module.exports = {
    getbanneduserByIP_Address,
    getUserbyReport_ID,
    addtobanlist,
    removefrombanlist,
    updatebannedIP,
    deter_location_of_Ip
}