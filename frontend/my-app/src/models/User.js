export class User {
    constructor(username, password, email, phone_number, role, company, user_location,
                user_ID, name, dob, is_host
                ){
        this.username = username;
        this.password = password;
        this.email = email;
        this.phone_number = phone_number;
        this.role = role;
        this.company =company;
        this.user_location =user_location;
        this.user_ID =user_ID;
        this.name =name;
        this.dob =dob;
        this.is_host =is_host;
    }
}