import { useNavigate, useParams } from "react-router-dom";
import { AdminToolsPage } from "./AdminToolsPage";
export const HomePage = () => {
    // useEffect(() => {
    //     if (params.accountID) {
    //         getAccount(params.accountID).then(x => setAccount(x));
    //     } else {
    //         setAccount({ phoneNumbers: []});
    //     }
    // }, []);
    const params = useParams();
    const navigate = useNavigate();
return <>
    <div className="homepage-container">
        {}
        <h1>Hello {params.userID} </h1>
        <div className="navbar-container">
            <div className="button-container">
                <button className="sign-up-link">
                    Sign Up
                </button>
                <button className="sign-in-link">
                    Sign In 
                </button>
                <button className="sign-out-link">
                    Sign Out
                </button>
            </div>

        </div>
        <div className="link-container">
            <table>
                <tr>
                    <td>
                        <div className="admin-tools-link">
                        <button
                        onClick={navigate('AdminTools')}
                        ><h1>Admin Tools</h1></button>
                        </div>
                    </td>
                    <td>
                        <div className="event-tools-link">
                        <button
                        onClick={navigate('EventTools')}
                        ><h1>Event Tools</h1></button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div className="event-host-link">
                        <button
                        onClick={navigate('EventHost')}
                        ><h1>Event Host</h1></button>
                        </div>
                    </td>
                    <td>
                        <div className="my-profile-link">
                            <button
                            onClick={navigate('ProfilePage')}
                            ><h1>My Profile</h1></button>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>


</>
}
/*
Button to Sign Up page
Button to Sign In page
Button to Sign Out
Nav Bar
Admin Tools Link
Event Host Link
Event Tools Link
My Profile Link
*/