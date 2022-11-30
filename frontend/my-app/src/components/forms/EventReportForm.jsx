import React from 'react';
import { useState, useEffect } from 'react';
import {TextField} from '../common/textField';

export const EventReportForm = ({}) => {
    
    const [reportDescription, setReportDescription] = useState('');

    return <>
        <div>
            <TextField label="ReportDescription"
                        value={ reportDescription }
                        setValue={ setReportDescription} />
            <button type="button"
                    onClick={() => {
                        setReportDescription('');
                    }
                }>Submit
            </button>
        </div>
    </>
}