const express = require('express');
const router = express.Router();

router.post('/createReport', async (req, res, next) => {
    try {
        const body = req.body;
        const result = await req.models.report.createReport(body.Report_ID, body.Report_Type, body.Report_Date, body.Report_Reason, body.Sent_To, body.Report_Addressed, body.Entity_Reported_ID);
        res.status(201).json(result);
    } catch (err) {
        console.error('Failed to create report:' , err);
        res.status(500).json({ message: err.toString() });
    }
});

router.get('/getReportByID', async (req, res, next) => {
    try {
        const body = req.body;
        const result = await req.models.report.findReportByID(body.Report_ID);
        res.status(201).json(result);
    } catch (err) {
        console.error('Failed to load report:' , err);
        res.status(500).json({ message: err.toString() });
    }
});

router.get('/getReportByType', async (req, res, next) => {
    try {
        const body = req.body;
        const result = await req.models.report.findReportByType(body.Report_Type);
        res.status(201).json(result);
    } catch (err) {
        console.error('Failed to load report:' , err);
        res.status(500).json({ message: err.toString() });
    }
});

router.get('/getReportByDate', async (req, res, next) => {
    try {
        const body = req.body;
        const result = await req.models.report.findReportByDate(body.Report_Date);
        res.status(201).json(result);
    } catch (err) {
        console.error('Failed to load report:' , err);
        res.status(500).json({ message: err.toString() });
    }
});

router.put('/updateReportReason', async (req, res, next) => {
    try {
        const body = req.body;
        const result = await req.models.report.updateReportReason(body.Report_ID, body.Report_Reason);
        res.status(201).json(result);
    } catch (err) {
        console.error('Failed to update report:' , err);
        res.status(500).json({ message: err.toString() });
    }
});

router.put('/updateReportAddressed', async (req, res, next) => {
    try {
        const body = req.body;
        const result = await req.models.report.updateReportAddressed(body.Report_ID, body.Report_Addressed);
        res.status(201).json(result);
    } catch (err) {
        console.error('Failed to update report:' , err);
        res.status(500).json({ message: err.toString() });
    }
});

module.exports = router;