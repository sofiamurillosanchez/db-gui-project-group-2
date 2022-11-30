import React from 'react';
import { useState, useEffect } from 'react';
import {TextField} from '../common/textField';
import {TextAreaField} from '../common/textAreaField';

export const EditEventForm = ({}) => {

    const [newEventName, setNewEventName] = useState('');
    const [newEventDate, setNewEventDate] = useState('');
    const [newEventTime, setNewEventTime] = useState('');
    const [newEventLocation, setNewEventLocation] = useState('');
    const [newEventDescription, setNewEventDescription] = useState('');

    return <>
        <div>
            <TextField label="NewEventName"
                        value={ newEventName } 
                        setValue={ setNewEventName } />
            <TextField label="NewEventDate"
                        value={ newEventDate }
                        setValue={ setNewEventDate } />
            <TextField label="NewEventTime"
                        value={ newEventTime } 
                        setValue={ setNewEventTime } />
            <TextField label="NewEventLocation"
                        value={ newEventLocation }
                        setValue={ setNewEventLocation } />
            <TextAreaField label="NewEventDescription"
                            value={ newEventDescription }
                            setValue={ setNewEventDescription }/>
            {/* <button type="button"
                    onClick={ () => {
                        // onReviewAdded()
                        setEventName('');
                        setEventDate('');
                        setEventTime('');
                        setEventLocation('');
                        setEventDescription('');
                    }
                }>Update
            </button> */}
        </div>
    </>
}