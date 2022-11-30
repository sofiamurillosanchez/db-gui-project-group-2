import React from 'react';
import { useState, useEffect } from 'react';
import {TextField} from '../common/textField';

export const LogInForm = ({}) => {

    const [userName, setUserName] = useState('');
    const [password, setPassword] = useState('');

    return <>
        <div>
            <TextField label="Username"
                        value={ userName } 
                        setValue={ setUserName } />
            <TextField label="Password"
                        value={ password }
                        setValue={ setPassword } />
            <button type="button"
                    onClick={ () => {
                        // onReviewAdded()
                        setUserName('');
                        setPassword('');
                    }
                }>Submit
            </button>
        </div>
    </>
}

export default LogInForm;