const knex = require('../database/knex');
const bcrypt = require('bcrypt');
const bannedIP_Superlist_TABLE = 'bannedIP_Superlist';

const getByIP_Address = async (IP_Address)=>{
    const query = knex(bannedIP_Superlist_TABLE).where({ IP_Address });
    const result = await query;
    return result;
}

const getByReport_ID = async(Report_ID)=>{
    const query = knex(bannedIP_Superlist_TABLE).where({ Report_ID });
    const result = await query;
    return result;
}

const addToBanList = async(IP_Address, Report_ID)=>{
    const query = knex(bannedIP_Superlist_TABLE).insert({ IP_Address, Report_ID});
    console.log('Raw query for addtobanlist:', query.toString());
    const result = await query;
    return result;
}

const removeFromBanList = async(IP_Address)=>{
    const query = knex(bannedIP_Superlist_TABLE).delete({ IP_Address});
    console.log('Raw query for removefrombanlist:', query.toString());
    const result = await query;
    return result;
}

const updateIP_Address = async(IP_Address)=>{
    const query = knex(bannedIP_Superlist_TABLE).where({ IP_Address }).update({ IP_Address });
    const result = await query;
    return result;
}

const deter_location_of_Ip = async()=>{
    jQuery.get("http://ipinfo.io", function(response) {
        console.log(response.city);
        const result = response.city;
    }, "jsonp");

    return result;
}

module.exports = {
    getByIP_Address,
    getByReport_ID,
    addToBanList,
    removeFromBanList,
    updateIP_Address,
    deter_location_of_Ip
}