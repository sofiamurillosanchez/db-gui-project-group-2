import React, { useEffect, useState } from 'react';
import './App.css';
import axios from 'axios';
import { UserProfile} from "./components";
import { ActiveEventList } from './components/domain';
import { User, Event } from './models';
// React functional component
function App () {
  // state for storage of the information on the webpage of forms and list, uses hooks
  const [number, setNumber] = useState("")
  const [values, setValues] = useState([])

  // ENTER YOUR EC2 PUBLIC IP/URL HERE
  const ec2_url = ''
  // CHANGE THIS TO TRUE IF HOSTING ON EC2, MAKE SURE TO ADD IP/URL ABOVE
  const ec2 = false;
  // USE localhost OR ec2_url ACCORDING TO ENVIRONMENT
  const url = ec2 ? ec2_url : 'localhost'

  // handle input field state change
  const handleChange = (e) => {
    setNumber(e.target.value);
  }

  const fetchBase = () => {
    axios.get(`http://${url}:8000/`).then((res)=>{
      alert(res.data);
    })
  }

  // fetches vals of db via GET request
  const fetchVals = () => {
    axios.get(`http://${url}:8000/values`).then(
      res => {
        const values = res.data.data;
        console.log(values);
        setValues(values)
    }).catch(err => {
      console.log(err)
    });
  }

  // handle input form submission to backend via POST request
  const handleSubmit = (e) => {
    e.preventDefault();
    let prod = number * number;
    axios.post(`http://${url}:8000/multplynumber`, {product: prod}).then(res => {
      console.log(res);
      fetchVals();
    }).catch(err => {
      console.log(err)
    });;
    setNumber("");
  }

  // handle intialization and setup of database table, can reinitialize to wipe db
  const reset = () => {
    axios.post(`http://${url}:8000/reset`).then(res => {
      console.log(res);
      fetchVals();
    }).catch(err => {
      console.log(err)
    });;
  }

  // tell app to fetch values from db on first load (if initialized)
  // the comment below silences an error that doesn't matter.=
  useEffect(() => {
    fetchVals();
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [])
  //event_name, event_date, event_time, event_location, event_description
const event1 = new Event("world cup party", "may 1st 2001", "9:00", "rafe's house", "super fun world cup watch party");
const event2 = new Event("Birthday party", "November 20th 2000", "11:00", "joe's house", "Joe's birthday party");
const event3 = new Event("Birthday party", "November 20th 2000", "11:00", "joe's house", "Joe's birthday party");
const event4 = new Event("Birthday party", "November 20th 2000", "11:00", "joe's house", "Joe's birthday party");
const event5 = new Event("Birthday party", "November 20th 2000", "11:00", "joe's house", "Joe's birthday party");
const event6 = new Event("Birthday party", "November 20th 2000", "11:00", "joe's house", "Joe's birthday party");
var eventList = [];
eventList.push(event1);
eventList.push(event2);
eventList.push(event3);
eventList.push(event4);
eventList.push(event5);
eventList.push(event6);
const userTest = new User("rafef","password","rafe@icloud.com","7185551923", "admin");
  return (
    <div className="App">
      <header className="App-header">
        <button onClick={fetchBase} style={{marginBottom: '1rem'}}> {`GET: http://${url}:8000/`} </button>
        <button onClick={reset}> Reset DB </button>
        <form onSubmit={handleSubmit}>
          <input type="text" value={number} onChange={handleChange}/>
          <br/>
          <input type="submit" value="Submit" />
        </form>
        <ul>
          { values.map((value, i) => <li key={i}>{value.value}</li>) }
        </ul>
      </header>
      <UserProfile title="user-prof" user={userTest}> </UserProfile>
      <ActiveEventList events={eventList}></ActiveEventList>
    </div>
  );
}

export default App;
