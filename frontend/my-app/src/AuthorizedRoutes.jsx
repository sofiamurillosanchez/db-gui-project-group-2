import { LogInForm } from "./components";
import { HomePage } from "./components";
import {LogInPage} from "./components"
import { EditProfilePage } from "./components/pages";
export const AuthorizedRoutes = () => [
    { path: '', element: <LogInPage/>},
    { path: 'new', element: <EditProfilePage />},
    { path: 'edit/:accountId', element: <EditProfilePage />}
    //{ path: '', element: <HomePage/>}
    
];