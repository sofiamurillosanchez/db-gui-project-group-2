export const HomePage = () => 
<>
    <div className="homepage-container">
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
                            <h1>Admin Tools</h1>
                        </div>
                    </td>
                    <td>
                        <div className="event-tools-link">
                            <h1>Event Tools</h1>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div className="event-host-link">
                            <h1>Event Host</h1>
                        </div>
                    </td>
                    <td>
                        <div className="my-profile-link">
                            <h1>My Profile</h1>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>


</>

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