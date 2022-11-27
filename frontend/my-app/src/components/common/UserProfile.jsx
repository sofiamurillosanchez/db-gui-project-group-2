export const UserProfile = ({user}) => 
    <div className="user-profile">
        <h1 className="user-name">{user.username}</h1>
        <p className="user-email">{user.email}</p>
        <p className="user-phone">{user.phone_number}</p>
        <button>button</button>
    </div>
