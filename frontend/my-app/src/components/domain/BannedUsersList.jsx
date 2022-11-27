export const BannedUsersList = ({users}) =>
<div className="Event-Scroller">
<ul className="list-group mt-4 mb-4" style={{listStyleType: "none"}}>
    {
        
        users.map((user, index) =>
        <li key={index} className="list-group-item">
            <h2>{user.username}</h2>
            <br></br>
            <span className="role">Role: {user.role}</span>
            <br></br>
            <span className="user-id">ID: {user.user_ID}</span>
            <br></br>
            <span className="dob">DOB: {user.dob}</span>
            <br></br>
            <button>reinstate</button>
            <span className="clearfix"></span>
        </li>
        )

    }
</ul>

</div>;

//username, password, email, phone_number, role, company, user_location,
//user_ID, name, dob, is_host