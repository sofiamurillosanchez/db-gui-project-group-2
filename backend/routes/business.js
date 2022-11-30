const { Router } = require('express');
const express = require('express');
const router = express.Router();

router.post('/createBusiness', async (req, res, next) => {
    try {
        const body = req.body;
        const result = await req.models.business.createBusiness(body.Business_ID, body.Business_Name, body.Business_Location, 
                                                                body.Email, body.Phone_Number, body.Rating);
        res.status(201).json(result);
    } catch (err) {
        console.error('Failed to create business:' , err);
        res.status(500).json({ message: err.toString() });
    }
});

router.get('/', async (req, res, next) => {
    try {
        const result = await req.models.business.getAllBusinesses();
        res.status(200).json(result);
    } catch (err) {
        console.error('Failed to get all businesses:' , err);
        res.status(500).json({ message: err.toString() });
    }
});

router.get('/getByID', async (req, res, next) => {
    try {
        const body = req.body;
        const result = await req.models.business.findBusinessByID(body.Business_ID);
        res.status(201).json(result);
    } catch (err) {
        console.error('Failed to load current business:' , err);
        res.status(500).json({ message: err.toString() });
    }
});

router.get('/getByName', async (req, res, next) => {
    try {
        const body = req.body;
        const result = await req.models.business.findBusinessByName(body.Business_Name);
        res.status(201).json(result);
    } catch (err) {
        console.error('Failed to load current business:' , err);
        res.status(500).json({ message: err.toString() });
    }
});

router.get('/getByLocation', async (req, res, next) => {
    try {
        const body = req.body;
        const result = await req.models.business.findBusinessByLocation(body.Business_Location);
        res.status(201).json(result);
    } catch (err) {
        console.error('Failed to load current business:' , err);
        res.status(500).json({ message: err.toString() });
    }
});

router.get('/getByRating', async (req, res, next) => {
    try {
        const body = req.body;
        const result = await req.models.business.findBusinessByRating(body.Rating);
        res.status(201).json(result);
    } catch (err) {
        console.error('Failed to load current business:' , err);
        res.status(500).json({ message: err.toString() });
    }
});

router.put('/updateBusinessName', async (req, res, next) => {
    try {
        const body = req.body;
        const result = await req.models.business.updateBusinessName(body.Business_ID, body.Business_Name);
        res.status(201).json(result);
    } catch (err) {
        console.error('Failed to update business name:' , err);
        res.status(500).json({ message: err.toString() });
    }
});

router.put('/updateBusinessLocation', async (req, res, next) => {
    try {
        const body = req.body;
        const result = await req.models.business.updateBusinessLocation(body.Business_ID, body.Business_Location);
        res.status(201).json(result);
    } catch (err) {
        console.error('Failed to update business location:' , err);
        res.status(500).json({ message: err.toString() });
    }
});

router.put('/updateBusinessEmail', async (req, res, next) => {
    try {
        const body = req.body;
        const result = await req.models.business.updateBusinessEmail(body.Business_ID, body.Email);
        res.status(201).json(result);
    } catch (err) {
        console.error('Failed to update business email:' , err);
        res.status(500).json({ message: err.toString() });
    }
});

router.put('/updateBusinessPhoneNumber', async (req, res, next) => {
    try {
        const body = req.body;
        const result = await req.models.business.updateBusinessPhoneNumber(body.Business_ID, body.Phone_Number);
        res.status(201).json(result);
    } catch (err) {
        console.error('Failed to update business phone number:' , err);
        res.status(500).json({ message: err.toString() });
    }
});

router.put('/updateBusinessRating', async (req, res, next) => {
    try {
        const body = req.body;
        const result = await req.models.business.updateBusinessRating(body.Business_ID, body.Rating);
        res.status(201).json(result);
    } catch (err) {
        console.error('Failed to update business rating:' , err);
        res.status(500).json({ message: err.toString() });
    }
});

router.delete('/deleteBusiness', async (req, res, next) => {
    try {
        const body = req.body;
        const result = await req.models.business.deleteBusiness(body.Business_ID);
        res.status(201).json(result);
    } catch (err) {
        console.error('Failed to delete business:' , err);
        res.status(500).json({ message: err.toString() });
    }
});

module.exports = router;