import axios from "axios";
// import {url} from "../App"
const ec2_url = 'ec2-52-205-137-65.compute-1.amazonaws.com'
  // CHANGE THIS TO TRUE IF HOSTING ON EC2, MAKE SURE TO ADD IP/URL ABOVE
const ec2 = true;
  // USE localhost OR ec2_url ACCORDING TO ENVIRONMENT
const url = ec2 ? ec2_url : 'localhost'


/*User API */
export const getAuthenticatedUser = () => new Promise((resolve, reject) => {
    axios.get(`http://${url}:8000/authenticateUser`)
        .then(x => resolve(x.data))
        .catch(x => {
            alert(x);
            reject(x);
        });
});

export const getByEmail = () => new Promise((resolve, reject) => {
    axios.get(`http://${url}:8000/getByEmail`)
        .then(x => resolve(x.data))
        .catch(x => {
            alert(x);
            reject(x);
        });
});

export const getByLocation = () => new Promise((resolve, reject) => {
    axios.get(`http://${url}:8000/getByLocation`)
        .then(x => resolve(x.data))
        .catch(x => {
            alert(x);
            reject(x);
        });
});

export const getByIP = () => new Promise((resolve, reject) => {
    axios.get(`http://${url}:8000/getByIP`)
        .then(x => resolve(x.data))
        .catch(x => {
            alert(x);
            reject(x);
        });
});

export const getTaggedUser = () => new Promise((resolve, reject) => {
    axios.get(`http://${url}:8000/getTaggedUser`)
        .then(x => resolve(x.data))
        .catch(x => {
            alert(x);
            reject(x);
        });
});

/* Ticket API */

export const getTicketID= () => new Promise((resolve, reject) => {
    axios.get(`http://${url}:8000/getTicketID`)
        .then(x => resolve(x.data))
        .catch(x => {
            alert(x);
            reject(x);
        });
});

export const getByEventID= () => new Promise((resolve, reject) => {
    axios.get(`http://${url}:8000/getByEventID`)
        .then(x => resolve(x.data))
        .catch(x => {
            alert(x);
            reject(x);
        });
});

/* Event API*/
export const getEvent= () => new Promise((resolve, reject) => {
    axios.get(`http://${url}:8000/getEvent`)
        .then(x => resolve(x.data))
        .catch(x => {
            alert(x);
            reject(x);
        });
});

export const getEventByLocation= (location) => new Promise((resolve, reject) => {
    axios.get(`http://${url}:8000/getEventByLocation?location=${location}`)
        .then(x => resolve(x.data))
        .catch(x => {
            alert(x);
            reject(x);
        });
});

export const getEventByLocationandDate = (location, date) => new Promise((resolve, reject) => {
    axios.get(`http://${url}:8000/getEventByLocationandDate?location=${location}&date=${date}`)
        .then(x => resolve(x.data))
        .catch(x => {
            alert(x);
            reject(x);
        });
});

export const getEventByCateogry= (category) => new Promise((resolve, reject) => {
    axios.get(`http://${url}:8000/getEventByCateogry?category=${category}`)
        .then(x => resolve(x.data))
        .catch(x => {
            alert(x);
            reject(x);
        });
});

export const getEventByHost = (host) => new Promise((resolve, reject) => {
    axios.get(`http://${url}:8000/getEventByHost?host=${host}`)
        .then(x => resolve(x.data))
        .catch(x => {
            alert(x);
            reject(x);
        });
});

export const postEvent = (host) => new Promise((resolve, reject) => {
    axios.get(`http://${url}:8000/postEvent?host=${host}`)
        .then(x => resolve(x.data))
        .catch(x => {
            alert(x);
            reject(x);
        });
});

/* Event Request API*/
export const getEvent_RequestByID = (Request_ID) => new Promise((resolve, reject) => {
    axios.get(`http://${url}:8000/getEvent_RequestByID?Request_ID=${Request_ID}`)
        .then(x => resolve(x.data))
        .catch(x => {
            alert(x);
            reject(x);
        });
});

export const getEvent_RequestByBusinessID = (Business_ID) => new Promise((resolve, reject) => {
    axios.get(`http://${url}:8000/getEvent_RequestByBusinessID?Business_ID=${Business_ID}`)
        .then(x => resolve(x.data))
        .catch(x => {
            alert(x);
            reject(x);
        });
});

export const getEvent_RequestByHostID = (Host_ID) => new Promise((resolve, reject) => {
    axios.get(`http://${url}:8000/getEvent_RequestByHostID?Host_ID=${Host_ID}`)
        .then(x => resolve(x.data))
        .catch(x => {
            alert(x);
            reject(x);
        });
});

/* Business API */
