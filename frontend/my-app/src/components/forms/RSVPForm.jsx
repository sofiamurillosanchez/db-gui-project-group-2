import React from 'react';
import { useState, useEffect } from 'react';
import {TextField} from '../common/textField';
import { SelectField } from '../common/SelectField';

export const RSVPForm = ({}) => {

    const RSVPOptions = [
        {value: 1, label: 'I will attend'},
        {value: 2, label: 'I will not attend'}
    ];

    const [rsvp, setRSVP] = useState('');


    return <>
        <div>
            <SelectField label="RSVP"
                            value={rsvp}
                            setValue={setRSVP}
                            options={RSVPOptions}
                            optionalValueKey="value"
                            optionLabelKey="label"/>
            <button type="button" 
                    onClick={ () => {
                        setRSVP('');
                    }
                }>Submit
            </button>
        </div>
    </>
}