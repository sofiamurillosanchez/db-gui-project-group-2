const express = require('express');
const router = express.Router();
//non authenticated user?
router.post('/', async (req, res, next) => {
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

module.exports = router;