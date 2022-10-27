(app => {
    var isLoaded;

    app.logged_in_View = {
        load: function(){
                //gets email and password from submit form
                var email = document.getElementById('user-email').value;
                var password = document.getElementById('password').value;
                console.log(email);
                var temp = document.getElementsByTagName("template")[1];
                var frag = document.createDocumentFragment();
                let newNode = temp.content.cloneNode(true);
                newNode.querySelector("h1").innerText = "Hello, " + email;
                frag.append(newNode);
                document.querySelector("#logged-in-container").append(frag);
                app._changeView("logged-in-view");
                isLoaded = true;
        }
    }
    

})(app || (app = {}));