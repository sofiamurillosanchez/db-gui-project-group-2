const express = require('express');
const router = express.Router();

router.get('/getByIP_Address', async (req, res, next) =>{
    try{
    const body = req.body;
    const result = await req.models.BannedIPs_Superlist.findbannedpersonbyIP(body.IP_Address);
    res.status(201).json(result);

    }catch(err)
    {

        console.error('Failed to find IP Address' , err);
        res.status(500).json({ message: err.toString() });

    }

});

router.get('/getByReport_ID', async (req, res, next) =>{
    try{
    const body = req.body;
    const result = await req.models.BannedIPs_Superlist.findbannedpersonbyIP(body.Report_ID);
    res.status(201).json(result);

    }catch(err)
    {

        console.error('failed to find Report ID' , err);
        res.status(500).json({ message: err.toString() });
    }
});


router.get('/addToBanList', async (req, res, next) =>{
    try {
        const body = req.body;
        const result = await req.models.BannedIPs_Superlist.addToBanList(body.IP_Address, body.Report_ID);
        res.status(201).json(result);
    } catch (err) {
        console.error('Failed to Add IP Address:' , err);
        res.status(500).json({ message: err.toString() });
    }
});

router.delete('/removeFromBanList', async (req, res, next) =>{
    try {
        const body = req.body;
        const result = await req.models.BannedIPs_Superlist.removeFromBanList(body.IP_Address);
        res.status(201).json(result);
    } catch (err) {
        console.error('Failed to Remove from ban list IP Address:' , err);
        res.status(500).json({ message: err.toString() });
    }
});


router.put('/updateIP_Address', async (req, res, next) => {
    try {
        const body = req.body;
        const result = await req.models.BannedIPs_Superlist.updateIP_Address(body.IP_Address);
        res.status(201).json(result);
    } catch (err) 
    {
        console.error('Failed to update the IP Address' , err);
        res.status(500).json({ message: err.toString() });
    }
});

router.get('/determineloc', async (req, res, next) => {
    try {
        const body = req.body;
        const result = await req.models.BannedIPs_Superlist.deter_location_of_Ip(body.IP_Address);
        res.status(201).json(result);
    } catch (err) {
        console.error('Failed to determine location:' , err);
        res.status(500).json({ message: err.toString() });
    }
})


module.exports=router;