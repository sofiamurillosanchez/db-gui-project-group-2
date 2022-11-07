const express = require('express');
const router = express.Router();
//this is authenticated user
    router.get('/getByEmail', async (req, res, next) => {
    try {
        const result = await req.models.user.findUserByEmail(req.body.email);
        res.status(201).json(result);
    } catch (err) {
        console.error('Failed to load current user:' , err);
        res.status(500).json({ message: err.toString() });
    }
    });

    router.get('/getByName', async (req, res, next) => {
        try {
            const result = await req.models.user.findUserByName(req.body.name);
            res.status(201).json(result);
        } catch (err) {
            console.error('Failed to load current user:' , err);
            res.status(500).json({ message: err.toString() });
        }
    });

    router.get('/getByLocation', async (req, res, next) => {
        try {
            const result = await req.models.user.findUserByLocation(req.body.location);
            res.status(201).json(result);
        } catch (err) {
            console.error('Failed to load current user:' , err);
            res.status(500).json({ message: err.toString() });
        }
    });

    router.get('/getByIP', async (req, res, next) => {
        try {
            const result = await req.models.user.findUserByIP(req.body.c);
            res.status(201).json(result);
        } catch (err) {
            console.error('Failed to load current user:' , err);
            res.status(500).json({ message: err.toString() });
        }
    });

    router.post('/createUser', async (req, res, next) => {
        try {
            const body = req.body;
            console.log(body);
            console.log(req.models);
            const result = await req.models.user.createNewUser(body.email, body.password);
            res.status(201).json(result);
        } catch (err) {
            console.error('Failed to create new user:', err);
            res.status(500).json({ message: err.toString() });
        }
        next();
    });

    router.put('/setCompany', async (req, res, next) => {
        try {
            const body = req.body;
            console.log(body);
            console.log(req.models);
            const result = await req.models.user.updateCompany(body.email, body.company);
            res.status(201).json(result);
        } catch (err) {
            console.error('Failed to update company:', err);
            res.status(500).json({ message: err.toString() });
        }
        next();
    });

    router.put('/setRole', async (req, res, next) => {
        try {
            const body = req.body;
            console.log(body);
            console.log(req.models);
            const result = await req.models.user.updateRole(body.email, body.role);
            res.status(201).json(result);
        } catch (err) {
            console.error('Failed to update role:', err);
            res.status(500).json({ message: err.toString() });
        }
        next();
    });

    router.put('/setLocation', async (req, res, next) => {
        try {
            const body = req.body;
            console.log(body);
            console.log(req.models);
            const result = await req.models.user.updateLocation(body.email, body.location);
            res.status(201).json(result);
        } catch (err) {
            console.error('Failed to update location:', err);
            res.status(500).json({ message: err.toString() });
        }
        next();
    });

    router.put('/setUsername', async (req, res, next) => {
        try {
            const body = req.body;
            console.log(body);
            console.log(req.models);
            const result = await req.models.user.updateUsername(body.email, body.username);
            res.status(201).json(result);
        } catch (err) {
            console.error('Failed to update username:', err);
            res.status(500).json({ message: err.toString() });
        }
        next();
    });

    router.delete('/deleteUser', async (req, res, next) => {
        try {
            const body = req.body;
            console.log(body);
            console.log(req.models);
            const result = await req.models.user.deleteUser(body.email);
            res.status(201).json(result);
        } catch (err) {
            console.error('Failed to delete user:', err);
            res.status(500).json({ message: err.toString() });
        }
        next();
    });


 module.exports = router;