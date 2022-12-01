import {BannedUsersList} from "../domain/BannedUsersList";

export const AdminToolsPage = () => {
    return <>
        <h1>AdminToolsPage</h1>
        <BannedUsersList></BannedUsersList>
        <button>View Reports</button>
    </>
}