import { EventFilterForm } from "../forms/EventFilterForm";
import {ActiveEventList} from "../domain/ActiveEventList"

export const EventBrowserPage = () => {
    return <>
        <h1>Event Browser Page</h1>
        <EventFilterForm></EventFilterForm>
        <ActiveEventList></ActiveEventList>
    </>
}