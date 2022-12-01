import {BannedUserList} from "../domain/BannedUserList";

export const AdminToolsPage = () => {
    return <>
        <h1>AdminToolsPage</h1>
        <BannedUserList></BannedUserList>
        <button>View Reports</button>
    </>
}