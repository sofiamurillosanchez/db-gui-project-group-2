const express = require('express');
const router = express.Router();

router.post('/createTicket', async (req, res, next) => {
    try {
        const body = req.body;
        const result = await req.models.ticket.createNewTicket(body.Ticket_ID, body.User_Email, body.Event_ID);
        res.status(201).json(result);
    } catch (err) {
        console.error('Failed to create ticket:' , err);
        res.status(500).json({ message: err.toString() });
    }
});

router.get('/', async (req, res, next) => {
    try {
        const result = await req.models.ticket.getAllTickets();
        res.status(200).json(result);
    } catch (err) {
        console.error('Failed to get all tickets:' , err);
        res.status(500).json({ message: err.toString() });
    }
});

router.get('/getByTicketID', async (req, res, next) => {
    try {
        const body = req.body;
        const result = await req.models.ticket.findTicketByID(body.Ticket_ID); 
        res.status(201).json(result);
        } catch (err) {
            console.error('Failed to load current ticket:' , err);
            res.status(500).json({ message: err.toString() });
        }
});

router.get('/getByUserEmail', async (req, res, next) => {
    try {
        const body = req.body;
        const result = await req.models.ticket.findTicketByUserEmail(body.User_Email);
        res.status(201).json(result);
        } catch (err) {
            console.error('Failed to load current ticket:' , err);
            res.status(500).json({ message: err.toString() });
        }
});

router.get('/getByEventID', async (req, res, next) => {
    try {
        const body = req.body;
        const result = await req.models.ticket.findTicketByEventID(body.Event_ID);
        res.status(201).json(result);
        } catch (err) {
            console.error('Failed to load current ticket:' , err);
            res.status(500).json({ message: err.toString() });
        }
});

router.delete('/deleteTicket', async (req, res, next) => {
    try {
        const body = req.body;
        const result = await req.models.ticket.deleteTicket(body.Ticket_ID);
        res.status(201).json(result);
        } catch (err) {
            console.error('Failed to delete ticket:' , err);
            res.status(500).json({ message: err.toString() });
        }
});

module.exports = router;
