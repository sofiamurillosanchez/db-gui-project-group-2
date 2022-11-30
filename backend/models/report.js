const knex = require('../database/knex');
const bcrypt = require('bcrypt');
const REPORT_TABLE = 'Report';

const createReport = async(Report_ID, Report_Type, Report_Date, Report_Reason, Sent_To, Report_Addressed, Entity_Reported_ID) => {
    const query = knex(REPORT_TABLE).insert({Report_ID, Report_Type, Report_Date, Report_Reason, 
                                             Sent_To, Report_Addressed, Entity_Reported_ID});
    console.log('Raw query for createReport:', query.toString());
    const result = await query;
    return result;
}

const getAllReports = async () => {
    const query = knex(REPORT_TABLE).select();
    console.log('Raw query for getAllReports:', query.toString());
    const result = await query;
    return result;
}

const findReportByReportID = async (Report_ID) => {
    const query = knex(REPORT_TABLE).where({Report_ID});
    const result = await query;
    return result;
}

const findReportByReportType = async (Report_Type) => {
    const query = knex(REPORT_TABLE).where({Report_Type});
    const result = await query;
    return result;
}

const findReportByReportDate = async (Report_Date) => {
    const query = knex(REPORT_TABLE).where({Report_Date});
    const result = await query;
    return result;
}

const findReportByEntityReportedID = async (Entity_Reported_ID) => {
    const query = knex(REPORT_TABLE).where({Entity_Reported_ID});
    const result = await query;
    return result;
}

const updateReportReason = async (Report_ID, Report_Reason) => {
    const query = knex(REPORT_TABLE).where({Report_ID}).update({Report_Reason});
    const result = await query;
    return result;
}

const updateReportAddressed = async (Report_ID, Report_Addressed) => {
    const query = knex(REPORT_TABLE).where({Report_ID}).update({Report_Addressed});
    const result = await query;
    return result;
}

const deleteReport = async (Report_ID) => {
    const query = knex(REPORT_TABLE).where({Report_ID}).del();
    const result = await query;
    return result;
}

module.exports = {
    createReport,
    getAllReports,
    findReportByReportID,
    findReportByReportType,
    findReportByReportDate,
    findReportByEntityReportedID,
    updateReportReason,
    updateReportAddressed,
    deleteReport
}