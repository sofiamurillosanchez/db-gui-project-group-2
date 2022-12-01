const express = require('express');
const router = express.Router();

router.post('/createEvent_Request', async (req, res, next) => {
    try {
        const body = req.body;
        const result = await req.models.event_request.createEvent_Request(body.Request_ID, body.Business_ID, 
                                                                          body.Host_ID, body.Description);
        res.status(201).json(result);
    } catch (err) {
        console.error('Failed to create event request:' , err);
        res.status(500).json({ message: err.toString() });
    }
});

router.get('/', async (req, res, next) => {
    try {
        const result = await req.models.event_request.getAllEvent_Requests();
        res.status(200).json(result);
    } catch (err) {
        console.error('Failed to get all event requests:' , err);
        res.status(500).json({ message: err.toString() });
    }
});


router.get('/getEvent_RequestByID', async (req, res, next) => {
    try {
        const body = req.body;
        const result = await req.models.event_request.findEvent_RequestByID(body.Request_ID);
        res.status(201).json(result);
    } catch (err) {
        console.error('Failed to load current event request:' , err);
        res.status(500).json({ message: err.toString() });
    }
});

router.get('/getEvent_RequestByBusinessID', async (req, res, next) => {
    try {
        const body = req.body;
        const result = await req.models.event_request.findEvent_RequestByBusinessID(body.Business_ID);
        res.status(201).json(result);
    } catch (err) {
        console.error('Failed to load current event request:' , err);
        res.status(500).json({ message: err.toString() });
    }
});

router.get('/getEvent_RequestByHostID', async (req, res, next) => {
    try {
        const body = req.body;
        const result = await req.models.event_request.findEvent_RequestByHostID(body.Host_ID);
        res.status(201).json(result);
    } catch (err) {
        console.error('Failed to load current event request:' , err);
        res.status(500).json({ message: err.toString() });
    }
});

router.put('/updateDescription', async (req, res, next) => {
    try {
        const body = req.body;
        const result = await req.models.event_request.updateDescription(body.Request_ID, body.Description);
        res.status(201).json(result);
    } catch (err) {
        console.error('Failed to update description:' , err);
        res.status(500).json({ message: err.toString() });
    }
});

router.delete('/deleteEvent_Request', async (req, res, next) => {
    try {
        const body = req.body;
        const result = await req.models.event_request.deleteEvent_Request(body.Request_ID);
        res.status(201).json(result);
    } catch (err) {
        console.error('Failed to delete event request:' , err);
        res.status(500).json({ message: err.toString() });
    }
});

module.exports = router;
