const express = require('express');
const router = express.Router();

    router.get('/getEvent', async (req, res, next) => {
        try {
            const result = await req.models.event.findEventByName(req.body.email);
            res.status(201).json(result);
        } catch (err) {
            console.error('Failed to load event:' , err);
            res.status(500).json({ message: err.toString() });
        }
    });

    router.get('/getEventByLocation', async (req, res, next) => {
        try {
            const body = req.body;
            console.log(body);
            console.log(req.models);
            const result = await req.models.event.findEventByLocation(body.event_location);
            res.status(201).json(result);
        } catch (err) {
            console.error('Failed to load event:' , err);
            res.status(500).json({ message: err.toString() });
        }
        next();
    });

    router.get('/getEventByLocationandDate', async (req, res, next) => {
        try {
            const body = req.body;
            console.log(body);
            console.log(req.models);
            const result = await req.models.event.findEventByLocationandDate(body.event_location, body.start_date);
            res.status(201).json(result);
        } catch (err) {
            console.error('Failed to load event:' , err);
            res.status(500).json({ message: err.toString() });
        }
        next();
    });

    router.get('/getEventByCategory', async (req, res, next) => {
        try {
            const body = req.body;
            console.log(body);
            console.log(req.models);
            const result = await req.models.event.findEventByCategory(body.event_category);
            res.status(201).json(result);
        } catch (err) {
            console.error('Failed to load event:' , err);
            res.status(500).json({ message: err.toString() });
        }
        next();
    });

    router.get('/getEventByHost', async (req, res, next) => {
        try {
            const body = req.body;
            console.log(body);
            console.log(req.models);
            const result = await req.models.event.findEventByHost(body.host_email);
            res.status(201).json(result);
        } catch (err) {
            console.error('Failed to load event:' , err);
            res.status(500).json({ message: err.toString() });
        }
        next();
    });


    router.post('/createEvent', async (req, res, next) => {
        try {
            const body = req.body;
            console.log(body);
            console.log(req.models);
            const result = await req.models.event.createNewEvent(body.event_name, body.event_description, body.event_image, body.host_email, 
                body.start_date, end_date, start_time, end_time, max_capacity, 
                body.event_location, body.ticket_cost, body.min_age, body.event_category,);
            res.status(201).json(result);
        } catch (err) {
            console.error('Failed to create new event:', err);
            res.status(500).json({ message: err.toString() });
        }
        next();
        });

    router.put('setImageUrl', async (req, res, next) => {
        try {
            const body = req.body;
            console.log(body);
            console.log(req.models);
            const result = await req.models.event.setImageUrl(body.event_name, body.event_image);
            res.status(201).json(result);
        } catch (err) {
            console.error('Failed to set image url:', err);
            res.status(500).json({ message: err.toString() });
        }
        next(); 
    });

    router.put('setDescription', async (req, res, next) => {
        try {
            const body = req.body;
            console.log(body);
            console.log(req.models);
            const result = await req.models.event.setDescription(body.event_name, body.event_description);  
            res.status(201).json(result);
        } catch (err) {
            console.error('Failed to set description:', err);
            res.status(500).json({ message: err.toString() });
        }
        next();
    });


    router.put('/setDate', async (req, res, next) => {
        try {
            const body = req.body;
            console.log(body);
            console.log(req.models);
            const result = await req.models.event.updateEventDate(body.event_name, body.start_date, body.end_date);
            res.status(201).json(result);
        } catch (err) {
            console.error('Failed to update event date:', err);
            res.status(500).json({ message: err.toString() });
        }
        next();
    });

    router.put('/setTime', async (req, res, next) => {
        try {
            const body = req.body;
            console.log(body);
            console.log(req.models);
            const result = await req.models.event.updateEventTime(body.event_name, body.start_time, body.end_time);
            res.status(201).json(result);
        } catch (err) {
            console.error('Failed to update event time:', err);
            res.status(500).json({ message: err.toString() });
        }
        next();
    });
 
    router.put('/setCapacity', async (req, res, next) => {
        try {
            const body = req.body;
            console.log(body);
            console.log(req.models);
            const result = await req.models.event.updateEventCapacity(body.event_name, body.max_capacity);
            res.status(201).json(result);
        } catch (err) {
            console.error('Failed to update event capacity:', err);
            res.status(500).json({ message: err.toString() });  
        }
        next();
    });


    router.put('/setLocation', async (req, res, next) => {
    try {
        const body = req.body;
        console.log(body);
        console.log(req.models);
        const result = await req.models.event.updateEventLocation(body.event_name, body.event_location);
        res.status(201).json(result);
    } catch (err) {
        console.error('Failed to update event location:', err);
        res.status(500).json({ message: err.toString() });
    }
    next();
    });

    router.put('/setCost', async (req, res, next) => {
        try {
            const body = req.body;
            console.log(body);
            console.log(req.models);
            const result = await req.models.event.updateEventCost(body.event_name, body.ticket_cost);
            res.status(201).json(result);
        } catch (err) {
            console.error('Failed to update event cost:', err);
            res.status(500).json({ message: err.toString() });
        }
        next();
    });

    router.put('/setEventCategory', async (req, res, next) => {
        try {
            const body = req.body;
            console.log(body);
            console.log(req.models);
            const result = await req.models.event.updateEventCategory(body.event_name, body.event_category);
            res.status(201).json(result);
        } catch (err) {
            console.error('Failed to update event category:', err);
            res.status(500).json({ message: err.toString() });
        }
        next();
    });

    router.delete('/deleteEvent', async (req, res, next) => {
        try {
            const body = req.body;
            console.log(body);
            console.log(req.models);
            const result = await req.models.event.deleteEvent(body.event_name);
            res.status(201).json(result);
        } catch (err) {
            console.error('Failed to delete event:', err);
            res.status(500).json({ message: err.toString() });
        }
        next();
    });

 module.exports = router;