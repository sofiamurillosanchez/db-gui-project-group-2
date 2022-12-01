import React from 'react';
import { useState, useEffect } from 'react';
import {TextField} from '../common/textField';

export const EditProfileForm = ({}) => {

    const [newUserName, setNewUserName] = useState('');
    const [newPassword, setNewPassword] = useState('');
    const [newEmail, setNewEmail] = useState('');
    const [newPhoneNumber, setNewPhoneNumber] = useState('');

    return <>
        <div>
            <TextField label="NewUsername"
                        value={ newUserName } 
                        setValue={ setNewUserName } />
            <TextField label="NewPassword"
                        value={ newPassword }
                        setValue={ setNewPassword } />
            <TextField label="NewEmail"
                        value={ newEmail } 
                        setValue={ setNewEmail } />
            <TextField label="NewPhoneNumber"
                        value={ newPhoneNumber }
                        setValue={ setNewPhoneNumber } />
            {/* <button type="button"
                    onClick={ () => {
                        // onReviewAdded()
                        setUserName('');
                        setPassword('');
                        setEmail('');
                        setPhoneNumber('');
                    }
                }>Update
            </button> */}
        </div>
    </>

}