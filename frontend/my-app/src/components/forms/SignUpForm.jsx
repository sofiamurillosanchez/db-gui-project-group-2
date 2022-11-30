import React from 'react';
import { useState, useEffect } from 'react';
import {TextField} from '../common/textField';

export const SignUpForm = ({}) => {

    const [userName, setUserName] = useState('');
    const [password, setPassword] = useState('');
    const [email, setEmail] = useState('');
    const [phoneNumber, setPhoneNumber] = usetState('');

    return <>
        <div>
            <TextField label="Username"
                        value={ userName } 
                        setValue={ setUserName } />
            <TextField label="Password"
                        value={ password }
                        setValue={ setPassword } />
            <TextField label="Email"
                        value={ email } 
                        setValue={ setEmail } />
            <TextField label="PhoneNumber"
                        value={ phoneNumber }
                        setValue={ setPhoneNumber } />
            <button type="button"
                    onClick={ () => {
                        // onReviewAdded()
                        setUserName('');
                        setPassword('');
                        setEmail('');
                        setPhoneNumber('');
                    }
                }>Submit
            </button>
        </div>
    </>



}

export default SignUpForm;