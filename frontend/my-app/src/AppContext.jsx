import { useEffect, useMemo, useState, createContext } from "react";

export const AppContext = createContext(null);

export const AppProvider = ({ children }) => {

    const [ userID, setUserID ] = useState(sessionStorage.userID);

    const context = useMemo(() => ({ userID, setUserID }), [ userID ]);

    useEffect(() => {
        if (userID) {
            sessionStorage.userID = userID;
        }
    }, [ userID ]);

    return <AppContext.Provider value={context}>
        { children }
    </AppContext.Provider>
}