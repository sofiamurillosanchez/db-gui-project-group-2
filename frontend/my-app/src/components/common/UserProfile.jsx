export const UserProfile = ({user}) =>  {
    if(!user){
        return <>User not found</>
    }
    return<>
    <div className="user-profile">
        <h1 className="user-name">Username: {user.username}</h1>
        <p className="user-email">Email: {user.email}</p>
        <p className="user-phone">Phone: {user.phone_number}</p>
        <button>Edit Profile</button>
    </div>
    </>
}
