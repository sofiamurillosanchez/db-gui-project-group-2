import { BrowserRouter, Route, Routes } from "react-router-dom";
import { AuthorizedRoutes } from "../../AuthorizedRoutes";
import { LogInForm } from "../forms";
import { AdminToolsPage, EventHostPage, HomePage } from "../pages";
import { AuthorizedContent, Login } from './../common';

export const Router = () => <BrowserRouter>
    <Routes>
        <Route path="login" element={<LogInForm/>} />
        <Route path="homePage" element={<HomePage />} />
        <Route path="AdminTools" element={<AdminToolsPage/>} />
        <Route path="EventTools" element={<EventHostPage />} />
        
        <Route element={<AuthorizedContent/>}>
            {
                AuthorizedRoutes().map((route, index) => <Route key={index} { ...route } />)
            }
        </Route>
    </Routes>
</BrowserRouter>