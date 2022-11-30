const express = require('express');
const router = express.Router();

    router.get('/', async (req, res, next) => {
        try {
            const body = req.body;
            const result = await req.models.event.getAllEvents();
            res.status(201).json(result);
        } catch (err) {
            console.error('Failed to load current events:' , err);
            res.status(500).json({ message: err.toString() });
        }
    });
    
    router.get('/getEvent', async (req, res, next) => {
        try {
            const body = req.body;
            const result = await req.models.event.findEventByName(body.Event_name);
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
            const result = await req.models.event.findEventByLocation(body.Event_Location_Name);
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
            const result = await req.models.event.findEventByLocationandDate(body.Event_Location_Name, body.Start_Date);
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
            const result = await req.models.event.findEventByCategory(body.Event_Category);
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
            const result = await req.models.event.findEventByHost(body.Host_Name);
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
            const result = await req.models.event.createNewEvent(body.Event_id, body.Event_name, body.Event_description, body.Host_Name, 
            body.Host_Contact_Information, body.Start_Date, body.End_Date, body.Start_Time, body.End_Time, body.Num_Expected_Attendees, body.Max_Capacity, 
            body.Event_Location_Name, body.Event_Location_Address, body.Dress_Code, body.Ticket_Cost, body.Event_Type, body.Event_Category);
            res.status(201).json(result);
        } catch (err) {
            console.error('Failed to create new event:', err);
            res.status(500).json({ message: err.toString() });
        }
        next();
        });

    
    router.put('/updateEvent', async (req, res, next) => {
        try {
            const body = req.body;
            console.log(body);
            console.log(req.models);
            const result = await req.models.event.updateEvent(body.Event_name, body.Start_Date, body.End_Date, 
                                                              body.Start_Time, body.End_Time, body.Event_Location_Name, body.Event_description);
            res.status(201).json(result);
        } catch (err) {
            console.error('Failed to update event:', err);
            res.status(500).json({ message: err.toString() });
        }
        next();
    });
                
    router.put('/setEventName', async (req, res, next) => {
        try {
            const body = req.body;
            console.log(body);
            console.log(req.models);
            const result = await req.models.event.updateEventName(body.Event_id, body.Event_name);
            res.status(201).json(result);
        } catch (err) {
            console.error('Failed to set event name:', err);
            res.status(500).json({ message: err.toString() });
        }
        next();
    });

    //router.put('/setImageUrl', async (req, res, next) => {
      //  try {
        //    const body = req.body;
          //  console.log(body);
            //console.log(req.models);
           // const result = await req.models.event.setImageUrl(body.Event_id, body.Event_Image);
           // res.status(201).json(result);
      //  } catch (err) {
   //         console.error('Failed to set image url:', err);
  //          res.status(500).json({ message: err.toString() });
//        }
   //     next(); 
//    });

    router.put('/setDescription', async (req, res, next) => {
        try {
            const body = req.body;
            console.log(body);
            console.log(req.models);
            const result = await req.models.event.setDescription(body.Event_id, body.Event_description);  
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
            const result = await req.models.event.updateEventDate(body.Event_id, body.Start_Date, body.End_Date);
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
            const result = await req.models.event.updateEventTime(body.Event_id, body.Start_Time, body.End_Time);
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
            const result = await req.models.event.updateEventCapacity(body.Event_id, body.Max_Capacity);
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
        const result = await req.models.event.updateEventLocation(body.Event_id, body.Event_Location_Name, body.Event_Location_Address);
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
            const result = await req.models.event.updateEventCost(body.Event_id, body.Ticket_Cost);
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
            const result = await req.models.event.updateEventCategory(body.Event_id, body.Event_Category);
            res.status(201).json(result);
        } catch (err) {
            console.error('Failed to update event category:', err);
            res.status(500).json({ message: err.toString() });
        }
        next();
    });

    router.put('/setHostContactInfo', async (req, res, next) => {
        try {
            const body = req.body;
            console.log(body);
            console.log(req.models);
            const result = await req.models.event.updateHostContactInfo(body.Event_id, body.Host_Name, body.Host_Contact_Information);
            res.status(201).json(result);
        } catch (err) {
            console.error('Failed to update host contact info:', err);
            res.status(500).json({ message: err.toString() });
        }
        next();
    });

    router.delete('/deleteEvent', async (req, res, next) => {
        try {
            const body = req.body;
            console.log(body);
            console.log(req.models);
            const result = await req.models.event.deleteEvent(body.Event_id);
            res.status(201).json(result);
        } catch (err) {
            console.error('Failed to delete event:', err);
            res.status(500).json({ message: err.toString() });
        }
        next();
    });

 module.exports = router;
