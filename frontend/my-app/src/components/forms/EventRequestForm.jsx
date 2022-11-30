import React from 'react';
import { useState, useEffect } from 'react';
import {TextField} from '../common/textField';
import {TextAreaField} from '../common/textAreaField';

export const EventRequestForm = ({}) => {

    const [eventName, setEventName] = useState('');
    const [eventDate, setEventDate] = useState('');
    const [eventTime, setEventTime] = useState('');
    const [eventLocation, setEventLocation] = useState('');
    const [eventDescription, setEventDescription] = useState('');

    return <>
        <div>
            <TextField label="EventName"
                        value={ eventName } 
                        setValue={ setEventName } />
            <TextField label="EventDate"
                        value={ eventDate }
                        setValue={ setEventDate } />
            <TextField label="EventTime"
                        value={ eventTime } 
                        setValue={ setEventTime } />
            <TextField label="EventLocation"
                        value={ eventLocation }
                        setValue={ setEventLocation } />
            <TextAreaField label="EventDescription"
                            value={ eventDescription }
                            setValue={ setEventDescription }/>
            <button type="button"
                    onClick={ () => {
                        // onReviewAdded()
                        setEventName('');
                        setEventDate('');
                        setEventTime('');
                        setEventLocation('');
                        setEventDescription('');
                    }
                }>Submit
            </button>
        </div>
    </>
}