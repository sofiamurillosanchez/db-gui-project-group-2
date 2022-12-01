import React from 'react';
import { useContext } from "react"
import { useState, useEffect } from 'react';
import { Navigate, useNavigate, useParams,useLocation } from "react-router-dom";
import {TextField} from '../common/textField';
import { addAccount, getAccountByID, updateAccount } from "../../api";
import { AppContext } from '../../AppContext';
export const LogInForm = ({}) => {
    const params = useParams();
    const navigate = useNavigate();
    const location = useLocation();
    const [userName, setUserName] = useState('');
    const [password, setPassword] = useState('');
    const [userID, setUserID] = useState('');
    const context = useContext(AppContext);
    const handleSaveClick = () => {
        navigate('/');
        // if (params.accountId) {
        //     updateAccount(account.id, account).then(x => navigate('/'));
        // } else {
        //     addAccount(account).then(x => navigate('/'));
        // }
    }
    return <>
        <div>
            <TextField label="Username"
                        value={ userID } 
                        setValue={ setUserID } />
            <TextField label="Password"
                        value={ password }
                        setValue={ setPassword } />
            <button type="button"
                    onClick={ () => {
                        context.setUserID(userName);
                        navigate('/HomePage');
                        //navigate(location.state?.from || '/HomePage');
                        //handleSaveClick();
                        //setUserName('');
                        //setPassword('');
                    }
                }>Submit
            </button>
        </div>
    </>
}

export default LogInForm;